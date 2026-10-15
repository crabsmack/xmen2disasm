"""Headless, deterministic Genesis harness for X-Men 2 with execution/data tracing.

Two cores (built by `uv run emu/build_core.py`):
  biz  (default) BizHawk 2.4's Genesis Plus GX fork: the TAS in emu/corpus syncs on it,
       and its Code/Data Logger also records ROM data reads and DMA sources.
       No savestates: start mid-game with --from-frame (replays the TAS prefix, ~1.5k fps).
  gpgx current upstream Genesis Plus GX (libretro); has savestates; does NOT sync the TAS.

Library:
    emu = make_emu("biz")
    emu.run_frame("R.A", "")   # buttons as letters U D L R A B C S(tart) X Y Z M(ode)
    emu.ram()                  # 64 KB work RAM in 68000 byte order ($FF0000-$FFFFFF)
    emu.regs(), emu.frame_rgb(), emu.coverage(), emu.data_coverage()

CLI (outputs under emu/runs/<name>/; compact coverage under emu/coverage/):
    uv run emu/xmen2emu.py movie emu/corpus/tas/tas-4473M.bk2 --name tas
    uv run emu/xmen2emu.py fuzz --from-frame 12000 --frames 3600 --seed 1 --name fuzz-12000-s1
    uv run emu/xmen2emu.py idle --frames 7200 --name idle
    uv run emu/xmen2emu.py script emu/corpus/scenarios/x.txt --name scenario-x
    uv run emu/xmen2emu.py shot --from-frame 12000 --out x.png

Each run writes coverage.bin (exec bitmap, 1 bit/ROM word), data.bin + dma.bin (biz: 1 bit/ROM
byte), frames.csv (frame, ram crc32, framebuffer crc32, inputs: the reference trace for
frame-by-frame recomp comparison), func_frames.json (first/last frame and frame count per
executed function entry), ram/ snapshots every --ram-every frames, png/ every --png-every.
"""
from __future__ import annotations

import argparse
import ctypes as C
import gzip
import json
import random
import sys
import tempfile
import zipfile
import zlib
from pathlib import Path

import numpy as np

EMU_DIR = Path(__file__).resolve().parent
ROOT = EMU_DIR.parent
ROM = ROOT / "xmen2.bin"
TAS = EMU_DIR / "corpus" / "tas" / "tas-4473M.bk2"
BK2_ORDER = "UDLRABCSXYZM"  # BizHawk GEN log order: Up Down Left Right A B C Start X Y Z Mode
PAD_BITS = {"U": 0x001, "D": 0x002, "L": 0x004, "R": 0x008, "B": 0x010, "C": 0x020, "A": 0x040,
            "S": 0x080, "Z": 0x100, "Y": 0x200, "X": 0x400, "M": 0x800}


def dll(name: str) -> Path:
    return EMU_DIR / "bin" / (f"{name}.dll" if sys.platform == "win32" else f"lib{name}.so")


def ensure_rom() -> bytes:
    if not ROM.exists():
        sys.path.insert(0, str(ROOT / "tools"))
        from build import ensure_rom as _e
        _e()
    return ROM.read_bytes()


def swap16(b: bytes) -> bytes:
    """GPGX keeps 68000 RAM as host-order words; return true 68000 byte order."""
    return np.frombuffer(b, dtype=">u2").byteswap().tobytes()


class BaseEmu:
    lib: C.CDLL
    frame = 0

    def _setup_trace(self):
        L = self.lib
        for fn in ("xm_rom_total", "xm_rom_frame", "xm_ram_total"):
            getattr(L, fn).restype = C.c_void_p
        L.xm_instr_count.restype = C.c_ulonglong
        L.xm_trace_reset()
        L.xm_trace_enable(1)

    def _bits(self, fn: str, nbytes: int) -> np.ndarray:
        return np.frombuffer(C.string_at(getattr(self.lib, fn)(), nbytes), dtype=np.uint8)

    def coverage(self) -> np.ndarray:
        return self._bits("xm_rom_total", self.lib.xm_bitmap_bytes())

    def frame_bitmap(self) -> np.ndarray:
        return self._bits("xm_rom_frame", self.lib.xm_bitmap_bytes())

    def ram_exec(self) -> np.ndarray:
        return self._bits("xm_ram_total", 0x10000 // 16)

    def data_coverage(self) -> np.ndarray | None:
        return None

    def dma_coverage(self) -> np.ndarray | None:
        return None

    def readers(self) -> np.ndarray | None:
        return None

    def dma_dest(self) -> np.ndarray | None:
        return None

    def regs(self) -> dict:
        out = (C.c_uint * 18)()
        self.lib.xm_get_regs(out)
        names = [f"d{i}" for i in range(8)] + [f"a{i}" for i in range(8)] + ["pc", "sr"]
        return dict(zip(names, list(out)))

    def instructions(self) -> int:
        return int(self.lib.xm_instr_count())

    def fb_crc(self) -> int:
        rgb = self.frame_rgb()
        return zlib.crc32(rgb.tobytes()) if rgb is not None else 0

    def save_png(self, path: Path) -> None:
        from PIL import Image
        rgb = self.frame_rgb()
        if rgb is not None:
            path.parent.mkdir(parents=True, exist_ok=True)
            Image.fromarray(rgb).save(path)


# ---------------------------------------------------------------------------
class InitSettings(C.Structure):
    _fields_ = [("Filter", C.c_uint8), ("LowPassRange", C.c_uint16), ("LowFreq", C.c_int16),
                ("HighFreq", C.c_int16), ("LowGain", C.c_int16), ("MidGain", C.c_int16),
                ("HighGain", C.c_int16), ("BackdropColor", C.c_uint32)]


LOAD_CB = C.CFUNCTYPE(C.c_int, C.c_char_p, C.c_void_p, C.c_int)


class BizEmu(BaseEmu):
    """BizHawk 2.4 gpgx, initialised exactly like BizHawk's GPGX.cs with the TAS's SyncSettings."""

    def __init__(self):
        path = dll("xmen2_bizgpgx")
        if not path.exists():
            sys.exit(f"core missing: {path} (run: uv run emu/build_core.py biz)")
        self.lib = L = C.CDLL(str(path))
        self._rom = ensure_rom()
        self._load_cb = LOAD_CB(self._load)
        # TAS SyncSettings: UseSixButton, ControlType Normal (2 pads), Region auto, Filter 1, ...
        s = InitSettings(1, 26214, 880, 5000, 1, 1, 1, 0xFFFF00FF)
        if not L.gpgx_init(b"bin", self._load_cb, 1, C.c_char(1), C.c_char(1), 0, C.byref(s)):
            sys.exit("gpgx_init failed")
        L.xm_work_ram.restype = C.c_void_p
        L.xm_data_total.restype = C.c_void_p
        L.xm_dma_total.restype = C.c_void_p
        self._has_reader = hasattr(L, "xm_reader")  # cores built before the reader map lack it
        if self._has_reader:
            L.xm_reader.restype = C.c_void_p
        self._has_dma_dest = hasattr(L, "xm_dma_dest")
        if self._has_dma_dest:
            L.xm_dma_dest.restype = C.c_void_p
        self._setup_trace()

    def _load(self, filename, buf, maxsize):
        if filename != b"PRIMARY_ROM":
            return 0
        n = min(len(self._rom), maxsize)
        C.memmove(buf, self._rom, n)
        return n

    def run_frame(self, p1: str = "", p2: str = "") -> None:
        self.lib.xm_set_pads(sum(PAD_BITS[c] for c in set(p1) if c in PAD_BITS),
                             sum(PAD_BITS[c] for c in set(p2) if c in PAD_BITS))
        self.lib.xm_frame_clear()
        self.lib.gpgx_advance()
        self.frame += 1

    def reset(self, hard: bool = False) -> None:
        self.lib.gpgx_reset(1 if hard else 0)

    def ram(self) -> bytes:
        return swap16(C.string_at(self.lib.xm_work_ram(), 0x10000))

    def data_coverage(self) -> np.ndarray:
        return self._bits("xm_data_total", 0x400000 // 8)

    def dma_coverage(self) -> np.ndarray:
        return self._bits("xm_dma_total", 0x400000 // 8)

    def dma_dest(self) -> np.ndarray | None:
        """Per ROM byte: 0, or DMA | VDP code << 16 | VDP address of its first DMA (code bits 0-3:
        1 = VRAM, 3 = CRAM, 5 = VSRAM)."""
        if not self._has_dma_dest:
            return None
        return np.frombuffer(C.string_at(self.lib.xm_dma_dest(), 0x400000 * 4), dtype=np.uint32)

    def readers(self) -> np.ndarray | None:
        """Per ROM byte: 0, or READ|pc of the first instruction that read it as data, or
        DMA|pc of the instruction running when it was DMA'd (READ = 1<<24, DMA = 2<<24)."""
        if not self._has_reader:
            print("note: core has no xm_reader; rebuild it (uv run emu/build_core.py biz) for reader lists")
            return None
        return np.frombuffer(C.string_at(self.lib.xm_reader(), 0x400000 * 4), dtype=np.uint32)

    def _video(self):
        w, h, pitch, buf = C.c_int(), C.c_int(), C.c_int(), C.c_void_p()
        self.lib.gpgx_get_video(C.byref(w), C.byref(h), C.byref(pitch), C.byref(buf))
        if not buf.value or w.value <= 0:
            return None
        raw = C.string_at(buf, pitch.value * h.value)
        return np.frombuffer(raw, dtype=np.uint32).reshape(h.value, pitch.value // 4)[:, :w.value]

    def fb_crc(self) -> int:
        px = self._video()
        return zlib.crc32(np.ascontiguousarray(px & 0xFFFFFF).tobytes()) if px is not None else 0

    def frame_rgb(self) -> np.ndarray | None:
        px = self._video()
        if px is None:
            return None
        return np.dstack([(px >> 16) & 0xFF, (px >> 8) & 0xFF, px & 0xFF]).astype(np.uint8)

    def save_state(self) -> bytes:
        raise NotImplementedError("biz core has no savestates; use --from-frame (TAS replay)")


# ---------------------------------------------------------------------------
ENV_CB = C.CFUNCTYPE(C.c_bool, C.c_uint, C.c_void_p)
VIDEO_CB = C.CFUNCTYPE(None, C.c_void_p, C.c_uint, C.c_uint, C.c_size_t)
AUDIO_CB = C.CFUNCTYPE(None, C.c_int16, C.c_int16)
AUDIO_BATCH_CB = C.CFUNCTYPE(C.c_size_t, C.c_void_p, C.c_size_t)
POLL_CB = C.CFUNCTYPE(None)
STATE_CB = C.CFUNCTYPE(C.c_int16, C.c_uint, C.c_uint, C.c_uint, C.c_uint)
# libretro joypad ids for Genesis Plus GX's 6-button mapping
RJ = {"U": 4, "D": 5, "L": 6, "R": 7, "A": 1, "B": 0, "C": 8, "S": 3, "X": 10, "Y": 9, "Z": 11, "M": 2}


class GameInfo(C.Structure):
    _fields_ = [("path", C.c_char_p), ("data", C.c_void_p), ("size", C.c_size_t), ("meta", C.c_char_p)]


class Variable(C.Structure):
    _fields_ = [("key", C.c_char_p), ("value", C.c_char_p)]


class GpgxEmu(BaseEmu):
    """Upstream Genesis Plus GX via the libretro API (savestates; no TAS sync)."""
    OPTIONS = {b"genesis_plus_gx_region_detect": b"auto", b"genesis_plus_gx_force_dtack": b"disabled",
               b"genesis_plus_gx_addr_error": b"enabled", b"genesis_plus_gx_bios": b"disabled"}

    def __init__(self):
        path = dll("xmen2_gpgx")
        if not path.exists():
            sys.exit(f"core missing: {path} (run: uv run emu/build_core.py gpgx)")
        self.lib = L = C.CDLL(str(path))
        self._dir = C.c_char_p(tempfile.mkdtemp(prefix="xmen2emu_").encode())
        self._opts = {k: C.c_char_p(v) for k, v in self.OPTIONS.items()}
        self.pixfmt, self.fb, self.inputs = 0, None, [0, 0]
        self._cbs = [ENV_CB(self._env), VIDEO_CB(self._video), AUDIO_CB(lambda l, r: None),
                     AUDIO_BATCH_CB(lambda d, n: n), POLL_CB(lambda: None), STATE_CB(self._state)]
        for fn, cb in zip(("environment", "video_refresh", "audio_sample", "audio_sample_batch",
                           "input_poll", "input_state"), self._cbs):
            getattr(L, f"retro_set_{fn}")(cb)
        L.retro_init()
        rom = ensure_rom()
        self._buf = C.create_string_buffer(rom, len(rom))
        info = GameInfo(str(ROM).encode(), C.cast(self._buf, C.c_void_p), len(rom), None)
        if not L.retro_load_game(C.byref(info)):
            sys.exit("retro_load_game failed")
        for port in (0, 1):
            L.retro_set_controller_port_device(port, (1 << 8) | 1)  # MD 6-button pad
        L.retro_get_memory_data.restype = C.c_void_p
        L.retro_serialize_size.restype = C.c_size_t
        self._setup_trace()

    def _env(self, cmd, data) -> bool:
        if cmd in (9, 31):
            C.cast(data, C.POINTER(C.c_char_p))[0] = self._dir.value
            return True
        if cmd == 10:
            self.pixfmt = C.cast(data, C.POINTER(C.c_int))[0]
            return True
        if cmd == 15:  # GET_VARIABLE: core reads .value even on failure, so always set it
            v = self._opts.get(C.cast(data, C.POINTER(Variable))[0].key)
            C.cast(data, C.POINTER(Variable))[0].value = v.value if v is not None else None
            return v is not None
        if cmd == 17:
            C.cast(data, C.POINTER(C.c_bool))[0] = False
            return True
        if cmd == 51:
            return True
        if cmd == 52:
            C.cast(data, C.POINTER(C.c_uint))[0] = 0
            return True
        return False

    def _video(self, data, w, h, pitch):
        if data:
            self.fb = (w, h, pitch, C.string_at(data, pitch * h))

    def _state(self, port, device, index, ident) -> int:
        if port > 1:
            return 0
        return self.inputs[port] if ident == 256 else (self.inputs[port] >> ident) & 1

    def run_frame(self, p1: str = "", p2: str = "") -> None:
        self.inputs = [sum(1 << RJ[c] for c in set(p) if c in RJ) for p in (p1, p2)]
        self.lib.xm_frame_clear()
        self.lib.retro_run()
        self.frame += 1

    def reset(self, hard: bool = False) -> None:
        self.lib.retro_reset()

    def ram(self) -> bytes:
        return swap16(C.string_at(self.lib.retro_get_memory_data(2), 0x10000))

    def frame_rgb(self):
        if not self.fb:
            return None
        w, h, pitch, raw = self.fb
        px = np.frombuffer(raw, dtype=np.uint16).reshape(h, pitch // 2)[:, :w].astype(np.uint32)
        r, g, b = (px >> 11) & 0x1F, (px >> 5) & 0x3F, px & 0x1F
        return np.dstack([(r << 3) | (r >> 2), (g << 2) | (g >> 4), (b << 3) | (b >> 2)]).astype(np.uint8)

    def save_state(self) -> bytes:
        n = self.lib.retro_serialize_size()
        buf = C.create_string_buffer(n)
        self.lib.retro_serialize(buf, C.c_size_t(n))
        return self.frame.to_bytes(4, "little") + buf.raw

    def load_state(self, blob: bytes) -> None:
        self.frame = int.from_bytes(blob[:4], "little")
        buf = C.create_string_buffer(blob[4:], len(blob) - 4)
        if not self.lib.retro_unserialize(buf, C.c_size_t(len(blob) - 4)):
            raise RuntimeError("retro_unserialize failed")


def make_emu(core: str = "biz") -> BaseEmu:
    return BizEmu() if core == "biz" else GpgxEmu()


# ---------------------------------------------------------------------------
def read_bk2(path: Path) -> list[tuple[str, str, str]]:
    """[(console flags, p1 buttons, p2 buttons)] per frame from a BizHawk GEN .bk2."""
    with zipfile.ZipFile(path) as z:
        log = z.read("Input Log.txt").decode()
    frames = []
    for line in log.splitlines():
        if line.startswith("|"):
            parts = line.strip("|").split("|")
            pads = ["".join(ch for ch, c in zip(BK2_ORDER, p) if c != ".") for p in parts[1:3]]
            frames.append((parts[0], *(pads + ["", ""])[:2]))
    return frames


def play_movie(emu: BaseEmu, frames, upto: int, rec: "Recorder | None" = None) -> None:
    for i in range(min(upto, len(frames))):
        sys_f, p1, p2 = frames[i]
        if sys_f[:1] not in (".", ""):
            emu.reset(hard=True)
        if sys_f[1:2] not in (".", ""):
            emu.reset(hard=False)
        emu.run_frame(p1, p2)
        if rec:
            rec.after_frame(p1, p2)


def function_entries() -> np.ndarray:
    syms = ROOT / "build" / "symbols.txt"
    starts = {p.stem for p in (ROOT / "src" / "f").glob("*.asm")}
    entries = set()
    if syms.exists():
        for line in syms.read_text().splitlines():
            a = line.partition("=$")[2]
            if a in starts:
                entries.add(int(a, 16))
    return np.array(sorted(entries), dtype=np.int64)


def write_readers(path: Path, rd: np.ndarray, entries: np.ndarray) -> None:
    """Who reads each ROM data span: one line per run of consecutive read/DMA'd bytes,
    `START LEN K:FUNC:PC:BYTES ...` (hex), readers by byte count, K = R (68000 data read) or
    D (DMA source, PC = instruction running when the DMA happened), FUNC = start of the src/f
    function holding PC (000000 if none), PC = that reader's first instruction seen,
    BYTES = how many of the span's bytes it read first."""
    nz = np.nonzero(rd)[0]
    lines = []
    if len(nz):
        vals = rd[nz]
        pcs = (vals & 0xFFFFFF).astype(np.int64)
        idx = np.searchsorted(entries, pcs, side="right") - 1
        funcs = np.where(idx >= 0, entries[np.maximum(idx, 0)], 0)
        brk = np.nonzero(np.diff(nz) != 1)[0] + 1
        for s, e in zip(np.r_[0, brk], np.r_[brk, len(nz)]):
            who: dict[tuple[str, int], list[int]] = {}
            for v, fn in zip(vals[s:e].tolist(), funcs[s:e].tolist()):
                k = ("R" if v & 0x1000000 else "D", fn)
                if k in who:
                    who[k][1] += 1
                else:
                    who[k] = [v & 0xFFFFFF, 1]
            ranked = sorted(who.items(), key=lambda kv: -kv[1][1])
            lines.append(f"{int(nz[s]):06X} {int(e - s):X} " + " ".join(
                f"{k}:{fn:06X}:{pc:06X}:{n:X}" for (k, fn), (pc, n) in ranked) + "\n")
    with gzip.GzipFile(path, "wb", mtime=0) as g:
        g.write("".join(lines).encode())


def write_dma_dest(path: Path, dd: np.ndarray) -> None:
    """Where DMA'd ROM bytes went: `SRC LEN TARGET DEST` (hex) per run of source bytes copied to
    consecutive VDP words, TARGET = VRAM / CRAM / VSRAM (or the raw code), DEST = VDP address of
    the run's first word."""
    nz = np.nonzero(dd)[0]
    lines = []
    if len(nz):
        vals = dd[nz].astype(np.int64)
        code = (vals >> 16) & 0x3F
        dest = vals & 0xFFFF
        key = (code << 32) | ((dest - (nz & ~1)) & 0xFFFFFFFF)
        brk = np.nonzero((np.diff(nz) != 1) | (np.diff(key) != 0))[0] + 1
        names = {1: "VRAM", 3: "CRAM", 5: "VSRAM"}
        for s, e in zip(np.r_[0, brk], np.r_[brk, len(nz)]):
            c = int(code[s])
            lines.append(f"{int(nz[s]):06X} {int(e - s):X} {names.get(c & 0xF, f'code{c:X}')} {int(dest[s]):04X}\n")
    with gzip.GzipFile(path, "wb", mtime=0) as g:
        g.write("".join(lines).encode())


def read_readers(path: Path) -> list[tuple[int, int, list[tuple[str, int, int, int]]]]:
    """[(start, length, [(kind 'R'|'D', func, pc, bytes), ...])] from a write_readers file."""
    out = []
    with gzip.open(path, "rt") as g:
        for line in g:
            s, n, *who = line.split()
            out.append((int(s, 16), int(n, 16),
                        [(k, int(fn, 16), int(pc, 16), int(b, 16)) for k, fn, pc, b in (w.split(":") for w in who)]))
    return out


class Recorder:
    def __init__(self, emu: BaseEmu, name: str, png_every: int, ram_every: int):
        self.emu, self.dir = emu, EMU_DIR / "runs" / name
        self.png_every, self.ram_every = png_every, ram_every
        self.dir.mkdir(parents=True, exist_ok=True)
        self.csv = (self.dir / "frames.csv").open("w", newline="\n")
        self.csv.write("frame,ram_crc32,fb_crc32,p1,p2\n")
        self.entries = function_entries()
        self.ebits = self.entries >> 1
        self.first: dict[int, int] = {}
        self.last: dict[int, int] = {}
        self.count = np.zeros(len(self.entries), dtype=np.int64)
        self.start_frame = emu.frame

    def after_frame(self, p1: str, p2: str) -> None:
        e, f = self.emu, self.emu.frame
        ram = e.ram()
        self.csv.write(f"{f},{zlib.crc32(ram):08x},{e.fb_crc():08x},{p1},{p2}\n")
        if len(self.entries):
            bm = e.frame_bitmap()
            idx = np.nonzero((bm[self.ebits >> 3] >> (self.ebits & 7)) & 1)[0]
            self.count[idx] += 1
            for i in idx:
                a = int(self.entries[i])
                self.first.setdefault(a, f)
                self.last[a] = f
        if self.png_every and f % self.png_every == 0:
            e.save_png(self.dir / "png" / f"f{f:06d}.png")
        if self.ram_every and f % self.ram_every == 0:
            (self.dir / "ram").mkdir(exist_ok=True)
            (self.dir / "ram" / f"f{f:06d}.bin").write_bytes(ram)

    def finish(self, meta: dict) -> None:
        self.csv.close()
        e = self.emu
        cdir = EMU_DIR / "coverage"
        cdir.mkdir(exist_ok=True)
        blobs = {"exec": e.coverage(), "data": e.data_coverage(), "dma": e.dma_coverage()}
        for kind, arr in blobs.items():
            if arr is not None:
                (self.dir / f"{kind}.bin").write_bytes(arr.tobytes())
                with gzip.GzipFile(cdir / f"{self.dir.name}.{kind}.bin.gz", "wb", mtime=0) as g:
                    g.write(arr.tobytes())
        rd = e.readers()
        if rd is not None:
            write_readers(cdir / f"{self.dir.name}.readers.txt.gz", rd, self.entries)
        dd = e.dma_dest()
        if dd is not None:
            write_dma_dest(cdir / f"{self.dir.name}.dmadest.txt.gz", dd)
        funcs = {f"{a:06X}": {"first": self.first[a], "last": self.last[a], "frames": int(self.count[i])}
                 for i, a in enumerate(map(int, self.entries)) if a in self.first}
        (self.dir / "func_frames.json").write_text(json.dumps(funcs, indent=0), newline="\n")
        e.save_png(self.dir / "final.png")
        popcount = lambda a: int(np.unpackbits(a, bitorder="little").sum()) if a is not None else None  # noqa: E731
        meta.update(core=type(e).__name__, start_frame=self.start_frame, end_frame=e.frame,
                    executed_rom_instruction_starts=popcount(blobs["exec"]),
                    rom_bytes_read_as_data=popcount(blobs["data"]), rom_bytes_dma_source=popcount(blobs["dma"]),
                    ram_exec_words=popcount(e.ram_exec()), instructions=e.instructions(),
                    functions_hit=len(funcs))
        for p in (self.dir / "run.json", cdir / f"{self.dir.name}.json"):
            p.write_text(json.dumps(meta, indent=1), newline="\n")
        print(json.dumps(meta))


# ---------------------------------------------------------------------------
def cmd_movie(a) -> None:
    frames = read_bk2(Path(a.bk2))
    emu = make_emu(a.core)
    rec = Recorder(emu, a.name, a.png_every, a.ram_every)
    play_movie(emu, frames, a.frames or len(frames), rec)
    rec.finish({"kind": "movie", "source": Path(a.bk2).name, "movie_frames": len(frames)})


def start_point(a) -> BaseEmu:
    emu = make_emu(a.core)
    if getattr(a, "state", None):
        emu.load_state(Path(a.state).read_bytes())
    elif a.from_frame:
        play_movie(emu, read_bk2(TAS), a.from_frame)
    return emu


def cmd_fuzz(a) -> None:
    emu = start_point(a)
    rec = Recorder(emu, a.name, a.png_every, a.ram_every)
    rng = random.Random(a.seed)
    held, left = "", 0
    for _ in range(a.frames):
        if left <= 0:  # hold a random chord for a random time, biased toward moving right
            held = "".join(c for c in "UDLRABCXYZ" if rng.random() < (0.45 if c == "R" else 0.18))
            if rng.random() < 0.01:
                held += "S"
            left = rng.randint(2, 40)
        left -= 1
        emu.run_frame(held, "")
        rec.after_frame(held, "")
    rec.finish({"kind": "fuzz", "from_frame": a.from_frame, "seed": a.seed})


def cmd_idle(a) -> None:
    emu = start_point(a)
    rec = Recorder(emu, a.name, a.png_every, a.ram_every)
    for _ in range(a.frames):
        emu.run_frame("", "")
        rec.after_frame("", "")
    rec.finish({"kind": "idle", "from_frame": a.from_frame})


def read_script(path: Path) -> list[tuple[str, str]]:
    """Scenario file: one entry per line `P1 [P2] [xN]`; `.` = no buttons; `#` comments;
    `@reset` soft reset, `@power` hard reset. Example: `R x120` holds Right 120 frames.
    `@tas N` as the first entry replays the TAS to frame N before the script starts
    (reach a mid-game point such as a character-select screen); it is returned as ("@TAS", "N")."""
    out: list[tuple[str, str]] = []
    for raw in path.read_text().splitlines():
        line = raw.split("#")[0].strip()
        if not line:
            continue
        if line in ("@reset", "@power"):
            out.append((line, ""))
            continue
        if line.startswith("@tas"):
            if out:
                raise ValueError(f"{path.name}: @tas must be the first entry")
            out.append(("@TAS", line.split()[1]))
            continue
        toks = line.split()
        n = 1
        if toks[-1].lower().startswith("x") and toks[-1][1:].isdigit():
            n = int(toks.pop()[1:])
        p1 = toks[0] if toks and toks[0] != "." else ""
        p2 = toks[1] if len(toks) > 1 and toks[1] != "." else ""
        out += [(p1.upper(), p2.upper())] * n
    return out


def cmd_script(a) -> None:
    script = read_script(Path(a.script))
    if script and script[0][0] == "@TAS":
        a.from_frame = int(script.pop(0)[1])
    emu = start_point(a)
    rec = Recorder(emu, a.name, a.png_every, a.ram_every)
    for p1, p2 in script:
        if p1 in ("@RESET", "@POWER"):
            emu.reset(hard=p1 == "@POWER")
            continue
        emu.run_frame(p1, p2)
        rec.after_frame(p1, p2)
    rec.finish({"kind": "script", "script": Path(a.script).name, "from_frame": a.from_frame})


def cmd_shot(a) -> None:
    emu = start_point(a)
    out = Path(a.out or f"emu/runs/shot_f{emu.frame:06d}.png")
    emu.save_png(out)
    print(out, emu.regs())


def main() -> int:
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name, fn in (("movie", cmd_movie), ("fuzz", cmd_fuzz), ("idle", cmd_idle), ("script", cmd_script),
                     ("shot", cmd_shot)):
        p = sub.add_parser(name)
        p.set_defaults(fn=fn)
        p.add_argument("--core", choices=("biz", "gpgx"), default="biz")
        if name != "shot":
            p.add_argument("--name", required=True)
            p.add_argument("--png-every", type=int, default=600)
            p.add_argument("--ram-every", type=int, default=0)
        if name == "script":
            p.add_argument("script")
        if name == "movie":
            p.add_argument("bk2", nargs="?", default=str(TAS))
            p.add_argument("--frames", type=int, default=0)
        else:
            p.add_argument("--from-frame", type=int, default=0, help="replay the TAS to this frame first")
            p.add_argument("--state", help="(gpgx core) start from a savestate file")
        if name in ("fuzz", "idle"):
            p.add_argument("--frames", type=int, default=3600)
        if name == "fuzz":
            p.add_argument("--seed", type=int, default=0)
        if name == "shot":
            p.add_argument("--out")
    a = ap.parse_args()
    a.fn(a)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
