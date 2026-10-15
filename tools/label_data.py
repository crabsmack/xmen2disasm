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
from pathlib import Path

import build
import convert

ROOT = build.ROOT


def merge_contiguous(lines: list[str], s: int, e: int) -> bool:
    """Merge consecutive, contiguous, unlabelled incrom lines so [s,e) sits in one line."""
    spans = convert.incrom_spans(lines)
    for k, (i, a, _b) in enumerate(spans):
        if not (a <= s):
            continue
        j, end = k, spans[k][2]
        while end < e and j + 1 < len(spans):
            ni, na, nb = spans[j + 1]
            if na != end or ni != spans[j][0] + 1:  # gap, or something (a label) in between
                break
            j, end = j + 1, nb
        if j > k and a <= s and e <= end:
            first = spans[k][0]
            last = spans[j][0]
            lines[first:last + 1] = [f"\tincrom\t${a:06X},${end - a:X}\n"]
            return True
    return False


def apply_label(lines: list[str], texts: dict, s: int, e: int, name: str, comment: str) -> str | None:
    """Split the covering incrom line and symbolize references. Returns an error or None."""
    if not re.fullmatch(r"[A-Za-z_]\w*", name):
        return f"invalid name {name!r}"
    hit = next(((i, a, b) for i, a, b in convert.incrom_spans(lines) if a <= s and e <= b), None)
    if hit is None and merge_contiguous(lines, s, e):
        hit = next(((i, a, b) for i, a, b in convert.incrom_spans(lines) if a <= s and e <= b), None)
    if hit is None:
        return f"${s:06X}-${e:06X} is not inside raw incrom (it overlaps code or a labelled span)"
    li, a, b = hit
    repl = []
    if s > a:
        repl.append(f"\tincrom\t${a:06X},${s - a:X}\n")
    repl += [f"{name}:\t; {comment}\n", f"\tincrom\t${s:06X},${e - s:X}\n"]
    if b > e:
        repl.append(f"\tincrom\t${e:06X},${b - e:X}\n")
    lines[li:li + 1] = repl

    def sym(v: int) -> str:
        return name if v == s else f"{name}+${v - s:X}"

    pc = re.compile(r"\$([0-9A-F]+)\(pc")
    absl = re.compile(r"\(\$([0-9A-F]+)\)\.l")
    jte = re.compile(r"\tjtentry\t\$([0-9A-F]{6})\t")
    for p, text in texts.items():
        text = pc.sub(lambda m: f"{sym(int(m.group(1), 16))}(pc" if s <= int(m.group(1), 16) < e else m.group(0), text)
        text = absl.sub(lambda m: f"({sym(int(m.group(1), 16))}).l" if s <= int(m.group(1), 16) < e else m.group(0), text)
        text = jte.sub(lambda m: f"\tjtentry\t{sym(int(m.group(1), 16))}\t" if s <= int(m.group(1), 16) < e else m.group(0), text)
        texts[p] = text
    return None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("start", nargs="?", type=lambda s: int(s, 0))
    ap.add_argument("length", nargs="?", type=lambda s: int(s, 0))
    ap.add_argument("name", nargs="?")
    ap.add_argument("comment", nargs="?")
    ap.add_argument("--batch", help="file of `START LEN Name comment...` lines (hex START/LEN); one rebuild")
    args = ap.parse_args()
    items = []
    if args.batch:
        for line in Path(args.batch).read_text().splitlines():
            if line.strip() and not line.lstrip().startswith("#"):
                st, ln, nm, *cm = line.split(None, 3)
                items.append((int(st, 16), int(ln, 16), nm, cm[0] if cm else ""))
    elif args.name:
        items.append((args.start, args.length, args.name, args.comment or ""))
    else:
        ap.error("give START LEN NAME COMMENT or --batch FILE")

    main_path = ROOT / "xmen2.asm"
    lines = main_path.read_text().splitlines(keepends=True)
    files = {p: p.read_text() for p in [main_path, ROOT / "src" / "jumptable.asm", *(ROOT / "src" / "f").glob("*.asm")]}
    texts = {p: t for p, t in files.items() if p != main_path}
    errors = []
    for s, n, name, comment in items:
        err = apply_label(lines, texts, s, s + n, name, comment)
        if err:
            errors.append(f"{name}: {err}")
    if errors:
        print("refused:\n  " + "\n  ".join(errors[:40]))
        return 1
    texts[main_path] = "".join(lines)
    for p, text in texts.items():
        if text != files[p]:
            p.write_text(text, newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p, text in files.items():
            p.write_text(text, newline="\n")
        print("label_data: rolled back (build was not byte-identical)")
        return 1
    print(f"labelled {len(items)} span(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
