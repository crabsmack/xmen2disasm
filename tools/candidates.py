"""List unverified jump-table entries that WOULD trace cleanly as code.

    uv run tools/candidates.py [--limit 40]

Clean decoding is necessary but not sufficient: data can decode as plausible
68000 code. Inspect each candidate (what calls it? does it look like a
routine? does it end in rts?) before running convert.py on it.
"""
from __future__ import annotations

import argparse

import convert
import explore
import m68k

ROOT = m68k.ROOT


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=40)
    ap.add_argument("--min-rts", type=int, default=1,
                    help="require at least this many rts/rte in the traced code (0 shows data-like hits too)")
    args = ap.parse_args()
    rom = m68k.load_rom()
    spans = convert.incrom_spans((ROOT / "xmen2.asm").read_text().splitlines())
    raw = lambda a: any(s <= a < e for _i, s, e in spans)  # noqa: E731
    code = {int(a, 16): 0 for a in (ROOT / "build" / "xmen2.code_addrs.txt").read_text().split()}
    shown = 0
    for i in range(m68k.JT_COUNT):
        t = m68k.jt_target(rom, i)
        if t in code or not raw(t):
            continue
        res = explore.trace(rom, t, code, {}, lambda a: not raw(a))
        if isinstance(res, dict):
            continue
        nc, _nl, _ni = res
        first = m68k.decode(rom, t)
        ends = sum(1 for a in nc if m68k.base_mnemonic(m68k.decode(rom, a)) in ("rts", "rte"))
        if ends < args.min_rts:
            continue
        print(f"jt[{i:4d}] ${t:06X}  {len(nc):4d} ins  rts={ends:<3d} first: {first.mnemonic} {first.op_str}")
        shown += 1
        if shown >= args.limit:
            break
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
