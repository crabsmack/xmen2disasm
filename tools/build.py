"""The ONLY build path: assemble xmen2.asm with AS, verify against the original ROM.

    uv run tools/build.py            # build + verify + progress
    uv run tools/build.py --quiet    # one-line result (for hooks / agents)

Exit code 0 only when the rebuilt ROM is byte-identical (SHA-1 match).
Also writes build/xmen2.code_addrs.txt (instruction-start oracle in the format
segagenesisrecomp's `code_addrs_file` expects) and build/symbols.txt.
"""
from __future__ import annotations

import argparse
import hashlib
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TOOLS = ROOT / "build_tools" / ("Windows-x86" if sys.platform == "win32" else "Linux-x86_64")
ASW = TOOLS / ("asw.exe" if sys.platform == "win32" else "asl")
P2BIN = TOOLS / ("p2bin.exe" if sys.platform == "win32" else "p2bin")
ROM = ROOT / "xmen2.bin"
OUT = ROOT / "build" / "xmen2.built.bin"
ROM_SHA1 = "61409e6cf6065ab67d8952b891d8edcf47777193"

ROW = re.compile(r"^(?:\(\d+\))?\s*(?:\d+/)?\s*([0-9A-F]+) : ((?:[0-9A-F]{4} ?)+)\s*(.*)$")
LABEL = re.compile(r"^(?:\(\d+\))?\s*\d+/\s*([0-9A-F]+) : \s+([A-Za-z_][\w.]*):")
DATA_RE = re.compile(r"^(?:dc\.[bwl]|dcb\.[bwl]|ds\.[bwl]|binclude|incbin|even|align|cnop|org)\b", re.I)


def assemble(main: str = "xmen2.asm") -> tuple[bool, str]:
    (ROOT / "build").mkdir(exist_ok=True)
    stem = Path(main).stem
    cmd = [str(ASW), "-xx", "-n", "-q", "-A", "-L", "-U", "-i", ".", "-olist", f"build/{stem}.lst",
           "-o", f"build/{stem}.p", main]
    r = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, stdin=subprocess.DEVNULL, timeout=600)
    msg = (r.stdout + r.stderr).strip()
    return r.returncode == 0, msg


def parse_listing(path: Path):
    """Yield (addr, bytes, source_text) for every emitting row (continuations merged)."""
    cur = None
    for line in path.read_text(encoding="latin-1").splitlines():
        m = ROW.match(line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        data = bytes.fromhex(m.group(2).replace(" ", ""))
        is_cont = "/" not in line.split(":")[0]
        if is_cont and cur and cur[0] + len(cur[1]) == addr:
            cur = (cur[0], cur[1] + data, cur[2])
            continue
        if cur:
            yield cur
        cur = (addr, data, m.group(3).strip())
    if cur:
        yield cur


def export_oracles(lst: Path) -> int:
    code = []
    for addr, _data, src in parse_listing(lst):
        mnem = src.split()[0] if src.split() else ""
        if mnem.endswith(":"):  # label on same line
            parts = src.split()
            mnem = parts[1] if len(parts) > 1 else ""
        if mnem and not DATA_RE.match(mnem) and addr < 0x200000:
            code.append(addr)
    code = sorted(set(code))
    (ROOT / "build" / "xmen2.code_addrs.txt").write_text("".join(f"{a:06X}\n" for a in code))
    syms = []
    for line in lst.read_text(encoding="latin-1").splitlines():
        m = LABEL.match(line)
        if m:
            syms.append((int(m.group(1), 16), m.group(2)))
    (ROOT / "build" / "symbols.txt").write_text("".join(f"{n}=${a:06X}\n" for a, n in sorted(syms)))
    return len(code)


def progress() -> str:
    rom_size = ROM.stat().st_size
    code_files = sorted((ROOT / "src" / "f").glob("*.asm"))
    named = 0
    for f in code_files:
        for line in f.read_text().splitlines():
            if re.match(r"^[A-Za-z_]\w*:", line):
                if not re.match(r"^(sub|loc)_[0-9A-F]{6}:", line):
                    named += 1
                break
    code_addrs = (ROOT / "build" / "xmen2.code_addrs.txt").read_text().split()
    main = (ROOT / "xmen2.asm").read_text()
    raw = sum(int(m.group(2), 16) for m in re.finditer(r"^\s*(?:\w+:\s*)?incrom\s+\$([0-9A-F]+),\$([0-9A-F]+)", main, re.M))
    return (f"functions {len(code_files)} (named {named}, {100 * named / max(1, len(code_files)):.1f}%) | "
            f"instructions {len(code_addrs)} | unexplored raw ROM {raw} bytes "
            f"({100 * raw / rom_size:.1f}%)")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--quiet", action="store_true")
    args = ap.parse_args()
    if not ROM.exists():
        print(f"FAIL: original ROM missing at {ROM} (supply your own dump; see README)")
        return 2
    if hashlib.sha1(ROM.read_bytes()).hexdigest() != ROM_SHA1:
        print("FAIL: xmen2.bin is not the expected USA/Europe dump (SHA-1 mismatch)")
        return 2

    ok, msg = assemble()
    if not ok:
        print("FAIL: assembler error\n" + msg[-3000:])
        return 1
    r = subprocess.run([str(P2BIN), "build/xmen2.p", str(OUT.relative_to(ROOT))], cwd=ROOT,
                       capture_output=True, text=True, stdin=subprocess.DEVNULL)
    if r.returncode != 0 or not OUT.exists():
        print("FAIL: p2bin\n" + r.stdout + r.stderr)
        return 1
    built, orig = OUT.read_bytes(), ROM.read_bytes()
    n = export_oracles(ROOT / "build" / "xmen2.lst")
    if built != orig:
        diff = next((i for i in range(min(len(built), len(orig))) if built[i] != orig[i]), min(len(built), len(orig)))
        where = ""
        for addr, data, src in parse_listing(ROOT / "build" / "xmen2.lst"):
            if addr <= diff < addr + len(data):
                where = f" (listing: ${addr:06X}  {src})"
                break
        print(f"FAIL: MISMATCH at ${diff:06X}: built {built[diff:diff + 8].hex()} vs original "
              f"{orig[diff:diff + 8].hex()}; sizes {len(built)} vs {len(orig)}{where}")
        return 1
    if args.quiet:
        print(f"OK: byte-identical ({len(built)} bytes)")
    else:
        print(f"OK: byte-identical, SHA-1 {ROM_SHA1}")
        print(f"   code_addrs: {n} instruction starts -> build/xmen2.code_addrs.txt")
        print("   " + progress())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
