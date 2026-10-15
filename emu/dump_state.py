"""Dump the reference emulator's state after given frames of a corpus run (first-divergence work).

    uv run emu/dump_state.py tas --frames 4,5 --out build/refdump/tas

Replays the run's exact input stream (emu/export_input.py) on the TAS-sync core and, after each
listed frame, writes fNNNNNN.ram (64 KB, 68000 byte order), .vram (64 KB, 68000 byte order),
.cram (64 bus-format words, big-endian), .vsram (40 words & $7FF, big-endian), .z80 (8 KB) and
.regs.json (d0-d7, a0-a7, pc, sr: where the 68000 stood when the frame ended). Same layouts as
the CRC columns in frames.csv, so `crc32(file)` equals the trace value.
"""
from __future__ import annotations

import argparse
import ctypes as C
import json
from pathlib import Path

import numpy as np

from export_input import stream
from xmen2emu import BizEmu, swap16

GPGX_BITS = {0x001: 0x001, 0x002: 0x002, 0x004: 0x004, 0x008: 0x008, 0x010: 0x010, 0x020: 0x020,
             0x040: 0x040, 0x080: 0x080, 0x100: 0x400, 0x200: 0x200, 0x400: 0x100, 0x800: 0x800}


def to_gpgx(mask: int) -> int:
    """Runner GPAD bits (export_input) -> gpgx input.pad bits (X and Z swapped)."""
    return sum(g for r, g in GPGX_BITS.items() if mask & r)


def dump(emu: BizEmu, out: Path, frame: int) -> None:
    L = emu.lib
    base = out / f"f{frame:06d}"
    base.with_suffix(".ram").write_bytes(emu.ram())
    base.with_suffix(".vram").write_bytes(swap16(C.string_at(L.xm_vram(), 0x10000)))
    c9 = np.frombuffer(C.string_at(L.xm_cram(), 0x80), dtype="<u2")
    base.with_suffix(".cram").write_bytes(
        (((c9 & 0x1C0) << 3) | ((c9 & 0x038) << 2) | ((c9 & 0x007) << 1)).astype(">u2").tobytes())
    base.with_suffix(".vsram").write_bytes(
        (np.frombuffer(C.string_at(L.xm_vsram(), 0x50), dtype="<u2") & 0x7FF).astype(">u2").tobytes())
    base.with_suffix(".z80").write_bytes(C.string_at(L.xm_zram(), 0x2000))
    base.with_suffix(".regs.json").write_text(json.dumps({k: f"{v:08X}" for k, v in emu.regs().items()}))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("run")
    ap.add_argument("--frames", required=True, help="comma-separated frame numbers")
    ap.add_argument("--out", required=True)
    a = ap.parse_args()
    want = sorted({int(x) for x in a.frames.split(",")})
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    frames = stream(a.run)
    emu = BizEmu()
    for i, (p1, p2) in enumerate(frames[:want[-1]], 1):
        emu.lib.xm_set_pads(to_gpgx(p1), to_gpgx(p2))
        emu.lib.xm_frame_clear()
        emu.lib.gpgx_advance()
        emu.frame += 1
        if i in want:
            dump(emu, out, i)
    print(f"{out}: frames {','.join(map(str, want))}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
