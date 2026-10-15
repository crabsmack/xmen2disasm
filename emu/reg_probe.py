"""Registers of the reference emulator each time an instruction address executes.

    uv run emu/reg_probe.py tas 1FD664 --frames 7          # every hit of $1FD664 up to frame 7

Replays the run's input stream (emu/export_input.py) up to the given frame and prints, for each
execution of the address (at most 256), the frame, master clock within the frame, SR and D0-D7,
A0-A7 at the instruction's start: what the previous instruction produced.
"""
from __future__ import annotations

import argparse
import ctypes as C

import numpy as np

from dump_state import to_gpgx
from export_input import stream
from xmen2emu import BizEmu


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("run")
    ap.add_argument("pc")
    ap.add_argument("--frames", type=int, required=True)
    ap.add_argument("--first", type=int, default=1, help="arm the probe from this frame")
    a = ap.parse_args()
    emu = BizEmu()
    L = emu.lib
    L.xm_rprobe_buf.restype = C.c_void_p
    seen = 0
    for i, (p1, p2) in enumerate(stream(a.run)[:a.frames], 1):
        if i == a.first:
            L.xm_rprobe_arm(int(a.pc, 16))
        L.xm_set_pads(to_gpgx(p1), to_gpgx(p2))
        L.xm_frame_clear()
        L.gpgx_advance()
        n = L.xm_rprobe_len()
        if n > seen:
            buf = np.frombuffer(C.string_at(L.xm_rprobe_buf(), n * 72), dtype="<u4").reshape(n, 18)
            for row in buf[seen:].tolist():
                regs = " ".join(f"d{k}={v:08X}" for k, v in enumerate(row[2:10]))
                regs += " " + " ".join(f"a{k}={v:08X}" for k, v in enumerate(row[10:18]))
                print(f"frame {i} mclk {row[0]} sr {row[1]:04X} {regs}")
            seen = n
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
