"""Repair references to auto labels (sub_/loc_XXXXXX) that no longer exist, then rebuild.

    uv run tools/fix_stale.py [--dry-run]

Parallel workers rename in separate worktrees, so after a textually clean `git rebase` a
file can still say `sub_006110` (in code or in a comment) although that label is now
`Player1_SetGambit`. The build catches stale names in code (symbol undefined, often with
knock-on "jump distance too big" errors); comments and docs/NOTES.md go stale silently.
Every undefined sub_/loc_XXXXXX is replaced by the label now at address $XXXXXX (the
src/f file's first label, else any symbol there). Struck-through NOTES history (~~...~~) is
left alone. Run it after every rebase that pulled other workers' renames.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

import build

ROOT = build.ROOT
AUTO = re.compile(r"\b(?:sub|loc)_[0-9A-F]{6}\b")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    files = [ROOT / "xmen2.asm", *(ROOT / "src").rglob("*.asm"), ROOT / "docs" / "NOTES.md"]
    texts = {p: p.read_text(encoding="utf-8") for p in files}
    defined = set()
    for t in texts.values():
        defined |= set(re.findall(r"^([A-Za-z_]\w*):", t, re.M))
    at: dict[int, str] = {}
    sym = ROOT / "build" / "symbols.txt"
    if sym.exists():
        for line in sym.read_text().splitlines():
            n, _, v = line.partition("=$")
            if v and n in defined:
                at.setdefault(int(v, 16), n)
    for p in (ROOT / "src" / "f").glob("*.asm"):
        m = re.search(r"^([A-Za-z_]\w*):", texts[p], re.M)
        if m:
            at[int(p.stem, 16)] = m.group(1)
    fixed: dict[str, str] = {}
    unresolved: set[str] = set()

    def sub(m: re.Match) -> str:
        n = m.group(0)
        if n in defined:
            return n
        new = at.get(int(n[4:], 16))
        if new and new != n:
            fixed[n] = new
            return new
        unresolved.add(n)
        return n

    changed = {}
    for p, t in texts.items():
        if p.suffix == ".md":
            parts = re.split(r"(~~.*?~~)", t, flags=re.S)
            n = "".join(x if x.startswith("~~") else AUTO.sub(sub, x) for x in parts)
        else:
            n = AUTO.sub(sub, t)
        if n != t:
            changed[p] = n
    for old, new in sorted(fixed.items()):
        print(f"{old} -> {new}")
    print(f"{len(fixed)} stale name(s) in {len(changed)} file(s); unresolved: {sorted(unresolved)[:10]}")
    if a.dry_run or not changed:
        return 0
    for p, n in changed.items():
        p.write_text(n, encoding="utf-8", newline="\n")
    sys.argv = [sys.argv[0], "--quiet"]
    if build.main() != 0:
        for p in changed:
            p.write_text(texts[p], encoding="utf-8", newline="\n")
        print("fix_stale: rolled back (build was not byte-identical)")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
