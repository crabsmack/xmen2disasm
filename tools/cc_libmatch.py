"""Phase 3 criterion C2: fingerprint the ROM's library routines against each candidate toolchain.

    uv run tools/cc_libmatch.py              # table: candidate x routine -> exact / differs / absent
    uv run tools/cc_libmatch.py --json       # {"results": {cand: {routine: status}}, "details": ...}
    uv run tools/cc_libmatch.py --scan ID    # every library module of candidate ID found in the ROM

Candidates come from config/compiler/candidates.toml (`status = "obtained"`, `root` under
$XMEN2_TOOLCHAINS, `libs` = globs under root, `lib_format` = "mpw" or "raw").

- mpw: libraries are MPW .o files (tools/mpwobj.py). Every module entry point is aligned on
  the ROM routine and the whole module compared byte for byte; bytes a relocation patches are
  masked (they hold link-time addresses). `exact` = every other byte equal.
- raw: library formats we don't parse (THINK project libraries, CodeWarrior .lib). The ROM
  routine is searched for in the raw file bytes with its own relocated fields masked
  (jsr/bsr displacements, absolute addresses). `exact` = found.
Not exact: `differs` when the library has a routine under one of the routine's known names
(ALIASES), else `absent`.
"""
from __future__ import annotations

import argparse
import csv
import json
import os
import sys
import tomllib
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import mpwobj  # noqa: E402
from build import ROOT  # noqa: E402
from m68k import load_rom  # noqa: E402

# disassembly name -> names the routine has in Mac toolchain libraries
ALIASES = {
    "Mem_Copy": ["memcpy", "_memcpy", "__memcpy"],
    "Mem_Set": ["memset", "_memset", "__memset"],
    "Math_LMul": ["ULMULT", "LMULT", "__lmul__", "_LMUL", "__lmul", "%%LMUL", "lmul"],
    "Math_LDivS": ["LDIVT", "__ldiv__", "_LDIV", "__ldiv", "%%LDIV", "ldivs"],
    "Math_LModS": ["LMODT", "__lmod__", "_LMOD", "__lmod", "%%LMOD", "lmods"],
    "Math_DivModS": ["_LMODT", "__ldivmod__", "_LDIVMOD"],
    "Math_DivModU": ["_ULMODT", "ULMODT", "__uldivmod__", "__uldiv__", "_ULDIV", "_ULMOD"],
}
LIB_ROUTINES = list(ALIASES)


def toolchains() -> Path:
    return Path(os.environ.get("XMEN2_TOOLCHAINS") or r"..\xmen2-toolchains")


def candidates() -> list[dict]:
    p = ROOT / "config" / "compiler" / "candidates.toml"
    return tomllib.loads(p.read_text(encoding="utf-8")).get("candidate", [])


def routines() -> dict[str, tuple[int, int]]:
    out = {}
    with open(ROOT / "build" / "recomp" / "functions.csv", newline="") as f:
        for r in csv.DictReader(f):
            if r["name"] in ALIASES:
                out[r["name"]] = (int(r["addr"], 16), int(r["end"], 16))
    return out


def lib_files(c: dict) -> list[Path]:
    root = toolchains() / c["root"]
    files = []
    for g in c.get("libs", []):
        files += sorted(p for p in root.glob(g) if p.is_file())
    return files


# --- MPW object libraries -----------------------------------------------------------------

def mpw_modules(c: dict) -> list[tuple[str, mpwobj.Module]]:
    out = []
    for p in lib_files(c):
        try:
            mods = mpwobj.parse_file(p)
        except (ValueError, IndexError):
            continue
        out += [(p.name.removesuffix(".bin"), m) for m in mods if not m.data_module]
    return out


def compare_module(rom: bytes, m: mpwobj.Module, base: int) -> tuple[int, int, int]:
    """(differing, masked, compared) bytes of module m laid at ROM address base."""
    code, mask = m.code(), m.patched()
    diff = masked = 0
    if base < 0 or base + len(code) > len(rom):
        return len(code), 0, 0
    for k, b in enumerate(code):
        if k in mask:
            masked += 1
        elif rom[base + k] != b:
            diff += 1
    return diff, masked, len(code)


def match_mpw(rom: bytes, mods, name: str, addr: int) -> dict:
    aliases = ALIASES[name]
    best = None
    for lib, m in mods:
        anchors = dict(m.entries)
        anchors.setdefault(m.name, 0)
        for ent, off in anchors.items():
            diff, masked, n = compare_module(rom, m, addr - off)
            named = ent in aliases
            if diff == 0 and n:
                return {"status": "exact", "lib": lib, "module": m.name, "entry": ent,
                        "module_addr": f"{addr - off:06X}", "bytes": n, "masked": masked}
            if named and (best is None or diff < best["differing"]):
                best = {"status": "differs", "lib": lib, "module": m.name, "entry": ent,
                        "differing": diff, "bytes": n}
    return best or {"status": "absent"}


def scan_mpw(rom: bytes, mods) -> list[dict]:
    """Every library code module that appears byte-identical (relocations masked) in the ROM."""
    found = []
    for lib, m in mods:
        code, mask = m.code(), m.patched()
        if len(code) < 12:
            continue
        # longest unmasked run as the search key
        runs, start = [], None
        for k in range(len(code) + 1):
            if k < len(code) and k not in mask:
                start = k if start is None else start
            elif start is not None:
                runs.append((k - start, start))
                start = None
        if not runs:
            continue
        ln, st = max(runs)
        if ln < 10:
            continue
        key = code[st:st + ln]
        i = rom.find(key)
        while i >= 0:
            base = i - st
            if compare_module(rom, m, base)[0] == 0:
                found.append({"lib": lib, "module": m.name, "addr": f"{base:06X}", "size": len(code),
                              "entries": {e: f"{base + o:06X}" for e, o in m.entries.items()}})
            i = rom.find(key, i + 1)
    return sorted(found, key=lambda f: f["addr"])


# --- raw library files ----------------------------------------------------------------------

def rom_reloc_mask(rom: bytes, a: int, b: int) -> set[int]:
    """Offsets (from a) of bytes in a ROM routine that a linker would have patched."""
    mask = set()
    for k in range(a, b - 1, 2):
        op = rom[k] << 8 | rom[k + 1]
        if op in (0x4EBA, 0x4EAD, 0x6100, 0x41FA, 0x43FA, 0x45FA, 0x47FA, 0x49FA, 0x4BFA):
            mask |= {k + 2 - a, k + 3 - a}            # pc/a5-relative 16-bit displacement
        elif op in (0x4EB9, 0x4EF9):
            mask |= {k + 2 - a + j for j in range(4)}  # absolute long
    return mask


def match_raw(rom: bytes, blobs: list[tuple[str, bytes]], name: str, a: int, b: int) -> dict:
    pat, mask = rom[a:b], rom_reloc_mask(rom, a, b)
    # search on the longest unmasked run, verify the rest
    runs, start = [], None
    for k in range(len(pat) + 1):
        if k < len(pat) and k not in mask:
            start = k if start is None else start
        elif start is not None:
            runs.append((k - start, start))
            start = None
    ln, st = max(runs)
    key = pat[st:st + ln]
    for lib, data in blobs:
        i = data.find(key)
        while i >= 0:
            base = i - st
            if base >= 0 and base + len(pat) <= len(data) and all(
                    k in mask or data[base + k] == pat[k] for k in range(len(pat))):
                return {"status": "exact", "lib": lib, "offset": base, "bytes": len(pat), "masked": len(mask)}
            i = data.find(key, i + 1)
    for lib, data in blobs:
        for al in ALIASES[name]:
            if al.encode("mac_roman") in data:
                return {"status": "differs", "lib": lib, "name_found": al}
    return {"status": "absent"}


def run(only: str | None = None) -> tuple[dict, dict]:
    rom = load_rom()
    rts = routines()
    results, details = {}, {}
    for c in candidates():
        if c.get("status") != "obtained" or (only and c["id"] != only):
            continue
        res = {}
        if c.get("lib_format") == "mpw":
            mods = mpw_modules(c)
            for name in LIB_ROUTINES:
                res[name] = match_mpw(rom, mods, name, rts[name][0])
        else:
            blobs = [(p.name, p.read_bytes()) for p in lib_files(c)]
            for name in LIB_ROUTINES:
                res[name] = match_raw(rom, blobs, name, *rts[name])
        if not lib_files(c):
            for name in LIB_ROUTINES:
                res[name] = {"status": "no-libraries", "searched": c.get("libs", [])}
        results[c["id"]] = {n: r["status"] for n, r in res.items()}
        details[c["id"]] = res
    return results, details


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--scan", metavar="ID", help="list every library module of candidate ID found in the ROM")
    a = ap.parse_args()
    if a.scan:
        c = next((c for c in candidates() if c["id"] == a.scan), None)
        if not c or c.get("lib_format") != "mpw":
            print(f"{a.scan}: not an obtained mpw-format candidate")
            return 1
        for f in scan_mpw(load_rom(), mpw_modules(c)):
            ents = ", ".join(f"{e}@{x}" for e, x in f["entries"].items())
            print(f"{f['addr']}  {f['size']:#6x}  {f['lib']:16} {f['module']:20} {ents}")
        return 0
    results, details = run()
    if a.json:
        print(json.dumps({"results": results, "details": details}, indent=1))
        return 0
    names = LIB_ROUTINES
    print(f"{'candidate':22}" + "".join(f"{n[:12]:>13}" for n in names))
    for cid, res in results.items():
        print(f"{cid:22}" + "".join(f"{res[n]:>13}" for n in names))
    for cid, res in details.items():
        for n, r in res.items():
            if r["status"] == "exact":
                where = r.get("module", "") + (f".{r['entry']}" if r.get("entry") else "")
                print(f"  {cid}: {n} = {r['lib']} {where} ({r['bytes']} bytes, {r['masked']} masked)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
