"""Phase-5 work queue: what still ties the game's C to the 68000 (docs/phases/P5-port.md P3-P5).

    uv run tools/port_queue.py                 # the first failing scan criterion's queue
    uv run tools/port_queue.py --criterion P4 -n 40
    uv run tools/port_queue.py --stats         # per category and per module
    uv run tools/port_queue.py --scan FILE     # reuse a saved `build --native --json`

Everything comes from the game repo's object scan (`xmen2check.py build --native --json`: the
undefined symbols of each object of the native target, by category), plus P4's hardware
addresses in the sources. The queue first lists the symbols by how many game files need them:
one used everywhere (`xm::call_slots`, `g_ram_ffff`) is fixed once, in the native branch of
the headers, not file by file. Then come the files, those with the fewest remaining symbols
first (they finish in one edit), grouped by module.
"""
from __future__ import annotations

import argparse
import csv
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

import build
import phase

ROOT = build.ROOT
ORDER = (("P3", "cpu68", "no 68000 calls"), ("P4", "bus", "platform layer"), ("P5", "emu_ram", "native state"))


def module_of(names: dict[str, str], path: str) -> str:
    stem = Path(path).stem.upper()
    return names.get(stem, stem).split("_")[0] if path.startswith("game/c/") else Path(path).name


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-n", type=int, default=25)
    ap.add_argument("--criterion", choices=[c for c, _k, _w in ORDER])
    ap.add_argument("--stats", action="store_true")
    ap.add_argument("--scan", help="a saved `xmen2check.py build --native --json` output")
    a = ap.parse_args()

    if a.scan:
        scan = json.loads(Path(a.scan).read_text(encoding="utf-8"))
    else:
        scan, err = phase.contract("build", "--native", timeout=4 * 3600)
        if scan is None:
            print(f"object scan failed: {err}")
            return 1
    with open(ROOT / "build" / "recomp" / "functions.csv", newline="") as f:
        names = {r["addr"]: r["name"] for r in csv.DictReader(f)}
    objs = {p: o for p, o in (scan.get("objects") or {}).items() if p.startswith(phase.GAME_SRC)}
    hw = phase.hardware_addresses(phase.recomp_root())

    if a.stats:
        print(f"{len(objs)} game objects scanned")
        for cid, cat, what in ORDER:
            files = [p for p, o in objs.items() if o.get(cat)]
            extra = f", hardware addresses {len(hw)}" if cat == "bus" else ""
            print(f"  {cid} {what:16} {cat:8} {sum(o.get(cat, 0) for o in objs.values()):6} symbols in "
                  f"{len(files):4} files{extra}")
        for cat in ("cpu68", "bus", "emu_ram"):
            mods = Counter(module_of(names, p) for p, o in objs.items() if o.get(cat))
            print(f"  {cat} by module: " + ", ".join(f"{m} {n}" for m, n in mods.most_common(12)))
        return 0

    cid, cat, what = next(((c, k, w) for c, k, w in ORDER if c == a.criterion), (None, None, None))
    if cid is None:   # the first scan criterion still failing, in table order
        for c, k, w in ORDER:
            if any(o.get(k) for o in objs.values()) or (k == "bus" and hw):
                cid, cat, what = c, k, w
                break
    if cid is None:
        print("P3-P5 scans are clean: no cpu68, bus or emu_ram symbols in game objects, no hardware "
              "addresses (P5 also needs the exporter's copied_bytes at 0: tools/phase.py 5)")
        return 0

    by_sym: dict[str, set[str]] = defaultdict(set)
    for p, o in objs.items():
        for s in (o.get("symbols") or {}).get(cat, []):
            by_sym[s].add(p)
    print(f"{cid} ({what}): {sum(o.get(cat, 0) for o in objs.values())} `{cat}` symbols in "
          f"{sum(1 for o in objs.values() if o.get(cat))} game files")
    print("\nsymbols by files needing them (fix the wide ones once, in the headers' native branch):")
    for s, ps in sorted(by_sym.items(), key=lambda kv: -len(kv[1]))[:a.n]:
        print(f"  {len(ps):5}  {s}")
    if cat == "bus" and hw:
        print(f"\nhardware addresses in {'/'.join(phase.GAME_SRC)}: {len(hw)}")
        for h in hw[:a.n]:
            print(f"  {h}")
    files = sorted((p for p, o in objs.items() if o.get(cat)),
                   key=lambda p: (len((objs[p].get("symbols") or {}).get(cat, [])), module_of(names, p), p))
    print(f"\nfiles, fewest `{cat}` symbols first:")
    for p in files[:a.n]:
        syms = (objs[p].get("symbols") or {}).get(cat, [])
        stem = Path(p).stem.upper()
        print(f"  {p:22} {names.get(stem, ''):36} {len(syms):3}  {', '.join(syms[:3])}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
