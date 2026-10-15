"""Add a label inside an already-labelled data span, then rebuild (rolls back on mismatch).

    uv run tools/sublabel.py 0x1F45FC Str_RegionMsgSystems "C string: second line of the lockout message"
    uv run tools/sublabel.py --batch FILE      # lines `ADDR Name comment...` (hex ADDR)

Splits the `incrom` line of the labelled span holding ADDR at ADDR, puts `Name: ; comment`
there, and rewrites `Parent+$off` operands that point exactly at ADDR to `Name` (and those
past it to `Name+$off`). Use it for strings/tables inside a bigger labelled blob, so code
refers to them by name instead of Parent+offset.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

import build
import convert

ROOT = build.ROOT


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("addr", nargs="?", type=lambda s: int(s, 0))
    ap.add_argument("name", nargs="?")
    ap.add_argument("comment", nargs="?", default="")
    ap.add_argument("--batch")
    a = ap.parse_args()
    items = []
    if a.batch:
        for ln in Path(a.batch).read_text(encoding="utf-8").splitlines():
            if ln.strip() and not ln.startswith("#"):
                ad, nm, *cm = ln.split(None, 2)
                items.append((int(ad, 16), nm, cm[0] if cm else ""))
    elif a.name:
        items.append((a.addr, a.name, a.comment))
    else:
        ap.error("give ADDR NAME [COMMENT] or --batch FILE")
    main_p = ROOT / "xmen2.asm"
    lines = main_p.read_text().splitlines(keepends=True)
    files = {p: p.read_text() for p in (ROOT / "src" / "f").glob("*.asm")}
    orig_main, orig = "".join(lines), dict(files)
    for addr, name, comment in sorted(items, reverse=True):
        spans = convert.incrom_spans([ln.rstrip("\n") for ln in lines])
        hit = next(((k, s, e) for k, s, e in spans if s < addr < e), None)
        if hit is None:
            print(f"refused {name}: ${addr:06X} is not strictly inside an incrom span")
            return 1
        k, s, e = hit
        # the label that owns this span: nearest `Name:` line above (through split incroms)
        j = k - 1
        while j >= 0 and lines[j].lstrip().startswith("incrom"):
            j -= 1
        m = re.match(r"^([A-Za-z_]\w*):", lines[j]) if j >= 0 else None
        if not m:
            print(f"refused {name}: span at ${s:06X} is not labelled data")
            return 1
        parent = m.group(1)
        pspans = []  # where the parent's bytes start
        jj = j + 1
        while jj < len(lines) and lines[jj].lstrip().startswith("incrom"):
            mm = re.match(r"\s*incrom\s+\$([0-9A-Fa-f]+)", lines[jj])
            pspans.append(int(mm.group(1), 16))
            jj += 1
        pstart = pspans[0]
        lines[k:k + 1] = [f"\tincrom\t${s:06X},${addr - s:X}\n", f"{name}:\t; {comment}\n",
                          f"\tincrom\t${addr:06X},${e - addr:X}\n"]

        def fix(mm: re.Match) -> str:
            off = int(mm.group(1), 16)
            tgt = pstart + off
            if tgt == addr:
                return name
            if addr < tgt < e:
                return f"{name}+${tgt - addr:X}"
            return mm.group(0)

        pat = re.compile(rf"\b{re.escape(parent)}\+\$([0-9A-F]+)\b")
        for p, t in files.items():
            files[p] = pat.sub(fix, t)
        print(f"{name} at ${addr:06X} (inside {parent})")
    for p, t in files.items():
        if t != orig[p]:
            p.write_text(t, newline="\n")
    main_p.write_text("".join(lines), newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p, t in orig.items():
            p.write_text(t, newline="\n")
        main_p.write_text(orig_main, newline="\n")
        print("sublabel: rolled back (build was not byte-identical)")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
