"""Turn raw `incrom` bytes into verified code, starting from new entry points.

    uv run tools/convert.py 0x0DD0A0 [0x0DD100 ...] [--name Player_Update] [--dry-run]

Use when you have EVIDENCE an address is code (a vtable slot, a switch-table
target, an unverified jump-table entry you inspected, a call from known code).
Everything reachable from the entries must decode cleanly and lie inside
`incrom` spans; otherwise nothing is changed. The new code is format-verified,
written as src/f/<ADDR>.asm, spliced into xmen2.asm, and the ROM is rebuilt.
If the build is not byte-identical, every change is rolled back.

Record the evidence in the new file's header comment afterwards.
"""
from __future__ import annotations

import argparse
import re
import sys

import build
import explore
import m68k
import split

ROOT = m68k.ROOT
MAIN = ROOT / "xmen2.asm"
JT = ROOT / "src" / "jumptable.asm"
INCROM = re.compile(r"^(?P<label>\w+:\s*)?\s*incrom\s+\$(?P<s>[0-9A-Fa-f]+),\$(?P<n>[0-9A-Fa-f]+)(?P<rest>.*)$")


def load_symbols() -> dict[int, str]:
    out = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        name, _, addr = line.partition("=$")
        out.setdefault(int(addr, 16), name)
    return out


def incrom_spans(lines: list[str]) -> list[tuple[int, int, int]]:
    """(line index, start, end) for every incrom line in xmen2.asm."""
    spans = []
    for i, line in enumerate(lines):
        m = INCROM.match(line.strip())
        if m:
            s = int(m.group("s"), 16)
            spans.append((i, s, s + int(m.group("n"), 16)))
    return spans


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("entries", nargs="+", type=lambda s: int(s, 0))
    ap.add_argument("--name", help="label for the first entry (default sub_XXXXXX)")
    ap.add_argument("--evidence", help="why this is code (recorded in config/seeds.txt)")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        print("convert: tree does not build byte-identical before the change; fix that first")
        return 1

    rom = m68k.load_rom()
    lines = MAIN.read_text().splitlines(keepends=True)
    spans = incrom_spans(lines)
    raw = lambda a: any(s <= a < e for _i, s, e in spans)  # noqa: E731
    code = {int(a, 16): 0 for a in (ROOT / "build" / "xmen2.code_addrs.txt").read_text().split()}
    symbols = load_symbols()
    kinds: dict[int, str] = {}

    new_code: dict[int, int] = {}
    new_kinds: dict[int, str] = {}
    for entry in args.entries:
        if entry in code or entry in new_code:
            print(f"${entry:06X} is already code")
            continue
        res = explore.trace(rom, entry, {**code, **new_code}, kinds, lambda a: not raw(a))
        if isinstance(res, dict):
            print(f"REFUSED ${entry:06X}: path reaches ${res['addr']} ({res['why']}); nothing changed")
            return 1
        nc, nl, _ni = res
        new_code.update(nc)
        for t, k in nl.items():
            if new_kinds.get(t) != "sub":
                new_kinds[t] = k

    if not new_code:
        return 0
    addrs = sorted(new_code)
    ranges: list[list[int]] = []
    for a in addrs:
        if ranges and ranges[-1][1] == a:
            ranges[-1][1] = a + new_code[a]
        else:
            ranges.append([a, a + new_code[a]])
    print(f"new code: {len(addrs)} instructions in {len(ranges)} range(s): "
          + ", ".join(f"${s:06X}-${e:06X}" for s, e in ranges))
    if args.dry_run:
        return 0

    bad = split.validate(rom, addrs)
    labels = dict(symbols)
    for a, k in new_kinds.items():
        if a in new_code and a not in labels:
            labels[a] = split.label_name(a, k)
    if args.name:
        labels[args.entries[0]] = args.name
    reasons = {e: "convert.py" for e in args.entries}

    backups = {MAIN: MAIN.read_text(), JT: JT.read_text()}
    written = []
    try:
        for s, e in sorted(ranges, reverse=True):  # back to front keeps line indexes valid
            li, ss, se = next((i, a, b) for i, a, b in incrom_spans(lines) if a <= s and e <= b)
            starts = [a for a in addrs if s <= a < e and (new_kinds.get(a) == "sub" or a in args.entries)]
            if not starts or starts[0] != s:
                starts.insert(0, s)
            repl = []
            if s > ss:
                repl.append(f"\tincrom\t${ss:06X},${s - ss:X}\n")
            for fs, fe in zip(starts, starts[1:] + [e]):
                path = ROOT / "src" / "f" / f"{fs:06X}.asm"
                path.write_text(split.emit_function(rom, fs, fe, labels, bad, reasons))
                written.append(path)
                repl.append(f'\tinclude "src/f/{fs:06X}.asm"\n')
            if se > e:
                repl.append(f"\tincrom\t${e:06X},${se - e:X}\n")
            lines[li:li + 1] = repl
        MAIN.write_text("".join(lines))
        jt = JT.read_text()
        for a in addrs:
            if a in labels:
                jt = jt.replace(f"\tjtentry\t${a:06X}\t", f"\tjtentry\t{labels[a]}\t")
        JT.write_text(jt)
        sys.argv = [sys.argv[0], "--quiet"]
        rc = build.main()
    except Exception:
        rc = 1
        import traceback
        traceback.print_exc()
    if rc != 0:
        for p, text in backups.items():
            p.write_text(text)
        for p in written:
            p.unlink(missing_ok=True)
        print("convert: rolled back (build was not byte-identical)")
        return 1
    seeds = ROOT / "config" / "seeds.txt"
    seeds.parent.mkdir(exist_ok=True)
    with seeds.open("a") as f:
        for e in args.entries:
            f.write(f"{e:06X}\t; {labels.get(e, '')} - {args.evidence or 'convert.py'}\n")
    print(f"convert: OK, {len(written)} file(s): " + ", ".join(p.name for p in written))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
