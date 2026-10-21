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
The patched field in the object holds the reference's addend (g_Table+$50) and is added in;
MPW library entry points (memset, LDIVT, ...) resolve to the disassembly's names (LIB_NAMES).
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
DEFAULT_FLAGS = "-mbg off -b"


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

IDENT = re.compile(r"[A-Za-z_]\w*")
# One-line declarations of the game repo's headers (phase 4): a prototype, a ROM data name,
# a global. MPW C 3.3's global symbol table cannot hold all of them at once (Fatal Error 429),
# so a file is compiled with the lines that declare names it uses; a declaration nothing uses
# generates no code, so the subset compiles to the same object.
SUBSET_LINE = {
    "xmen2_funcs.h": re.compile(r"^[^#/(]*?\b([A-Za-z_]\w*)\s*\([^;]*\)\s*;"),
    "xmen2_data.h": re.compile(r"^extern\s+void\s+([A-Za-z_]\w*)\s*\(\s*\)\s*;"),
    "xmen2_globals.h": re.compile(r"^extern\s+[^;]*?\b([A-Za-z_]\w*)\s*(?:\[[^\]]*\])?\s*;"),
}


def header_subset(name: str, text: str, used: set[str]) -> str:
    pat = SUBSET_LINE.get(name)
    if not pat:
        return text
    out = []
    for line in text.splitlines():
        m = pat.match(line)
        if m and m.group(1) not in used:
            continue
        out.append(line)
    return "\n".join(out) + "\n"


def game_headers(root: Path) -> list[Path]:
    """A game repo's header directories: game/include, and platform/ (phase 5: the hardware names,
    whose MPW definitions are the addresses) when it exists."""
    return [d for d in (root / "game" / "include", root / "platform") if d.is_dir()]


def compile_c(src: Path, cand: dict, flags: str, include: "Path | list[Path] | None" = None) -> tuple[bytes | None, str]:
    """Compile src with the candidate -> (object file bytes, compiler output). `include`: a
    directory (or several) whose headers are put next to the source (`#include "x.h"` finds them)."""
    tc = toolchains()
    mps = tc / "bin" / ("mps.exe" if os.name == "nt" else "mps")
    tool = tc / cand["root"] / cand["compiler"]
    if not mps.exists() or not tool.exists():
        return None, f"missing {mps if not mps.exists() else tool} (see docs/COMPILER.md: toolchain setup)"
    env = dict(os.environ, MPW=str(tc / "mpw-gm" / "MPW"))
    with tempfile.TemporaryDirectory(prefix="xmen2cc_") as wd:
        # The compiler runs from a private copy (mps's File Exchange layout: the data fork, then
        # FINDER.DAT/ and RESOURCE.FRK/ beside it). A job killed mid-compile once left the shared
        # tool with no resource fork (2026-10-21: every later compile failed "Unable to open the
        # resource fork"), and parallel jobs sharing one tool were what LESSONS.md lists as the
        # source of that error.
        own = Path(wd) / "tool"
        for sub in ("", "FINDER.DAT", "RESOURCE.FRK"):
            p = tool.parent / sub / tool.name
            if p.exists():
                (own / sub).mkdir(parents=True, exist_ok=True)
                shutil.copyfile(p, own / sub / tool.name)
        tool = own / tool.name
        name = "f.c"
        shutil.copy(src, Path(wd) / name)
        dirs = list(include) if isinstance(include, (list, tuple)) else [include] if include else []
        if dirs:
            used = set(IDENT.findall(re.sub(r"/\*.*?\*/", " ", src.read_text(encoding="utf-8", errors="replace"), flags=re.S)))
            for h in sorted(h for d in dirs for h in d.glob("*.h")):
                text = h.read_text(encoding="utf-8", errors="replace")
                (Path(wd) / h.name).write_text(header_subset(h.name, text, used), encoding="mac_roman", errors="replace")
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

# MPW library entry points (cc_libmatch.py --scan) -> the disassembly's names for them
LIB_NAMES = {"memcpy": "Mem_Copy", "memset": "Mem_Set", "ULMULT": "Math_LMul", "LDIVT": "Math_LDivS",
             "LMODT": "Math_LModS", "_LMODT": "Math_DivModS", "_ULMODT": "Math_DivModU"}


def check_ref(rom: bytes, names: Names, base: int, obj: bytes, ref: mpwobj.Ref, off: int) -> tuple[bool, str, set[int]]:
    """Does reference `ref` patched at module offset `off` resolve in the ROM to ref.name?
    Returns (ok, explanation, module offsets the explanation accounts for)."""
    a = base + off
    want = LIB_NAMES.get(ref.name, ref.name)
    if ref.computed:
        return True, f"computed {ref.name}-{ref.name2} (masked)", set(range(off, off + ref.patch))
    # the patched field holds the addend (e.g. g_Table+$50); the linker adds the symbol to it
    if ref.patch == 4:
        add = int.from_bytes(obj[off:off + 4], "big", signed=True)
        v = int.from_bytes(rom[a:a + 4], "big") - add
        got = names.at(v)
        return got == want, f"abs.l {got}{add:+#x}", set(range(off, off + 4))
    add = int.from_bytes(obj[off:off + 2], "big", signed=True)
    d = int.from_bytes(rom[a:a + 2], "big", signed=True) - add
    cover = {off, off + 1}
    if ref.a5:
        if want in names.globals:
            ok = names.globals[want] == d
            return ok, f"A5 {d:+#x}{add:+#x} = global {want}" if ok else f"A5 {d:+#x}, {want} is {names.globals[want]:+#x}", cover
        got = names.jt.get(d)
        # +2: a code symbol the C declared as extern data; MPW Link resolves the A5 data
        # reference to its jump-table entry's jmp target field (Deathbird_StateSendHornets'
        # move.l Tbl_Hornet_vtable+2(a5)). The ROM's displacement is entry + 2 just the same.
        return got == want and add in (0, 2), f"A5 {d:+#x}{add:+#x} -> jt {got}", cover
    # PC-relative from code: same segment, or rewritten by the linker to a jump-table access
    op_obj = int.from_bytes(obj[off - 2:off], "big") if off >= 2 else 0
    op_rom = int.from_bytes(rom[a - 2:a], "big")
    if op_obj == op_rom:
        got = names.at(a + d)
        return got == want, f"pc-rel -> {got}{add:+#x}", cover
    if (op_obj & ~0x3F) == (op_rom & ~0x3F) and PCREL_TO_A5.get(op_obj & 0x3F) == op_rom & 0x3F:
        got = names.jt.get(d)
        return got == want and add == 0, f"pc-rel made jt call by the linker: A5 {d:+#x} -> {got}", cover | {off - 2, off - 1}
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


def match(src: Path, cid: str, flags: str, verbose: bool = True, include: "Path | list[Path] | None" = None,
          names: "Names | None" = None) -> tuple[bool, str]:
    addr = int(src.stem, 16)
    names = names or Names()
    fname = names.funcs.get(addr)
    if fname is None:
        return False, f"{src.name}: ${addr:06X} is not a function start"
    cand = candidate(cid)
    obj, out = compile_c(src, cand, file_flags(src, flags), include)
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


# The game repo's mode switch (xmen2_mem.h): MPW C predefines `applec`, and xmen2_mem.h defines
# XMEN2_MPW under it, first thing (every game/c file includes xmen2.h first, which includes
# xmen2_mem.h first). These are the only conditions mpw_view decides.
_MPW_COND = {
    re.compile(r"#\s*ifdef\s+(XMEN2_MPW|applec)\b"): True,
    re.compile(r"#\s*ifndef\s+(XMEN2_MPW|applec)\b"): False,
    re.compile(r"#\s*if\s+defined\s*\(\s*applec\s*\)\s*\|\|\s*defined\s*\(\s*XMEN2_MPW\s*\)"): True,
}


def mpw_view(text: str, c_file: bool) -> str:
    """The text MPW C compiles: the branches of `#ifdef XMEN2_MPW` / `#ifndef XMEN2_MPW` /
    `#if defined(applec) || defined(XMEN2_MPW)` it doesn't take are dropped, every other line
    and conditional kept as written. A cache key over this view doesn't change when only the PC
    or native branches change (phase 5 edits them all the time), and changes whenever anything
    MPW reads changes. Anything it can't decide exactly (a condition before a C file's include
    of xmen2.h, an #elif in a decided block, unbalanced conditionals) returns the text as it is."""
    out: list[str] = []
    stack: list[tuple[str, bool, bool]] = []   # (kind 'mpw'|'keep', branch taken, parent active)
    active = True
    known = not c_file                          # XMEN2_MPW is defined from here on
    for line in text.splitlines():
        s = line.strip()
        if c_file and not known and re.match(r'#\s*include\s+"xmen2\.h"', s):
            known = True
        if s.startswith("#"):
            d = re.match(r"#\s*(\w+)", s)
            word = d.group(1) if d else ""
            if word in ("if", "ifdef", "ifndef"):
                val = next((v for pat, v in _MPW_COND.items() if pat.match(s)), None)
                if val is not None and "applec" not in s and not known:
                    return text                 # XMEN2_MPW not yet defined here: can't decide
                if val is None:
                    stack.append(("keep", True, active))
                    if active:
                        out.append(line)
                else:
                    stack.append(("mpw", val, active))
                    active = active and val
                continue
            if word in ("else", "elif", "endif"):
                if not stack:
                    return text
                kind, val, parent = stack[-1]
                if kind == "keep":
                    if word == "endif":
                        stack.pop()
                    if parent:
                        out.append(line)
                    continue
                if word == "elif":
                    return text
                if word == "else":
                    stack[-1] = (kind, not val, parent)
                    active = parent and not val
                else:
                    stack.pop()
                    active = parent
                continue
        if active:
            out.append(line)
    return text if stack else "\n".join(out) + "\n"


def match_recomp(root: Path, cid: str, flags: str, only: list[str] | None = None, jobs: int = 8) -> dict:
    """Phase 4 (P4-decomp.md "Matched"): every game/c/<ADDR>.c of the game repo at `root`,
    compiled with its headers (game/include, and platform/ in phase 5: game_headers) in their MPW
    mode, matched like --match. Results are cached by the hash of what MPW compiles of the file
    and the headers (mpw_view), the candidate and the flags."""
    import concurrent.futures
    import hashlib
    import json
    inc = game_headers(root)
    files = sorted(p for p in (root / "game" / "c").glob("*.c") if re.fullmatch(r"[0-9A-Fa-f]{6}", p.stem))
    if only:
        want = {a.upper().zfill(6) for a in only}
        files = [p for p in files if p.stem.upper() in want]
    h = hashlib.sha1(f"mpw_view 1|{cid}|{flags}".encode())
    # the names a verdict resolves references with (Names: the handoff tables, the symbols); a stale
    # build/recomp once turned 129 matches into NO MATCH (2026-10-21), and the cache kept them
    for p in (RECOMP / "ram_globals.csv", RECOMP / "jumptable.csv", RECOMP / "functions.csv",
              ROOT / "build" / "symbols.txt"):
        h.update(p.name.encode() + b"\0" + (p.read_bytes() if p.exists() else b""))
    for p in sorted((h_ for d in inc for h_ in d.glob("*.h")), key=lambda q: q.name):
        h.update(p.name.encode() + b"\0" + mpw_view(p.read_text(encoding="utf-8", errors="replace"), False).encode())
    base = h.hexdigest()
    cache_path = ROOT / "build" / "match_recomp_cache.json"
    cache = json.loads(cache_path.read_text(encoding="utf-8")) if cache_path.exists() else {}
    names = Names()
    todo, res = [], {}
    for p in files:
        view = mpw_view(p.read_text(encoding="utf-8", errors="replace"), True)
        key = hashlib.sha1(f"{base}|{file_flags(p, flags)}|".encode() + view.encode()).hexdigest()
        hit = cache.get(p.stem.upper())
        if hit and hit.get("key") == key:
            res[p.stem.upper()] = hit
        else:
            todo.append((p, key))

    # the emulated Mac's tools, run 8 at a time, sometimes can't open the compiler ("Unable to open
    # the resource fork", OS error -39): not a verdict on the C. Retried; never cached.
    TOOL_ERROR = re.compile(r"Unable to open the resource fork|end-of-file reached during read operation")

    def run(item):
        p, key = item
        for _attempt in range(3):
            ok, msg = match(p, cid, flags, verbose=False, include=inc, names=names)
            if ok or not TOOL_ERROR.search(msg):
                break
        lines = msg.splitlines()
        return p.stem.upper(), {"key": key, "ok": ok, "detail": " | ".join(lines[:3]),
                                "tool_error": not ok and bool(TOOL_ERROR.search(msg))}
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as ex:
        for a, r in ex.map(run, todo):
            res[a] = r
            if not r.pop("tool_error"):
                cache[a] = r
    if todo:
        cache_path.parent.mkdir(parents=True, exist_ok=True)
        cache_path.write_text(json.dumps(cache, indent=0), encoding="utf-8")
    return {"matched": sorted(a for a, r in res.items() if r["ok"]),
            "files": {a: {"ok": r["ok"], "detail": r["detail"]} for a, r in sorted(res.items())},
            "candidate": cid, "flags": flags}


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
    ap.add_argument("--match-recomp", type=Path, metavar="ROOT",
                    help="phase 4: match every game/c/<ADDR>.c of the game repo at ROOT")
    ap.add_argument("--only", default="", help="--match-recomp: comma-separated addresses")
    ap.add_argument("--include", type=Path, help="headers to compile FILE / --match FILE with")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--candidate")
    ap.add_argument("--flags")
    ap.add_argument("-q", "--quiet", action="store_true")
    a = ap.parse_args()
    v = verdict()
    cid = a.candidate or v.get("candidate") or DEFAULT_CANDIDATE
    flags = a.flags if a.flags is not None else v.get("flags", DEFAULT_FLAGS)
    if a.selftest:
        return selftest(cid, flags)
    if a.match_recomp:
        import json
        r = match_recomp(a.match_recomp, cid, flags, [x for x in a.only.split(",") if x])
        if a.json:
            print(json.dumps(r))
        else:
            for addr, f in r["files"].items():
                print(f["detail"] if not a.quiet or not f["ok"] else f"{addr} MATCH")
            print(f"{len(r['matched'])}/{len(r['files'])} game/c files match with {cid}")
        return 0
    if a.match:
        include = a.include
        if include is None and a.match.parent.name == "c" and (a.match.parent.parent / "include").is_dir():
            include = game_headers(a.match.parent.parent.parent)   # a game repo's game/c/<ADDR>.c
        ok, msg = match(a.match, cid, flags, verbose=not a.quiet, include=include)
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
        include = a.include
        if include is None and a.file.parent.name == "c" and (a.file.parent.parent / "include").is_dir():
            include = game_headers(a.file.parent.parent.parent)
        obj, out = compile_c(a.file, candidate(cid), file_flags(a.file, flags), include)
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
