"""Give a name to a span of raw ROM data, then rebuild (rolls back on mismatch).

    uv run tools/label_data.py 0x005C38 0x18 Str_TitleOptions "3 x 8-byte strings (sub_0054C6)"

Splits the covering `incrom` line in xmen2.asm into
    incrom ...            ; before
    Str_TitleOptions:     ; <comment>
    incrom $5C38,$18
    incrom ...            ; after
and replaces exact numeric references to the start address in code
(`$5C38(pc)`, `($5C38).l`, `jtentry $005C38`) with the name.
"""
from __future__ import annotations

import argparse
import re
import sys

import build
import convert

ROOT = build.ROOT


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("start", type=lambda s: int(s, 0))
    ap.add_argument("length", type=lambda s: int(s, 0))
    ap.add_argument("name")
    ap.add_argument("comment")
    args = ap.parse_args()
    s, e, name = args.start, args.start + args.length, args.name
    if not re.fullmatch(r"[A-Za-z_]\w*", name):
        print("refused: invalid name")
        return 1

    main_path = ROOT / "xmen2.asm"
    lines = main_path.read_text().splitlines(keepends=True)
    hit = next(((i, a, b) for i, a, b in convert.incrom_spans(lines) if a <= s and e <= b), None)
    if hit is None:
        print(f"refused: ${s:06X}-${e:06X} is not inside a single raw incrom span")
        return 1
    li, a, b = hit
    repl = []
    if s > a:
        repl.append(f"\tincrom\t${a:06X},${s - a:X}\n")
    repl += [f"{name}:\t; {args.comment}\n", f"\tincrom\t${s:06X},${e - s:X}\n"]
    if b > e:
        repl.append(f"\tincrom\t${e:06X},${b - e:X}\n")

    files = {p: p.read_text() for p in [main_path, ROOT / "src" / "jumptable.asm", *(ROOT / "src" / "f").glob("*.asm")]}
    new = dict(files)
    lines[li:li + 1] = repl
    new[main_path] = "".join(lines)
    pats = [(re.compile(rf"\${s:X}\(pc"), f"{name}(pc"),
            (re.compile(rf"\(\${s:X}\)\.l"), f"({name}).l"),
            (re.compile(rf"\tjtentry\t\${s:06X}\t"), f"\tjtentry\t{name}\t")]
    refs = 0
    for p, text in new.items():
        if p == main_path:
            continue
        for pat, rep in pats:
            text, n = pat.subn(rep, text)
            refs += n
        new[p] = text
    for p, text in new.items():
        if text != files[p]:
            p.write_text(text, newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p, text in files.items():
            p.write_text(text, newline="\n")
        print("label_data: rolled back (build was not byte-identical)")
        return 1
    print(f"{name} = ${s:06X} (+${e - s:X}); {refs} reference(s) now use the label")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
