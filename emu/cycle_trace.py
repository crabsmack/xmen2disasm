"""Per-instruction cycle trace of the reference emulator (phase 2 first-divergence work).

    uv run emu/cycle_trace.py tas --from 1 --to 5 --out build/ctrace/tas-1-5.csv

Replays the run's input stream (emu/export_input.py) and, for frames FROM..TO, writes one row per
executed 68000 instruction: `frame,pc,mclk,sr,a7,rh` (hex), mclk = gpgx's m68k.cycles when the
instruction starts, in master clocks (7 per 68000 cycle) from the start of gpgx's frame, which
begins with scanline 261 of the previous frame (gpgx system_frame_gen). Interrupt entry shows as
a jump to the handler with SR's mask raised and a7 down by 6. rh = word-wise FNV-1a
over D0-D7/A0-A7 (32-bit), the same hash the runner's exact-mode trace writes.
"""
from __future__ import annotations

import argparse
import ctypes as C
from pathlib import Path

import numpy as np

from dump_state import to_gpgx
from export_input import stream
from xmen2emu import BizEmu


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("run")
    ap.add_argument("--from", dest="f0", type=int, required=True)
    ap.add_argument("--to", dest="f1", type=int, required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--cap", type=int, default=20_000_000, help="max instructions recorded")
    ap.add_argument("--z80-out", help="also write the Z80 trace: frame,pc,zclk,rh (rh over AF..HL')")
    ap.add_argument("--fm-out", help="with --z80-out: YM2612 accesses frame,cycles,addr,data,fm_count "
                    "(addr | 0x100 = status read; cycles = the accessing CPU's master clock)")
    a = ap.parse_args()
    frames = stream(a.run)
    emu = BizEmu()
    L = emu.lib
    L.xm_ctrace_buf.restype = C.c_void_p
    L.xm_ztrace_buf.restype = C.c_void_p
    for i, (p1, p2) in enumerate(frames[:a.f1], 1):
        if i == a.f0 and not L.xm_ctrace_arm(a.cap):
            raise SystemExit("cannot allocate the trace buffer")
        if i == a.f0 and a.z80_out and not L.xm_ztrace_arm(a.cap):
            raise SystemExit("cannot allocate the Z80 trace buffer")
        if i >= a.f0:
            L.xm_ctrace_mark(i)
            if a.z80_out:
                L.xm_ztrace_mark(i)
                L.xm_fm_mark(i)
        L.xm_set_pads(to_gpgx(p1), to_gpgx(p2))
        L.xm_frame_clear()
        L.gpgx_advance()
    n = L.xm_ctrace_len()
    buf = np.frombuffer(C.string_at(L.xm_ctrace_buf(), n * 20), dtype="<u4").reshape(n, 5)
    out = Path(a.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, "w", newline="\n") as f:
        f.write("frame,pc,mclk,sr,a7,rh\n")
        frame = 0
        for pc, cyc, sr, a7, rh in buf.tolist():
            if pc == 0xFFFFFFFF:
                frame = cyc
                continue
            f.write(f"{frame},{pc:06X},{cyc},{sr:04X},{a7:06X},{rh:08X}\n")
    print(f"{out}: {n} entries, frames {a.f0}..{a.f1}" + (" (cap reached)" if n >= a.cap else ""))
    L.xm_ctrace_arm(0)
    if a.z80_out:
        n = L.xm_ztrace_len()
        zb = np.frombuffer(C.string_at(L.xm_ztrace_buf(), n * 12), dtype="<u4").reshape(n, 3)
        with open(a.z80_out, "w", newline="\n") as f:
            f.write("frame,pc,zclk,rh\n")
            frame = 0
            for pc, cyc, rh in zb.tolist():
                if pc == 0xFFFFFFFF:
                    frame = cyc
                    continue
                f.write(f"{frame},{pc:04X},{cyc},{rh:08X}\n")
        print(f"{a.z80_out}: {n} Z80 entries")
        if a.fm_out:
            L.xm_fm_buf.restype = C.c_void_p
            n = L.xm_fm_len()
            fb = np.frombuffer(C.string_at(L.xm_fm_buf(), n * 20), dtype="<u4").reshape(n, 5)
            with open(a.fm_out, "w", newline="\n") as f:
                f.write("frame,cycles,addr,data,fm_count,tac,tbc\n")
                frame = 0
                for cyc, addr, data, fmc, tim in fb.tolist():
                    if cyc == 0xFFFFFFFF:
                        frame = addr
                        continue
                    tac, tbc = tim & 0xFFFF, tim >> 16
                    tac -= 0x10000 if tac & 0x8000 else 0
                    tbc -= 0x10000 if tbc & 0x8000 else 0
                    f.write(f"{frame},{cyc},{addr:03X},{data:02X},{fmc},{tac},{tbc}\n")
            print(f"{a.fm_out}: {n} YM accesses")
        L.xm_ztrace_arm(0)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
