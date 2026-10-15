"""Quick look at ROM bytes: capstone disassembly + where the address lives in the source.

    uv run tools/peek.py 0x017218 [--count 16] [--before 8] [--hex 32]
"""
from __future__ import annotations

import argparse
import re

import build
import m68k

ROOT = m68k.ROOT


def locate(addr: int) -> str:
    files = sorted((ROOT / "src" / "f").glob("*.asm"))
    best = None
    for f in files:
        if int(f.stem, 16) <= addr:
            best = f
    if best is not None:
        return str(best.relative_to(ROOT))
    return "xmen2.asm / src/header.asm / src/jumptable.asm"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("addr", type=lambda s: int(s, 0))
    ap.add_argument("--count", type=int, default=16)
    ap.add_argument("--before", type=int, default=0, help="start this many bytes earlier")
    ap.add_argument("--hex", type=int, default=0, help="also hexdump this many bytes")
    args = ap.parse_args()
    rom = m68k.load_rom()
    code = set()
    p = ROOT / "build" / "xmen2.code_addrs.txt"
    if p.exists():
        code = {int(a, 16) for a in p.read_text().split()}
    syms = {}
    sp = ROOT / "build" / "symbols.txt"
    if sp.exists():
        for line in sp.read_text().splitlines():
            n, _, a = line.partition("=$")
            syms.setdefault(int(a, 16), n)
    a = args.addr - args.before
    print(f"; ${args.addr:06X} is in {locate(args.addr)}")
    for _ in range(args.count):
        ins = m68k.decode(rom, a)
        mark = "*" if a in code else " "
        if a in syms:
            print(f"{syms[a]}:")
        if ins is None:
            print(f" {mark}{a:06X}  {rom[a:a + 2].hex():<20} (undecodable)")
            a += 2
            continue
        print(f" {mark}{a:06X}  {rom[a:a + ins.size].hex():<20} {ins.mnemonic} {ins.op_str}")
        a += ins.size
    if args.hex:
        s = args.addr
        for off in range(0, args.hex, 16):
            chunk = rom[s + off:s + off + 16]
            txt = re.sub(r"[^ -~]", ".", chunk.decode("latin-1"))
            print(f"  {s + off:06X}  {chunk.hex(' ')}  {txt}")
    print("(* = disassembled code)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
