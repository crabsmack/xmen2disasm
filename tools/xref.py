"""Cross-references and a work queue for naming functions.

    uv run tools/xref.py sub_0054C6        # callers, callees, globals, strings
    uv run tools/xref.py --todo [N]        # next unnamed functions to work on

--todo ranks unnamed functions so understanding compounds: functions whose
callees are all already named (or that call nothing) come first, then by how
many places call them.
"""
from __future__ import annotations

import argparse
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LABEL = re.compile(r"^([A-Za-z_]\w*):", re.M)
WORD = re.compile(r"\b([A-Za-z_]\w*)\b")
AUTO = re.compile(r"^(sub|loc)_[0-9A-F]{6}$")
GLOBAL = re.compile(r"(-\$[0-9A-F]+|g_\w+)\(a5[,)]")


def load():
    funcs = {}  # name -> (file, text)
    for f in sorted((ROOT / "src" / "f").glob("*.asm")):
        text = f.read_text()
        m = LABEL.search(text)
        if m:
            funcs[m.group(1)] = (f, text)
    return funcs


def graph(funcs):
    names = set(funcs)
    callees = {}
    callers = defaultdict(set)
    for n, (_f, text) in funcs.items():
        body = "\n".join(line.split(";")[0] + (" " + line.split("; ->")[1] if "; ->" in line else "")
                         for line in text.splitlines() if not line.startswith(";"))
        refs = {w for w in WORD.findall(body) if w in names and w != n}
        callees[n] = refs
        for r in refs:
            callers[r].add(n)
    return callees, callers


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?")
    ap.add_argument("--todo", nargs="?", const=25, type=int)
    args = ap.parse_args()
    funcs = load()
    callees, callers = graph(funcs)

    if args.todo:
        rows = []
        for n in funcs:
            if not AUTO.match(n):
                continue
            unnamed_callees = [c for c in callees[n] if AUTO.match(c)]
            size = sum(1 for line in funcs[n][1].splitlines() if line.startswith("\t"))
            rows.append((len(unnamed_callees), -len(callers[n]), size, n))
        rows.sort()
        print(f"{'function':14} {'callers':>7} {'unnamed callees':>15} {'ins':>5}")
        for unn, ncall, size, n in rows[:args.todo]:
            print(f"{n:14} {-ncall:7d} {unn:15d} {size:5d}  {funcs[n][0].name}")
        named = sum(1 for n in funcs if not AUTO.match(n))
        print(f"\nnamed {named}/{len(funcs)} functions")
        return 0

    if not args.name or args.name not in funcs:
        print("unknown function (give a label that starts a src/f file)")
        return 1
    f, text = funcs[args.name]
    print(f"{args.name}  ({f.relative_to(ROOT)})")
    print(f"callers ({len(callers[args.name])}): " + ", ".join(sorted(callers[args.name])))
    jt = [line.strip() for line in (ROOT / "src" / "jumptable.asm").read_text().splitlines()
          if re.search(rf"\b{re.escape(args.name)}\b", line)]
    if jt:
        print("jump table: " + "; ".join(jt))
    print(f"callees ({len(callees[args.name])}): " + ", ".join(sorted(callees[args.name])))
    print("A5 globals: " + ", ".join(sorted(set(GLOBAL.findall(text)))))
    data = sorted({w for w in WORD.findall(text) if re.match(r"(Str|Tbl|Art|Pal|Map)_", w)})
    if data:
        print("data: " + ", ".join(data))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
