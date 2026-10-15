"""Phase-4 work queue: the next functions to write as hand C (docs/phases/P4-decomp.md, D4).

    uv run tools/decomp_queue.py              # next 25 functions
    uv run tools/decomp_queue.py -n 5 --module Barbarian
    uv run tools/decomp_queue.py --stats      # done / left per module

Status comes from the ledger `build/phase4_functions.json` that `uv run tools/phase.py 4`
writes (rerun it after a batch); without one, nothing counts as done. Ranking, so each batch
builds on finished work: functions whose callees are all done (or that call nothing) first,
then by how many functions call them. Each line says how it must be verified: `match`
(the corpus never runs it: MPW byte match, policy matching-for-unexecuted) or
`match|verify` (shadow differential test, or a match), and what is still missing.
"""
from __future__ import annotations

import argparse
import csv
import json
from collections import Counter
from pathlib import Path

import build
import xref

ROOT = build.ROOT
LEDGER = ROOT / "build" / "phase4_functions.json"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-n", type=int, default=25)
    ap.add_argument("--module", help="only functions named <Module>_...")
    ap.add_argument("--stats", action="store_true", help="done / left per module")
    a = ap.parse_args()

    with open(ROOT / "build" / "recomp" / "functions.csv", newline="") as f:
        funcs = {r["name"]: r for r in csv.DictReader(f)}
    ledger = json.loads(LEDGER.read_text(encoding="utf-8")) if LEDGER.exists() else {}
    done = {n for n, r in funcs.items() if ledger.get(r["addr"], {}).get("done")}
    if a.stats:
        mods = Counter(n.split("_")[0] for n in funcs)
        mdone = Counter(n.split("_")[0] for n in done)
        print(f"{len(done)}/{len(funcs)} done" + ("" if ledger else " (no ledger: run tools/phase.py 4)"))
        for m, total in sorted(mods.items(), key=lambda kv: (kv[1] - mdone[kv[0]], kv[0]), reverse=True)[:40]:
            print(f"  {m:24} {mdone[m]:4}/{total}")
        return 0

    callees, callers = xref.graph(xref.load())
    todo = [n for n in funcs if n not in done and (not a.module or n.split("_")[0] == a.module)]
    todo.sort(key=lambda n: (bool(callees.get(n, set()) - done), -len(callers.get(n, ())), funcs[n]["addr"]))
    if not ledger:
        print("(no ledger yet: `uv run tools/phase.py 4` writes build/phase4_functions.json)")
    for n in todo[:a.n]:
        r = funcs[n]
        e = ledger.get(r["addr"], {})
        cov = e.get("coverage", "?")
        left = len(callees.get(n, set()) - done)
        how = "match" if cov == "never" else "match|verify"
        missing = ",".join(e.get("missing", [])) or "all"
        print(f"{r['addr']} {n:40} {cov:7} {how:12} callees left {left:3}  callers {len(callers.get(n, ())):3}"
              f"  missing {missing}  ; {r['purpose'][:70]}")
    print(f"{len(todo)} left" + (f" in {a.module}" if a.module else ""))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
