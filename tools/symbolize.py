"""Replace numeric operands that point at CODE with labels (S3), then rebuild (rolls back on failure).

    uv run tools/symbolize.py --dry-run     # list what would change
    uv run tools/symbolize.py               # apply

Covers `$XXXX(pc...)` and `($XXXX).l` operands in src/f whose target is inside an already
labelled raw data span (-> Name or Name+$off), or the start of a
disassembled instruction (e.g. `jmp $5E44(pc,d0.w)` into the branch table that follows it,
`pea $226B2(pc)` handing a routine to a callback). An existing label at the target is
reused; otherwise `loc_XXXXXX:` is inserted before the target instruction. Targets that are
raw data are left for label_data.py; targets inside an instruction are reported.
"""
from __future__ import annotations

import argparse
import bisect
import re
import sys
from pathlib import Path

import build

ROOT = build.ROOT
ROW = re.compile(r"^\(\d+\)\s+(\d+)/\s*([0-9A-F]+) : ([0-9A-F ]+?)\s{2,}(.*)$")
OPND = re.compile(r"\$([0-9A-F]+)(?=\(pc)|(?<=\()\$([0-9A-F]+)(?=\)\.l)")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    files = sorted((ROOT / "src" / "f").glob("*.asm"), key=lambda p: int(p.stem, 16))
    fstarts = [int(p.stem, 16) for p in files]
    # address -> line number within its include file, for instruction rows
    lineno: dict[int, int] = {}
    for line in (ROOT / "build" / "xmen2.lst").read_text(encoding="latin-1").splitlines():
        m = ROW.match(line)
        if m and build.is_code_row(m.group(4)):
            lineno.setdefault(int(m.group(2), 16), int(m.group(1)))
    labels: dict[int, str] = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        name, _, v = line.partition("=$")
        if v and not name.startswith("Tbl_") and int(v, 16) in lineno:
            labels.setdefault(int(v, 16), name)
    # labelled raw data spans (`Name:` line right before an incrom): operands into them -> Name(+off)
    import convert
    main_lines = (ROOT / "xmen2.asm").read_text().splitlines()
    dspans = []
    for i, s, e in convert.incrom_spans(main_lines):
        prev = main_lines[i - 1].split(";")[0].strip() if i else ""
        if prev.endswith(":"):
            dspans.append((s, e, prev[:-1]))
    dspans.sort()
    dstarts = [s for s, _e, _n in dspans]

    def data_label(v: int) -> str | None:
        k = bisect.bisect_right(dstarts, v) - 1
        if k >= 0 and dspans[k][0] <= v < dspans[k][1]:
            s, _e, n = dspans[k]
            return n if v == s else f"{n}+${v - s:X}"
        return None

    texts = {p: p.read_text() for p in files}
    orig = dict(texts)
    inserts: dict[Path, dict[int, str]] = {}
    bad, done = [], 0

    def label_for(t: int) -> str | None:
        if t in labels:
            return labels[t]
        if t not in lineno:
            return None
        i = bisect.bisect_right(fstarts, t) - 1
        f = files[i]
        name = f"loc_{t:06X}"
        inserts.setdefault(f, {})[lineno[t]] = name
        labels[t] = name
        return name

    for p in files:
        out = []
        for line in texts[p].splitlines(keepends=True):
            code, sep, comment = line.partition(";")

            def sub(m: re.Match) -> str:
                nonlocal done
                v = int(m.group(1) or m.group(2), 16)
                dl = data_label(v) if v < 0x200000 and v not in lineno else None
                if dl:
                    done += 1
                    print(f"{p.stem}: {code.strip()}  ->  {dl}")
                    return dl
                if v >= 0x200000 or v not in lineno:
                    if v < 0x200000 and v not in lineno and any(v - k in lineno for k in (2, 4, 6, 8)):
                        bad.append(f"{p.stem}: {code.strip()} -> ${v:06X} is not an instruction start")
                    return m.group(0)
                name = label_for(v)
                if not name:
                    return m.group(0)
                done += 1
                print(f"{p.stem}: {code.strip()}  ->  {name}")
                return name

            out.append(OPND.sub(sub, code) + sep + comment)
        texts[p] = "".join(out)
    for f, ins in inserts.items():
        lines = texts[f].splitlines(keepends=True)
        for ln in sorted(ins, reverse=True):
            src = lines[ln - 1]
            if re.match(r"^[A-Za-z_]\w*:", src):  # already labelled line (should not happen)
                continue
            lines.insert(ln - 1, f"{ins[ln]}:\n")
        texts[f] = "".join(lines)
    for b in bad:
        print("REVIEW:", b)
    print(f"{done} operand(s), {sum(len(v) for v in inserts.values())} new label(s)")
    if a.dry_run or not done:
        return 0
    for p, t in texts.items():
        if t != orig[p]:
            p.write_text(t, newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p, t in orig.items():
            p.write_text(t, newline="\n")
        print("symbolize: rolled back (build was not byte-identical)")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
