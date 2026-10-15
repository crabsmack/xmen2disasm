"""Turn compiler switch tables into symbolic data (S3 + recomp case targets), then rebuild.

    uv run tools/switches.py --dry-run
    uv run tools/switches.py

Pattern (MPW C switch):     add.w  dN,dN
                            move.w $T(pc,dN.w),dN
                            jmp    $B(pc,dN.w)        ; B = T - 2 (the jmp's extension word)
with a table of signed word offsets from B at T (raw incrom right after the function).
Each entry must land on a disassembled instruction (case bodies may follow the table in their
own src/f files); the table ends at the incrom span end or
the first entry that does not. The incrom bytes become
    Sw_XXXXXX:  ; switch table of the function at $XXXXXX: N word offsets from Sw_XXXXXX-2
        dc.w loc_A-(Sw_XXXXXX-2), loc_B-(Sw_XXXXXX-2), ...
and the two operands become Sw_XXXXXX(pc,dN.w) / Sw_XXXXXX-2(pc,dN.w). Missing case labels
are inserted as loc_XXXXXX.
"""
from __future__ import annotations

import argparse
import bisect
import re
import struct
import sys
from pathlib import Path

import build
import convert

ROOT = build.ROOT
ROW = re.compile(r"^\(\d+\)\s+(\d+)/\s*([0-9A-F]+) : ([0-9A-F ]+?)\s{2,}(.*)$")
MOVE = re.compile(r"^\tmove\.w\t\$([0-9A-F]+)\(pc,(d\d)\.[wl]\),(d\d)\s*$")
JMP = re.compile(r"^\tjmp\t\$([0-9A-F]+)\(pc,(d\d)\.w\)\s*$")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--convert-cases", action="store_true", help="convert case targets that are still raw bytes (static evidence), then stop")
    a = ap.parse_args()
    rom = build.ROM.read_bytes()
    files = sorted((ROOT / "src" / "f").glob("*.asm"), key=lambda p: int(p.stem, 16))
    fstarts = [int(p.stem, 16) for p in files]
    lineno: dict[int, int] = {}
    for line in (ROOT / "build" / "xmen2.lst").read_text(encoding="latin-1").splitlines():
        m = ROW.match(line)
        if m and build.is_code_row(m.group(4)):
            lineno.setdefault(int(m.group(2), 16), int(m.group(1)))
    labels: dict[int, str] = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        name, _, v = line.partition("=$")
        if v and int(v, 16) in lineno:
            labels.setdefault(int(v, 16), name)
    main_path = ROOT / "xmen2.asm"
    main_lines = main_path.read_text().splitlines(keepends=True)
    texts = {p: p.read_text() for p in files}
    orig = dict(texts)
    orig_main = "".join(main_lines)
    inserts: dict[Path, dict[int, str]] = {}
    tables = []  # (T, n, name, entries)
    raw_cases: set[int] = set()

    def label_for(t: int) -> str:
        if t in labels:
            return labels[t]
        f = files[bisect.bisect_right(fstarts, t) - 1]
        name = f"loc_{t:06X}"
        inserts.setdefault(f, {})[lineno[t]] = name
        labels[t] = name
        return name

    raw = convert.incrom_spans([ln.rstrip("\n") for ln in main_lines])
    for p in files:
        fstart = int(p.stem, 16)
        lines = texts[p].splitlines(keepends=True)
        code = [(i, ln) for i, ln in enumerate(lines) if ln.startswith("\t")]
        for (i, ln), (j, ln2) in zip(code, code[1:]):
            m, m2 = MOVE.match(ln.split(";")[0].rstrip() + "\n"), JMP.match(ln2.split(";")[0].rstrip() + "\n")
            if not (m and m2) or int(m2.group(1), 16) != int(m.group(1), 16) - 2:
                continue
            t, b = int(m.group(1), 16), int(m2.group(1), 16)
            span = next(((k, s, e) for k, s, e in raw if s <= t < e), None)
            if span is None or span[1] != t:
                print(f"skip {p.stem}: table ${t:06X} is not the start of a raw incrom span")
                continue
            # table size from the bound check `cmpi.[bw] #$N,dX` a few instructions earlier
            bound = None
            for _ci, cl in reversed([c for c in code if c[0] < i][-6:]):
                mb = re.match(r"^\tcmpi\.[bwl]\t#\$([0-9A-F]+),d\d", cl)  # cmpi #N / bgt|bhi default
                mb = mb or re.match(r"^\tmoveq\t#\$([0-9A-F]+),d\d", cl)  # moveq #mask,dX / and.l dY,dX
                if mb:
                    bound = int(mb.group(1), 16) + 1
                    break
            if bound is None or t + 2 * bound > span[2]:
                print(f"skip {p.stem}: table ${t:06X}: no usable bound check (bound={bound})")
                continue
            entries = [b + struct.unpack(">h", rom[o:o + 2])[0] for o in range(t, t + 2 * bound, 2)]
            in_raw = [x for x in entries if any(s <= x < e for _k, s, e in raw)]
            mid = [x for x in entries if x not in lineno and x not in in_raw]
            if in_raw:
                raw_cases.update(in_raw)
            if mid:
                print(f"REVIEW {p.stem}: table ${t:06X} cases inside disassembled instructions: "
                      + " ".join(f"${x:06X}" for x in mid))
            if in_raw or mid:
                print(f"pending {p.stem}: table ${t:06X} ({bound} cases): {len(in_raw)} case(s) in raw bytes")
                continue
            name = f"Sw_{fstart:06X}" if not any(x[2] == f"Sw_{fstart:06X}" for x in tables) else f"Sw_{t:06X}"
            tables.append((t, len(entries), name, entries, p.stem))
            lines[i] = ln.replace(f"${m.group(1)}(pc", f"{name}(pc", 1)
            lines[j] = ln2.replace(f"${m2.group(1)}(pc", f"{name}-2(pc", 1)
        texts[p] = "".join(lines)
    # replace the incrom lines (back to front so indices stay valid)
    for t, n, name, entries, owner in sorted(tables, reverse=True):
        k, s, e = next((k, s, e) for k, s, e in raw if s == t)
        body = [f"{name}:\t; switch table of sub at ${int(owner, 16):06X}: {n} word offsets from {name}-2\n"]
        names = [label_for(x) for x in entries]
        for c in range(0, n, 4):
            body.append("\tdc.w\t" + ", ".join(f"{nm}-({name}-2)" for nm in names[c:c + 4]) + "\n")
        if t + 2 * n < e:
            body.append(f"\tincrom\t${t + 2 * n:06X},${e - t - 2 * n:X}\n")
        main_lines[k:k + 1] = body
        print(f"{name}: {n} cases at ${t:06X} ({owner})")
    for f, ins in inserts.items():
        lines = texts[f].splitlines(keepends=True)
        for ln in sorted(ins, reverse=True):
            lines.insert(ln - 1, f"{ins[ln]}:\n")
        texts[f] = "".join(lines)
    print(f"{len(tables)} switch table(s), {sum(len(v) for v in inserts.values())} new case label(s); "
          f"{len(raw_cases)} case target(s) still raw")
    if a.convert_cases and raw_cases and not a.dry_run:
        import subprocess
        f = ROOT / "build" / "switch_cases.txt"
        f.write_text("".join(f"{x:06X}\n" for x in sorted(raw_cases)), newline="\n")
        return subprocess.run([sys.executable, str(ROOT / "tools" / "convert.py"), "--entries-file", str(f),
                               "--skip-refused", "--entry-kind", "loc", "--evidence",
                               "static: switch-table case target (tools/switches.py: table after "
                               "`move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)"],
                              cwd=ROOT).returncode
    if a.dry_run or not tables:
        return 0
    for p, txt in texts.items():
        if txt != orig[p]:
            p.write_text(txt, newline="\n")
    main_path.write_text("".join(main_lines), newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p, txt in orig.items():
            p.write_text(txt, newline="\n")
        main_path.write_text(orig_main, newline="\n")
        print("switches: rolled back (build was not byte-identical)")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
