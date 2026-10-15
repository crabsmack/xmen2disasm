"""Split unlabelled raw ROM into data items and gather naming evidence for each (S2/S4/S5).

    uv run tools/dataitems.py                 # build/dataitems.json + summary
    uv run tools/dataitems.py --show 40       # first N items
    uv run tools/dataitems.py --at 0x123456   # the item holding ADDR

Item boundaries inside each unlabelled `incrom` span: the span start, every numeric
jump-table target and every numeric code-operand target (the linker lays out one C object
per symbol, and data objects are reached through the A5 jump table). Per item:
  jt       jump-table slots pointing at it, and the functions using each slot
           (`lea/pea/move $d(a5)` with d = $22+8i or d+2)
  refs     functions with numeric operands into it
  read     bytes read by the 68000 / DMA'd at runtime (union of the corpus)
  readers  top reader functions (emu/coverage/*.readers.txt.gz)
  dma      VDP destinations (emu/coverage/*.dmadest.txt.gz): VRAM/CRAM/VSRAM + address range
  near     the function names just before and after (module context)
Run tools/coverage.py first (it writes build/coverage_report.json).
"""
from __future__ import annotations

import argparse
import bisect
import gzip
import json
import re
from collections import defaultdict
from pathlib import Path

import numpy as np

import build
import convert
from coverage import union

ROOT = build.ROOT
COV = ROOT / "emu" / "coverage"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--show", type=int, default=0)
    ap.add_argument("--at", type=lambda s: int(s, 0))
    a = ap.parse_args()
    rom = build.ROM.read_bytes()
    n = len(rom)
    lines = (ROOT / "xmen2.asm").read_text().splitlines()
    raw = []
    for i, s, e in convert.incrom_spans(lines):
        prev = lines[i - 1].split(";")[0].strip() if i else ""
        if not prev.endswith(":"):
            raw.append((s, e, i))
    # module context: function starts and names
    syms = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        nm, _, v = line.partition("=$")
        if v:
            syms.setdefault(int(v, 16), nm)
    fstarts = sorted(int(p.stem, 16) for p in (ROOT / "src" / "f").glob("*.asm"))
    fname = {a_: syms.get(a_, f"sub_{a_:06X}") for a_ in fstarts}
    # boundaries: jt targets and numeric operand targets
    jt: dict[int, list[int]] = defaultdict(list)
    for line in (ROOT / "src" / "jumptable.asm").read_text().splitlines():
        m = re.match(r"\tjtentry\t\$([0-9A-F]{6})\t; \[(\d+)\]", line)
        if m:
            jt[int(m.group(1), 16)].append(int(m.group(2)))
    refs: dict[int, set[str]] = defaultdict(set)
    slot_users: dict[int, set[str]] = defaultdict(set)
    opnd = re.compile(r"\$([0-9A-F]+)\(pc|\(\$([0-9A-F]+)\)\.l")
    a5 = re.compile(r"(?<![-\w])\$([0-9A-F]+)\(a5\)")
    for f in (ROOT / "src" / "f").glob("*.asm"):
        text = f.read_text()
        fn = fname.get(int(f.stem, 16), f.stem)
        for line in text.splitlines():
            body = line.split(";")[0]
            for m in opnd.finditer(body):
                refs[int(m.group(1) or m.group(2), 16)].add(fn)
            if "jsr" in body:
                continue
            for m in a5.finditer(body):
                d = int(m.group(1), 16)
                for dd in (d, d - 2):
                    if dd >= 0x22 and (dd - 0x22) % 8 == 0:
                        slot_users[(dd - 0x22) // 8].add(fn)
    data_bits = np.unpackbits(union("data", 0x400000 // 8)[0], bitorder="little")[:n].astype(bool)
    dma_bits = np.unpackbits(union("dma", 0x400000 // 8)[0], bitorder="little")[:n].astype(bool)
    readers = []
    for p in sorted(COV.glob("*.readers.txt.gz")):
        with gzip.open(p, "rt") as g:
            for line in g:
                s, ln, *who = line.split()
                readers.append((int(s, 16), int(ln, 16), who))
    readers.sort()
    rstarts = [r[0] for r in readers]
    rmax = max((r[1] for r in readers), default=0)
    dmad = []
    for p in sorted(COV.glob("*.dmadest.txt.gz")):
        with gzip.open(p, "rt") as g:
            for line in g:
                s, ln, tgt, dest = line.split()
                dmad.append((int(s, 16), int(ln, 16), tgt, int(dest, 16)))
    dmad.sort()
    dstarts = [d[0] for d in dmad]
    dmax = max((d[1] for d in dmad), default=0)

    items = []
    for s, e, _li in raw:
        cuts = sorted({s} | {t for t in list(jt) + list(refs) if s < t < e})
        for k, c in enumerate(cuts):
            ce = cuts[k + 1] if k + 1 < len(cuts) else e
            who: dict[str, int] = defaultdict(int)
            j = bisect.bisect_left(rstarts, c - rmax)
            while j < len(readers) and readers[j][0] < ce:
                rs, rl, rw = readers[j]
                if rs + rl > c:
                    frac = (min(rs + rl, ce) - max(rs, c)) / rl  # reader counts are per span: share by overlap
                    for w in rw:
                        kind, fn, _pc, b = w.split(":")
                        nm = fname.get(int(fn, 16), f"?{fn}") if int(fn, 16) else "(none)"
                        who[f"{kind}:{nm}"] += max(1, round(int(b, 16) * frac))
                j += 1
            dm: dict[str, list[int]] = {}
            j = bisect.bisect_left(dstarts, c - dmax)
            while j < len(dmad) and dmad[j][0] < ce:
                ds, dl, tgt, dest = dmad[j]
                if ds + dl > c:
                    lo, hi = dm.get(tgt, [0x10000, 0])
                    dm[tgt] = [min(lo, dest), max(hi, dest + dl)]
                j += 1
            fi = bisect.bisect_right(fstarts, c) - 1
            before = fname[fstarts[fi]] if fi >= 0 else ""
            after = fname[fstarts[fi + 1]] if fi + 1 < len(fstarts) else ""
            slots = jt.get(c, [])
            items.append({
                "start": f"{c:06X}", "len": ce - c,
                "read": int(data_bits[c:ce].sum()), "dma": int(dma_bits[c:ce].sum()),
                "jt": slots, "jt_users": sorted({u for i in slots for u in slot_users.get(i, ())}),
                "refs": sorted(refs.get(c, ())),
                "readers": [f"{k_}:{v}" for k_, v in sorted(who.items(), key=lambda kv: -kv[1])[:6]],
                "dmadest": {t: f"{lo:04X}-{hi:04X}" for t, (lo, hi) in dm.items()},
                "near": [before, after], "head": rom[c:c + 12].hex(),
            })
    (ROOT / "build" / "dataitems.json").write_text(json.dumps(items, indent=0), newline="\n")

    def show(it: dict) -> None:
        print(f"{it['start']} {it['len']:6X} read {it['read']:6X} dma {it['dma']:6X} "
              f"jt {it['jt'][:2]} users {','.join(it['jt_users'][:2])} refs {','.join(it['refs'][:2])} "
              f"readers {' '.join(it['readers'][:3])} dmadest {it['dmadest']} near {'/'.join(it['near'])}")

    if a.at is not None:
        for it in items:
            if int(it["start"], 16) <= a.at < int(it["start"], 16) + it["len"]:
                print(json.dumps(it, indent=1))
        return 0
    tot = sum(it["len"] for it in items)
    rd = sum(1 for it in items if it["read"] or it["dma"])
    print(f"{len(items)} items, {tot} bytes; {rd} read at runtime; "
          f"{sum(1 for it in items if it['jt'])} jt targets; {sum(1 for it in items if not it['read'] and not it['dma'])} never read")
    for it in items[:a.show]:
        show(it)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
