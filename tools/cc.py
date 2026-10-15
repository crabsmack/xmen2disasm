"""Phase 3 compile harness (criteria C3/C4): compile C with a candidate MPW compiler, headless,
and compare the code with the ROM.

    uv run tools/cc.py FILE.c                         # compile, list the code (capstone)
    uv run tools/cc.py --match config/compiler/match/039D24.c
    uv run tools/cc.py --match FILE.c --candidate mpw-c-3.2.4 --flags "-mbg off"
    uv run tools/cc.py --match-all [--candidate ID]   # every match/*.c, one line each
    uv run tools/cc.py --selftest

Compilers run under mps (Elliot Nunn's MPW emulator, $XMEN2_TOOLCHAINS/bin/mps.exe) in the
MPW 3.5 environment it installs ($XMEN2_TOOLCHAINS/mpw-gm/MPW); the candidate's own compiler
tool is passed by path, so any MPW C / SC version runs in it. No GUI, no Mac.

Candidate and flags default to config/compiler/verdict.toml (`candidate`, `flags`); a match file
may add flags with a line `/* cc-flags: ... */` (recorded per function, so per-file build
options stay visible).

--match FILE: FILE is named after the function's start address (src/f/<ADDR>.asm). The object
must hold a code module named like the disassembly's function (or a single code module). Its
bytes are laid at ADDR and compared with the ROM. Bytes a relocation patches are not masked
blindly: each reference must resolve, in the ROM, to the same name the C used:
  - A5-relative (globals, jump-table entries): the ROM's displacement is g_<name>'s A5 offset
    (build/recomp/ram_globals.csv) or a jump-table entry whose target is <name>
  - PC-relative 16-bit (calls/lea/pea within a segment): the ROM's displacement lands on <name>
  - the MPW linker turns PC-relative calls to another segment into jump-table calls
    (`jsr x(pc)` -> `jsr d(a5)`, also pea/lea): accepted when that entry targets <name>
  - 32-bit absolute: the ROM's long is <name>'s address (build/symbols.txt)
Exit 0 only when every other byte is equal and every reference resolves.
"""
from __future__ import annotations

import argparse
import csv
import os
import re
import shutil
import subprocess
import sys
import tempfile
import tomllib
from pathlib import Path

import capstone

sys.path.insert(0, str(Path(__file__).resolve().parent))
import mpwobj  # noqa: E402
from build import ROOT  # noqa: E402
from m68k import load_rom  # noqa: E402

CDIR = ROOT / "config" / "compiler"
RECOMP = ROOT / "build" / "recomp"
DEFAULT_CANDIDATE = "mpw-c-3.3.3"
DEFAULT_FLAGS = "-mbg off"


def toolchains() -> Path:
    return Path(os.environ.get("XMEN2_TOOLCHAINS") or r"..\xmen2-toolchains")


def verdict() -> dict:
    p = CDIR / "verdict.toml"
    return tomllib.loads(p.read_text(encoding="utf-8")) if p.exists() else {}


def candidate(cid: str) -> dict:
    cands = tomllib.loads((CDIR / "candidates.toml").read_text(encoding="utf-8")).get("candidate", [])
    for c in cands:
        if c["id"] == cid:
            if c.get("status") != "obtained" or not c.get("compiler"):
                sys.exit(f"{cid}: no obtained MPW compiler tool (status {c.get('status')})")
            return c
    sys.exit(f"{cid}: not in config/compiler/candidates.toml")


# --- compiling ---------------------------------------------------------------------------

def compile_c(src: Path, cand: dict, flags: str) -> tuple[bytes | None, str]:
    """Compile src with the candidate -> (object file bytes, compiler output)."""
    tc = toolchains()
    mps = tc / "bin" / ("mps.exe" if os.name == "nt" else "mps")
    tool = tc / cand["root"] / cand["compiler"]
    if not mps.exists() or not tool.exists():
        return None, f"missing {mps if not mps.exists() else tool} (see docs/COMPILER.md: toolchain setup)"
    env = dict(os.environ, MPW=str(tc / "mpw-gm" / "MPW"))
    with tempfile.TemporaryDirectory(prefix="xmen2cc_") as wd:
        name = "f.c"
        shutil.copy(src, Path(wd) / name)
        cmd = [str(mps), "%%", str(tool), *flags.split(), "-o", "f.o", name]
        r = subprocess.run(cmd, cwd=wd, capture_output=True, text=True, env=env, timeout=600,
                           encoding="mac_roman", errors="replace")
        out = (r.stdout + r.stderr).strip()
        obj = Path(wd) / "f.o"
        if r.returncode != 0 or not obj.exists():
            return None, out or f"compiler exit {r.returncode}"
        return obj.read_bytes(), out


def file_flags(src: Path, base: str) -> str:
    m = re.search(r"/\*\s*cc-flags:(.*?)\*/", src.read_text(encoding="utf-8", errors="replace"))
    return base + (" " + m.group(1).strip() if m else "")


# --- ROM-side names ------------------------------------------------------------------------

class Names:
    def __init__(self):
        self.funcs: dict[int, str] = {}
        self.func_end: dict[int, int] = {}
        with open(RECOMP / "functions.csv", newline="") as f:
            for r in csv.DictReader(f):
                a = int(r["addr"], 16)
                self.funcs[a] = r["name"]
                self.func_end[a] = int(r["end"], 16)
        self.addr: dict[str, int] = {}
        for line in (ROOT / "build" / "symbols.txt").read_text(encoding="utf-8").splitlines():
            if "=$" in line:
                n, v = line.split("=$", 1)
                self.addr[n.strip()] = int(v.strip(), 16)
        self.addr.update({n: a for a, n in self.funcs.items()})
        self.globals: dict[str, int] = {}
        with open(RECOMP / "ram_globals.csv", newline="") as f:
            for r in csv.DictReader(f):
                self.globals[r["name"]] = _signed_hex(r["a5_offset"])
        self.jt: dict[int, str] = {}       # a5 displacement of the jmp -> target name
        with open(RECOMP / "jumptable.csv", newline="") as f:
            for r in csv.DictReader(f):
                self.jt[int(r["a5_disp"].lstrip("$"), 16)] = r["target_name"]

    def at(self, a: int) -> str:
        return self.funcs.get(a) or next((n for n, v in self.addr.items() if v == a), f"${a:06X}")


def _signed_hex(s: str) -> int:
    s = s.replace("$", "")
    return -int(s[1:], 16) if s.startswith("-") else int(s, 16)


# --- comparison --------------------------------------------------------------------------

PCREL_TO_A5 = {0x3A: 0x2D}   # EA field (d16,PC) -> (d16,A5) in the low 6 bits of an opcode


def check_ref(rom: bytes, names: Names, base: int, obj: bytes, ref: mpwobj.Ref, off: int) -> tuple[bool, str, set[int]]:
    """Does reference `ref` patched at module offset `off` resolve in the ROM to ref.name?
    Returns (ok, explanation, module offsets the explanation accounts for)."""
    a = base + off
    want = ref.name
    if ref.computed:
        return True, f"computed {ref.name}-{ref.name2} (masked)", set(range(off, off + ref.patch))
    if ref.patch == 4:
        v = int.from_bytes(rom[a:a + 4], "big")
        got = names.at(v)
        return got == want, f"abs.l {got}", set(range(off, off + 4))
    d = int.from_bytes(rom[a:a + 2], "big", signed=True)
    cover = {off, off + 1}
    if ref.a5:
        if want in names.globals:
            return names.globals[want] == d, f"A5 {d:+#x} = global {want}" if names.globals[want] == d else f"A5 {d:+#x}, {want} is {names.globals[want]:+#x}", cover
        got = names.jt.get(d - 2) or names.jt.get(d)
        return got == want, f"A5 {d:+#x} -> jt {got}", cover
    # PC-relative from code: same segment, or rewritten by the linker to a jump-table access
    op_obj = int.from_bytes(obj[off - 2:off], "big") if off >= 2 else 0
    op_rom = int.from_bytes(rom[a - 2:a], "big")
    if op_obj == op_rom:
        got = names.at(a + d)
        return got == want, f"pc-rel -> {got}", cover
    if (op_obj & ~0x3F) == (op_rom & ~0x3F) and PCREL_TO_A5.get(op_obj & 0x3F) == op_rom & 0x3F:
        got = names.jt.get(d - 2) or names.jt.get(d)
        return got == want, f"pc-rel made jt call by the linker: A5 {d:+#x} -> {got}", cover | {off - 2, off - 1}
    return False, f"opcode {op_obj:04X} vs ROM {op_rom:04X}", cover


_MD = capstone.Cs(capstone.CS_ARCH_M68K, capstone.CS_MODE_BIG_ENDIAN | capstone.CS_MODE_M68K_000)


def disasm(code: bytes, addr: int) -> list[tuple[int, int, str]]:
    out, k = [], 0
    while k < len(code):
        ins = next(_MD.disasm(code[k:k + 10], addr + k), None)
        if ins is None:
            out.append((addr + k, 2, f"dc.w ${code[k:k + 2].hex().upper()}"))
            k += 2
        else:
            out.append((addr + k, ins.size, f"{ins.mnemonic} {ins.op_str}"))
            k += ins.size
    return out


def match(src: Path, cid: str, flags: str, verbose: bool = True) -> tuple[bool, str]:
    addr = int(src.stem, 16)
    names = Names()
    fname = names.funcs.get(addr)
    if fname is None:
        return False, f"{src.name}: ${addr:06X} is not a function start"
    cand = candidate(cid)
    obj, out = compile_c(src, cand, file_flags(src, flags))
    if obj is None:
        return False, f"{src.name}: compile failed:\n{out}"
    mods = [m for m in mpwobj.parse(obj) if not m.data_module]
    mod = next((m for m in mods if m.name == fname), mods[0] if len(mods) == 1 else None)
    if mod is None:
        return False, f"{src.name}: no code module named {fname} (have {[m.name for m in mods]})"
    rom = load_rom()
    code = mod.code()
    end = names.func_end[addr]
    probs = []
    if addr + len(code) < end:
        probs.append(f"module is {len(code):#x} bytes, function ${addr:06X}-${end:06X} is {end - addr:#x}")
    accounted: dict[int, str] = {}
    for ref in mod.refs:
        for off in ref.offsets:
            ok, why, cover = check_ref(rom, names, addr, code, ref, off)
            for k in cover:
                accounted[k] = why
            if not ok:
                probs.append(f"+{off:#x} ref {ref.name}: {why}")
    diffs = [k for k, b in enumerate(code) if k not in accounted and rom[addr + k] != b]
    if diffs:
        probs.append(f"{len(diffs)} bytes differ (first at +{diffs[0]:#x})")
    ok = not probs
    lines = [f"{src.name}: {fname} {'MATCH' if ok else 'NO MATCH'} ({cid}, {file_flags(src, flags)!r}, "
             f"{len(code):#x} bytes, {sum(len(r.offsets) for r in mod.refs)} refs)"]
    lines += [f"  {p}" for p in probs]
    if verbose and not ok:
        lines.append("  compiled                                   | ROM")
        theirs = {a: (n, t) for a, n, t in disasm(rom[addr:addr + len(code)], addr)}
        for a, n, t in disasm(code, addr):
            k = a - addr
            bad = any(j in diffs for j in range(k, k + n))
            r = theirs.get(a, (0, "(misaligned)"))[1]
            lines.append(f"  {'!!' if bad else '  '} {a:06X} {t[:38]:38} | {r[:38]}")
    return ok, "\n".join(lines)


SELFTEST_C = """
long BanimazaDoor_GetSize(void *cls)
{
	return 0xA2;
}
"""


def selftest(cid: str, flags: str) -> int:
    with tempfile.TemporaryDirectory(prefix="xmen2cc_st_") as wd:
        src = Path(wd) / "039D16.c"
        src.write_text(SELFTEST_C, encoding="ascii")
        obj, out = compile_c(src, candidate(cid), flags)
        if obj is None:
            print(f"selftest: compile failed with {cid}: {out}")
            return 1
        mods = [m for m in mpwobj.parse(obj) if not m.data_module]
        print(f"selftest: {cid} compiled {len(mods)} module(s): " +
              ", ".join(f"{m.name} {m.code().hex(' ').upper()}" for m in mods))
        ok, msg = match(src, cid, flags)
        print(msg)
        return 0 if ok and mods else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("file", nargs="?", type=Path)
    ap.add_argument("--match", type=Path, metavar="FILE")
    ap.add_argument("--match-all", action="store_true")
    ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--candidate")
    ap.add_argument("--flags")
    ap.add_argument("-q", "--quiet", action="store_true")
    a = ap.parse_args()
    v = verdict()
    cid = a.candidate or v.get("candidate") or DEFAULT_CANDIDATE
    flags = a.flags if a.flags is not None else v.get("flags", DEFAULT_FLAGS)
    if a.selftest:
        return selftest(cid, flags)
    if a.match:
        ok, msg = match(a.match, cid, flags, verbose=not a.quiet)
        print(msg)
        return 0 if ok else 1
    if a.match_all:
        bad = 0
        files = sorted((CDIR / "match").glob("*.c"))
        for f in files:
            ok, msg = match(f, cid, flags, verbose=False)
            bad += not ok
            print(msg.splitlines()[0] if ok else msg)
        print(f"{len(files) - bad}/{len(files)} match with {cid}")
        return 1 if bad else 0
    if a.file:
        obj, out = compile_c(a.file, candidate(cid), file_flags(a.file, flags))
        if out:
            print(out)
        if obj is None:
            return 1
        for m in mpwobj.parse(obj):
            if m.data_module:
                print(f"data {m.name} ({m.size:#x} bytes)")
                continue
            print(f"{m.name}:")
            refs = {o: r for r in m.refs for o in r.offsets}
            for adr, n, t in disasm(m.code(), 0):
                rr = [refs[k] for k in range(adr, adr + n) if k in refs]
                print(f"  {adr:04X}  {m.code()[adr:adr + n].hex().upper():20} {t}" +
                      (f"   ; ref {rr[0].name}{' (A5)' if rr[0].a5 else ''}" if rr else ""))
        return 0
    ap.print_help()
    return 1


if __name__ == "__main__":
    sys.exit(main())
