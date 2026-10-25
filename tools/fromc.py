"""The ROM built from the hand-written C (level 1: code only, fixed addresses).

    uv run tools/build.py --from-c [--recomp ROOT]    # the build (fromc.build); exit 0 = ROM's SHA-1
    uv run tools/fromc.py --check [--only A,B]        # each C module written, compared with the ROM
    uv run tools/fromc.py --infer-segments            # config/link/segments.txt from the ROM

Every game/c/<ADDR>.c the game repo lists as matched (docs/p4_mpw_matched.txt: the functions the
original wrote in C) is compiled with MPW C 3.3 (cc.py's compile, objects cached in build/cc_objs),
and its code module laid at ADDR. This is the linker's part: each relocation is written from the
names alone, the ROM is not read:
  - A5-relative: a global's A5 offset (build/recomp/ram_globals.csv), or the displacement of the
    jump-table entry with that name (src/jumptable.asm; +2 for a code name the C declared
    as data, as MPW Link resolves it)
  - PC-relative 16-bit: the distance to the name (build/symbols.txt), when the name is in the
    referring code's segment; otherwise the linker's rewrite, as MPW Link does it: the
    instruction's (d16,PC) becomes (d16,A5) and the displacement that of the name's jump-table
    entry. Segments are config/link/segments.txt (the original link's CODE segments, inferred from
    which calls the ROM rewrote: --infer-segments)
  - 32-bit absolute: the name's address
  - computed (name1 - name2): the difference of the two addresses
The pieces replace src/f/<ADDR>.asm in a generated main file (build/xmen2_c.asm): labels kept
where they were (other code refers to them), the bytes `binclude`d, and whatever a module doesn't
cover (the rest of a function file, the rest of a data span) still assembled from the source.
Everything else stays assembly: header, jump table, the hand-written 68000 functions, the MPW
library modules and the `incrom` data spans (the user's ROM).
"""
from __future__ import annotations

import argparse
import concurrent.futures
import os
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import cc  # noqa: E402
import mpwobj  # noqa: E402
from build import ROOT  # noqa: E402

SEGMENTS = ROOT / "config" / "link" / "segments.txt"
OUTDIR = ROOT / "build" / "fromc"
MAIN = "build/xmen2_c.asm"


def recomp_root() -> Path:
    from build import main_checkout
    main = main_checkout() or ROOT
    return Path(os.environ.get("XMEN2_RECOMP") or main.parent / "XMen2Recomp")


def c_files(root: Path) -> list[Path]:
    """The game repo's game/c files whose function the original wrote in C (the matched list)."""
    listed = root / "docs" / "p4_mpw_matched.txt"
    want = {ln.strip().upper() for ln in listed.read_text(encoding="utf-8").splitlines()
            if ln.strip() and not ln.startswith("#")}
    return sorted(p for p in (root / "game" / "c").glob("*.c") if p.stem.upper() in want)


# --- the link -------------------------------------------------------------------------------

class LinkError(Exception):
    pass


class Linker:
    def __init__(self, names: cc.Names, segments: list[int] | None):
        self.n = names
        self.jt_of: dict[str, list[int]] = {}
        for d, t in sorted(names.jt.items()):
            self.jt_of.setdefault(t, []).append(d)
        self.segments = segments

    def seg(self, a: int) -> int:
        import bisect
        return bisect.bisect_right(self.segments, a)

    def addr(self, name: str) -> int:
        if name not in self.n.addr:
            raise LinkError(f"no address for {name}")
        return self.n.addr[name]

    def jt(self, name: str) -> int:
        ds = self.jt_of.get(name)
        if not ds:
            raise LinkError(f"no jump-table entry for {name}")
        if len(ds) > 1:
            raise LinkError(f"{len(ds)} jump-table entries for {name}")
        return ds[0]

    def resolve(self, code: bytearray, base: int, ref: mpwobj.Ref, off: int) -> str:
        """Write reference `ref` at module offset `off` (module at `base`); returns its kind."""
        want = cc.LIB_NAMES.get(ref.name, ref.name)
        a = base + off
        if ref.computed:
            want2 = cc.LIB_NAMES.get(ref.name2, ref.name2)
            add = int.from_bytes(code[off:off + ref.patch], "big", signed=True)
            v = self.addr(want) - self.addr(want2) + add
            code[off:off + ref.patch] = (v & ((1 << 8 * ref.patch) - 1)).to_bytes(ref.patch, "big")
            return "computed"
        if ref.patch == 4:
            add = int.from_bytes(code[off:off + 4], "big", signed=True)
            code[off:off + 4] = ((self.addr(want) + add) & 0xFFFFFFFF).to_bytes(4, "big")
            return "abs.l"
        add = int.from_bytes(code[off:off + 2], "big", signed=True)

        def put16(v: int):
            if not -0x8000 <= v < 0x8000:
                raise LinkError(f"{want}: displacement {v:#x} out of range")
            code[off:off + 2] = (v & 0xFFFF).to_bytes(2, "big")
        if ref.a5:
            if want in self.n.globals:
                put16(self.n.globals[want] + add)
                return "a5.global"
            if add not in (0, 2):
                raise LinkError(f"{want}: jump-table reference with addend {add}")
            put16(self.jt(want) + add)
            return "a5.jt"
        t = self.addr(want)
        if self.segments is None:      # --infer-segments: every reference left PC-relative
            code[off:off + 2] = ((t + add - a) & 0xFFFF).to_bytes(2, "big")
            return "pcrel"
        if self.seg(a) == self.seg(t):
            put16(t + add - a)
            return "pcrel"
        op = int.from_bytes(code[off - 2:off], "big") if off >= 2 else 0
        if op & 0x3F != 0x3A or add:
            raise LinkError(f"{want}: inter-segment reference the linker can't rewrite (opcode {op:04X}, addend {add})")
        code[off - 2:off] = ((op & ~0x3F) | 0x2D).to_bytes(2, "big")
        put16(self.jt(want))
        return "pcrel->jt"


@dataclass
class Piece:
    addr: int
    src: Path
    name: str
    code: bytes = b""
    kinds: dict[str, int] = field(default_factory=dict)
    refs: list[tuple[int, str, str]] = field(default_factory=list)   # (offset, name, kind)


def compile_all(root: Path, files: list[Path], jobs: int) -> dict[Path, bytes]:
    v = cc.verdict()
    cid = v.get("candidate") or cc.DEFAULT_CANDIDATE
    flags = v.get("flags", cc.DEFAULT_FLAGS)
    inc = cc.game_headers(root)
    hkey = cc.headers_key(inc)
    tool_err = re.compile(r"Unable to open the resource fork|end-of-file reached during read operation")

    def one(p: Path):
        for _ in range(3):
            obj, out = cc.compile_cached(p, cid, flags, inc, hkey)
            if obj is not None or not tool_err.search(out):
                break
        return p, obj, out
    objs, bad = {}, []
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as ex:
        for p, obj, out in ex.map(one, files):
            if obj is None:
                bad.append(f"{p.name}: compile failed: {' | '.join(out.splitlines()[:3])}")
            else:
                objs[p] = obj
    if bad:
        raise LinkError("\n".join(bad))
    return objs


def link(root: Path, names: cc.Names, segments: list[int] | None, jobs: int = 8,
         only: set[str] | None = None) -> list[Piece]:
    files = c_files(root)
    if only:
        files = [p for p in files if p.stem.upper() in only]
    objs = compile_all(root, files, jobs)
    lk = Linker(names, segments)
    pieces, errs = [], []
    for p in files:
        addr = int(p.stem, 16)
        fname = names.funcs.get(addr)
        mods = [m for m in mpwobj.parse(objs[p]) if not m.data_module]
        mod = next((m for m in mods if m.name == fname), mods[0] if len(mods) == 1 else None)
        if fname is None or mod is None:
            errs.append(f"{p.name}: no code module for the function at ${addr:06X} ({fname})")
            continue
        pc = Piece(addr, p, fname)
        code = bytearray(mod.code())
        for ref in mod.refs:
            for off in ref.offsets:
                try:
                    k = lk.resolve(code, addr, ref, off)
                except LinkError as e:
                    errs.append(f"{p.name}: {fname}+{off:#x}: {e}")
                    continue
                pc.kinds[k] = pc.kinds.get(k, 0) + 1
                pc.refs.append((off, ref.name, k))
        pc.code = bytes(code)
        pieces.append(pc)
    if errs:
        raise LinkError("\n".join(errs[:40]) + (f"\n... {len(errs)} problems" if len(errs) > 40 else ""))
    pieces.sort(key=lambda q: q.addr)
    for x, y in zip(pieces, pieces[1:]):
        if x.addr + len(x.code) > y.addr:
            raise LinkError(f"{x.src.name} ({len(x.code):#x} bytes) runs into {y.src.name}")
    return pieces


SEGMENTS_HEADER = """\
# The original link's CODE segment starts, as far as the C's references show them (generated by
# `uv run tools/fromc.py --infer-segments`; read by the C build, tools/fromc.py). MPW Link keeps
# a PC-relative reference within a segment and rewrites one to another segment into a jump-table
# access ((d16,PC) -> (d16,A5)). Each start below separates at least one reference the ROM has
# rewritten (the one named) and none it kept; as few starts as explain them all, each as late as
# they allow. "could be from": the earliest position that explains the same rewrites, so the
# original boundary lies in that range. Neither a jump-table entry nor the distance predicts the
# rewrites (2026-10-25: 204 kept references have a jump-table entry; 1,572 rewritten ones are
# within 32 KB of their target), so this map is the link's input, as the original's was.
"""


def read_segments() -> list[int] | None:
    if not SEGMENTS.exists():
        return None
    return sorted(int(ln.split()[0].lstrip("$"), 16) for ln in SEGMENTS.read_text(encoding="utf-8").splitlines()
                  if ln.strip() and not ln.startswith("#"))


# --- the splice -----------------------------------------------------------------------------

LST_ROW = re.compile(r"^(\(\d+\))?\s*(\d+)/\s*([0-9A-F]+) : (.*)$")
INCF = re.compile(r'^\s*include\s+"(src/f/[0-9A-F]{6}\.asm)"')
INCROM = re.compile(r"^\s*incrom\s+\$([0-9A-F]+),\$([0-9A-F]+)")
LABEL = re.compile(r"^([A-Za-z_][\w.]*):")


@dataclass
class Line:
    no: int                 # 1-based line of xmen2.asm
    text: str
    addr: int = -1          # listing address (-1: before org / not listed)
    end: int = -1
    sized: bool = False
    rows: list[tuple[int, int, str]] = field(default_factory=list)   # an include's (line, addr, source)


def main_lines(lst: Path) -> list[Line]:
    """xmen2.asm's lines with the addresses the (gate) build gave them, from its listing; an
    included function file's rows go with its include line."""
    lines = [Line(i + 1, t) for i, t in enumerate((ROOT / "xmen2.asm").read_text(encoding="utf-8").splitlines())]
    cur = None
    for row in lst.read_text(encoding="latin-1").splitlines():
        m = LST_ROW.match(row)
        if not m:
            continue
        no, addr, src = int(m.group(2)), int(m.group(3), 16), m.group(4)[20:]
        if m.group(1):
            if cur is not None and (not cur.rows or cur.rows[-1][0] != no):
                cur.rows.append((no, addr, src))
            continue
        if no > len(lines):     # the end-of-file row
            continue
        ln = lines[no - 1]
        if ln.addr < 0:
            ln.addr = addr
        cur = ln
    for ln in lines:
        s = ln.text.split(";")[0].strip()
        ln.sized = bool(s) and ln.addr >= 0 and not LABEL.match(s) and (INCF.match(ln.text) is not None
                                                                       or INCROM.match(ln.text) is not None
                                                                       or s.split()[0].startswith("dc."))
    sized = [ln for ln in lines if ln.sized]
    for x, y in zip(sized, sized[1:]):
        x.end = y.addr
    sized[-1].end = ROM_SIZE
    return lines


ROM_SIZE = 0x200000


def splice(pieces: list[Piece], lines: list[Line]) -> tuple[str, dict]:
    """The generated main file: xmen2.asm with each piece's bytes in place of what it covers."""
    OUTDIR.mkdir(parents=True, exist_ok=True)
    for old in OUTDIR.glob("*.bin"):
        old.unlink()
    out: list[str] = [f"; Generated by tools/fromc.py: xmen2.asm with the code of {len(pieces)} hand-written C",
                      "; functions (game/c, MPW C 3.3) in place of their src/f assembly. Never edit.", ""]
    stats = {"files_replaced": 0, "incrom_bytes": 0, "c_bytes": 0, "kept_tail_lines": 0}
    k, i = 0, 0
    while i < len(lines):
        ln = lines[i]
        if k >= len(pieces) or not ln.sized or ln.addr < pieces[k].addr:
            if k < len(pieces) and ln.sized and ln.end > pieces[k].addr:
                raise LinkError(f"{pieces[k].src.name}: starts inside xmen2.asm line {ln.no} (${ln.addr:06X})")
            out.append(ln.text)
            i += 1
            continue
        pc = pieces[k]
        s, e = pc.addr, pc.addr + len(pc.code)
        if ln.addr != s or not INCF.match(ln.text):
            raise LinkError(f"{pc.src.name}: ${s:06X} is not where xmen2.asm line {ln.no} starts ({ln.text.strip()[:60]})")
        # every line the piece covers: its labels stay (other code refers to them)
        labels: list[tuple[int, str]] = []
        last = None
        j = i
        while j < len(lines) and lines[j].addr < e:
            lj = lines[j]
            if lj.sized:
                last = lj
                if INCF.match(lj.text):
                    stats["files_replaced"] += 1
                    labels += [(a, LABEL.match(src.strip()).group(1)) for _, a, src in lj.rows
                               if LABEL.match(src.strip()) and a < e]
                elif INCROM.match(lj.text):
                    stats["incrom_bytes"] += min(lj.end, e) - lj.addr
            elif LABEL.match(lj.text) and lj.addr >= 0:
                labels.append((lj.addr, LABEL.match(lj.text).group(1)))
            j += 1
        binf = OUTDIR / f"{s:06X}.bin"
        binf.write_bytes(pc.code)
        rel = binf.relative_to(ROOT).as_posix()
        out += [f"; {pc.src.name}: {pc.name}, ${s:06X}-${e:06X}",
                f"\tif * <> ${s:06X}", f'\terror "{pc.src.name} placed at \\{{*}}, not ${s:06X}"', "\tendif"]
        at = s
        for a, name in sorted(labels, key=lambda x: x[0]):
            if a > at:
                out.append(f'\tbinclude "{rel}",${at - s:X},${a - at:X}')
                at = a
            out.append(f"{name}:")
        if e > at:
            out.append(f'\tbinclude "{rel}",${at - s:X},${e - at:X}')
        stats["c_bytes"] += e - s
        # what the last covered line has past the module's end still comes from the source
        if last is not None and last.end > e:
            if INCF.match(last.text):
                rows = [r for r in last.rows if r[1] >= e]
                if not rows or rows[0][1] != e:
                    raise LinkError(f"{pc.src.name}: ends at ${e:06X}, inside an instruction of {last.text.strip()}")
                body = (ROOT / INCF.match(last.text).group(1)).read_text(encoding="utf-8").splitlines()
                tail = body[rows[0][0] - 1:]
                out += [f"; the rest of {INCF.match(last.text).group(1)} from ${e:06X}"] + tail
                stats["kept_tail_lines"] += len(tail)
            elif INCROM.match(last.text):
                out.append(f"\tincrom\t${e:06X},${last.end - e:X}")
            else:
                raise LinkError(f"{pc.src.name}: ends at ${e:06X}, inside xmen2.asm line {last.no}")
        out += [f"\tif * <> ${max(e, last.end if last else e):06X}",
                f'\terror "after {pc.src.name}: at \\{{*}}"', "\tendif"]
        k += 1
        i = j
    if k < len(pieces):
        raise LinkError(f"{pieces[k].src.name}: no xmen2.asm line at ${pieces[k].addr:06X}")
    return "\n".join(out) + "\n", stats


def build(root: Path, corrupt: str = "", jobs: int = 8, quiet: bool = False) -> int:
    """build.py --from-c: after the gate build (its listing places xmen2.asm's lines), the C build."""
    import hashlib
    import time
    import build as asm
    t0 = time.time()
    names = cc.Names()
    try:
        pieces = link(root, names, read_segments(), jobs)
    except LinkError as e:
        print(f"FAIL: link\n{e}")
        return 1
    t1 = time.time()
    if corrupt:     # the negative test: one byte of one C function changed
        addr, _, off = corrupt.partition(":")
        pc = next((p for p in pieces if p.addr == int(addr, 16)), None)
        if pc is None:
            print(f"FAIL: --corrupt {corrupt}: no C function at ${addr}")
            return 2
        o = int(off, 16) if off else len(pc.code) // 2
        b = bytearray(pc.code)
        b[o] ^= 0xFF
        pc.code = bytes(b)
        print(f"   (negative test: {pc.name}+${o:X} changed)")
    try:
        text, stats = splice(pieces, main_lines(ROOT / "build" / "xmen2.lst"))
    except LinkError as e:
        print(f"FAIL: splice\n{e}")
        return 1
    (ROOT / MAIN).write_text(text, encoding="utf-8", newline="\n")
    ok, msg = asm.assemble(MAIN)
    if not ok:
        print("FAIL: assembler error (C build)\n" + msg[-3000:])
        return 1
    stem = Path(MAIN).stem
    out = ROOT / "build" / f"{stem}.bin"
    r = __import__("subprocess").run([str(asm.P2BIN), f"build/{stem}.p", out.relative_to(ROOT).as_posix()], cwd=ROOT,
                                     capture_output=True, text=True, stdin=__import__("subprocess").DEVNULL)
    if r.returncode != 0 or not out.exists():
        print("FAIL: p2bin (C build)\n" + r.stdout + r.stderr)
        return 1
    built, orig = out.read_bytes(), asm.ROM.read_bytes()
    t2 = time.time()
    sha = hashlib.sha1(built).hexdigest()
    if built != orig:
        bad = [i for i in range(min(len(built), len(orig))) if built[i] != orig[i]]
        where = {}
        for i in bad:
            pc = next((p for p in pieces if p.addr <= i < p.addr + len(p.code)), None)
            where.setdefault(f"{pc.name} ({pc.src.name}, ${pc.addr:06X})" if pc else "assembly", []).append(i)
        print(f"FAIL: C build SHA-1 {sha}, not the ROM's; sizes {len(built)} vs {len(orig)}; differs in "
              + "; ".join(f"{w}: {len(v)} bytes from ${v[0]:06X}" for w, v in list(where.items())[:10]))
        return 1
    kinds: dict[str, int] = {}
    for pc in pieces:
        for kk, n in pc.kinds.items():
            kinds[kk] = kinds.get(kk, 0) + n
    if quiet:
        print(f"OK: C build byte-identical ({len(pieces)} C functions)")
    else:
        print(f"OK: C build byte-identical, SHA-1 {sha}")
        print(f"   {len(pieces)} C functions ({stats['c_bytes']} bytes, {stats['files_replaced']} src/f files and "
              f"{stats['incrom_bytes']} incrom bytes replaced, {stats['kept_tail_lines']} source lines kept past "
              f"module ends); references {kinds}; link {t1 - t0:.1f} s, splice + assemble {t2 - t1:.1f} s")
    return 0


# --- the checks -----------------------------------------------------------------------------

def check(pieces: list[Piece], rom: bytes) -> list[str]:
    """Each written module against the ROM: the functions whose bytes differ, and where."""
    out = []
    for pc in pieces:
        got, want = pc.code, rom[pc.addr:pc.addr + len(pc.code)]
        if got != want:
            k = next(i for i in range(len(got)) if got[i] != want[i])
            near = [f"{n}({kind})" for o, n, kind in pc.refs if o - 2 <= k < o + 4]
            out.append(f"{pc.src.name} {pc.name}: {sum(a != b for a, b in zip(got, want))} bytes differ, first "
                       f"+{k:#x} (${pc.addr + k:06X}): {got[k:k + 4].hex()} vs ROM {want[k:k + 4].hex()}"
                       + (f" ref {', '.join(near)}" if near else ""))
    return out


def infer_segments(pieces: list[Piece], names: cc.Names, rom: bytes) -> tuple[list[int], str]:
    """Segment starts that explain every PC-relative reference of the C: a reference the ROM keeps
    PC-relative has no segment start between it and its target; one the linker rewrote to a jump-
    table access has one. Starts are taken at function starts, as few as explain the rewrites."""
    same, diff = [], []
    for pc in pieces:
        for off, name, kind in pc.refs:
            if kind != "pcrel":
                continue
            a = pc.addr + off
            t = names.addr[cc.LIB_NAMES.get(name, name)]
            lo, hi = min(a, t), max(a, t)
            op_rom = int.from_bytes(rom[a - 2:a], "big")
            op = int.from_bytes(pc.code[off - 2:off], "big")
            if op_rom == op:
                same.append((lo, hi))
            elif (op & ~0x3F) == (op_rom & ~0x3F) and op & 0x3F == 0x3A and op_rom & 0x3F == 0x2D:
                diff.append((lo, hi, f"{pc.name}+{off:#x} -> {name}"))
            else:
                raise LinkError(f"{pc.name}+{off:#x}: opcode {op:04X} vs ROM {op_rom:04X}")
    starts = sorted(set(names.addr.values()))
    # a start B lies between lo and hi when lo < B <= hi; B is barred by every same-segment pair
    import bisect
    barred = [0] * (len(starts) + 1)
    for lo, hi in same:
        i, j = bisect.bisect_right(starts, lo), bisect.bisect_right(starts, hi)
        barred[i] += 1
        barred[j] -= 1
    ok, run = [], 0
    for i, b in enumerate(starts):
        run += barred[i]
        if run == 0:
            ok.append(b)
    # interval stabbing, by right end: each start as late as the rewrites allow
    chosen: list[int] = []
    why: dict[int, str] = {}
    for lo, hi, what in sorted(diff, key=lambda x: x[1]):
        if chosen and lo < chosen[-1] <= hi:
            continue
        k = bisect.bisect_right(ok, hi) - 1
        if k < 0 or ok[k] <= lo:
            raise LinkError(f"no segment start can separate {what} (${lo:06X}-${hi:06X})")
        chosen.append(ok[k])
        why[ok[k]] = what
    # how early each start could be, the others kept: past the latest left end of the rewrites
    # only it separates (the original link's boundary is somewhere in that range)
    lines = []
    for b in chosen:
        sole = [lo for lo, hi, _ in diff if lo < b <= hi and sum(lo < c <= hi for c in chosen) == 1]
        floor = max(sole, default=b - 1)
        earliest = ok[bisect.bisect_right(ok, floor)]
        lines.append(f"${b:06X}  {names.at(b):34} ; could be from ${earliest:06X}; {why[b]}")
    return chosen, "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--recomp", type=Path, help="the game repo (default $XMEN2_RECOMP or ../XMen2Recomp)")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--infer-segments", action="store_true")
    ap.add_argument("--only", default="")
    ap.add_argument("--jobs", type=int, default=8)
    a = ap.parse_args()
    from m68k import load_rom
    root = a.recomp or recomp_root()
    names = cc.Names()
    only = {x.upper().zfill(6) for x in a.only.split(",") if x} or None
    rom = load_rom()
    if a.infer_segments:
        pieces = link(root, names, None, a.jobs, only)
        chosen, text = infer_segments(pieces, names, rom)
        SEGMENTS.parent.mkdir(parents=True, exist_ok=True)
        SEGMENTS.write_text(SEGMENTS_HEADER + text + "\n", encoding="utf-8", newline="\n")
        print(f"{len(chosen)} segment starts -> {SEGMENTS.relative_to(ROOT)}")
        return 0
    if a.check:
        pieces = link(root, names, read_segments(), a.jobs, only)
        bad = check(pieces, rom)
        print("\n".join(bad[:60]))
        tot: dict[str, int] = {}
        for pc in pieces:
            for k, n in pc.kinds.items():
                tot[k] = tot.get(k, 0) + n
        print(f"{len(pieces) - len(bad)}/{len(pieces)} modules equal the ROM; references: {tot}")
        return 1 if bad else 0
    ap.print_help()
    return 1


if __name__ == "__main__":
    sys.exit(main())
