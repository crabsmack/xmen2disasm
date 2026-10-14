"""Rename symbols across the whole tree, then rebuild (rolls back on mismatch).

    uv run tools/rename.py sub_0054C6 Title_Init [loc_0054D2 Title_Loop ...]
    uv run tools/rename.py --global -0x38A6 g_GameMode "word: current game mode (sub_005466)"

Label renames replace whole words in xmen2.asm, src/**/*.asm and config/.
--global names an A5-relative variable: every `-$38A6(a5)` operand becomes
`g_GameMode(a5)` and the equate is added to src/ram.asm. Encoding is unchanged;
the rebuild proves it.
"""
from __future__ import annotations

import argparse
import re
import sys

import build

ROOT = build.ROOT
NAME = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")


def tree_files():
    yield ROOT / "xmen2.asm"
    yield from (ROOT / "src").rglob("*.asm")
    yield from (ROOT / "config").glob("*.txt")


def existing_symbols() -> set[str]:
    p = ROOT / "build" / "symbols.txt"
    syms = {line.split("=")[0] for line in p.read_text().splitlines()} if p.exists() else set()
    ram = (ROOT / "src" / "ram.asm").read_text()
    syms |= set(re.findall(r"^([A-Za-z_]\w*)\s*=", ram, re.M))
    return syms


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--global", dest="glob", nargs=3, metavar=("A5_OFFSET", "NAME", "COMMENT"))
    ap.add_argument("pairs", nargs="*")
    args = ap.parse_args()

    syms = existing_symbols()
    files = {p: p.read_text() for p in tree_files()}
    new = dict(files)
    ram_path = ROOT / "src" / "ram.asm"

    if args.glob:
        off, name, comment = args.glob
        v = int(off, 0)
        if not NAME.match(name) or name in syms:
            print(f"refused: {name!r} is invalid or already defined")
            return 1
        lit = f"-${-v:X}" if v < 0 else f"${v:X}"
        pat = re.compile(re.escape(lit) + r"\(a5([,)])")
        hits = 0
        for p, text in new.items():
            if p.parent.name == "f":
                text, n = pat.subn(lambda m: f"{name}(a5{m.group(1)}", text)
                hits += n
                new[p] = text
        new[ram_path] = new[ram_path].rstrip("\n") + f"\n{name} = {lit}\t; {comment}\n"
        print(f"{name} = {lit}: {hits} operand(s) rewritten")
    if len(args.pairs) % 2:
        print("pairs must be OLD NEW ...")
        return 1
    for old, nw in zip(args.pairs[::2], args.pairs[1::2]):
        if not NAME.match(nw) or nw in syms:
            print(f"refused: {nw!r} is invalid or already defined")
            return 1
        if old not in syms:
            print(f"refused: {old!r} is not a known symbol")
            return 1
        pat = re.compile(rf"\b{re.escape(old)}\b")
        hits = 0
        for p, text in new.items():
            text, n = pat.subn(nw, text)
            hits += n
            new[p] = text
        syms.add(nw)
        print(f"{old} -> {nw}: {hits} reference(s)")

    for p, text in new.items():
        if text != files[p]:
            p.write_text(text, newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p, text in files.items():
            p.write_text(text, newline="\n")
        print("rename: rolled back (build was not byte-identical)")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
