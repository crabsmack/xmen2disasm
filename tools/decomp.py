"""Ghidra decompiler view of the disassembly (pseudo-C for naming evidence).

    uv run tools/decomp.py setup               # (re)create the Ghidra project (%LOCALAPPDATA%/xmen2disasm/ghidra/<checkout>) from the build
    uv run tools/decomp.py sync                # push current names (after renames) into it
    uv run tools/decomp.py decomp sub_0054C6 [Title_Init ...]

The disassembly stays the source of truth: Ghidra only gets our verified function
starts and labels (its auto-analysis is NOT run, so it can't invent code in data).
Memory map: ROM $000000-$1FFFFF, RAM $FF0000 (+ a byte-mapped mirror at
$FFFF0000, where A5-relative and sign-extended .w accesses land), VDP/IO/Z80
regions, and A5 = $200 assumed everywhere so `-$3B70(a5)` resolves to RAM.
Needs Ghidra (GHIDRA_INSTALL_DIR, else the newest C:\\tools\\ghidra_*_PUBLIC) and JDK 21.
"""
from __future__ import annotations

import argparse
import glob
import os
import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
# Ghidra rejects project paths with '.'-prefixed components (e.g. .claude/worktrees),
# so projects live outside the repo: one per checkout, keyed by the checkout's folder name.
_base = Path(os.environ.get("LOCALAPPDATA") or Path.home() / "AppData" / "Local") / "xmen2disasm" / "ghidra"
PROJ_DIR = _base / re.sub(r"[^\w-]", "_", ROOT.name)
PROJ_NAME = "xmen2"
ROM = ROOT / "xmen2.bin"
A5 = 0x200


def env() -> None:
    if not os.environ.get("GHIDRA_INSTALL_DIR"):
        hits = sorted(glob.glob(r"C:\tools\ghidra_*_PUBLIC"))
        if not hits:
            sys.exit("Ghidra not found: set GHIDRA_INSTALL_DIR")
        os.environ["GHIDRA_INSTALL_DIR"] = hits[-1]
    if not os.environ.get("JAVA_HOME"):
        hits = sorted(glob.glob(os.path.expanduser(r"~\scoop\apps\temurin21-jdk\current")))
        if hits:
            os.environ["JAVA_HOME"] = hits[-1]


def symbols() -> tuple[dict[int, str], set[int], dict[int, str]]:
    """(labels by address, function starts, RAM globals by 32-bit address)."""
    labels: dict[int, str] = {}
    for line in (ROOT / "build" / "symbols.txt").read_text().splitlines():
        name, _, a = line.partition("=$")
        labels.setdefault(int(a, 16), name)
    starts = {int(p.stem, 16) for p in (ROOT / "src" / "f").glob("*.asm")}
    ram: dict[int, str] = {}
    for m in re.finditer(r"^(\w+)\s*=\s*(-?)\$([0-9A-Fa-f]+)", (ROOT / "src" / "ram.asm").read_text(), re.M):
        off = int(m.group(3), 16) * (-1 if m.group(2) else 1)
        ram[(A5 + off) & 0xFFFFFFFF] = m.group(1)
    return labels, starts, ram


def apply_names(flat, program) -> int:
    from ghidra.program.model.symbol import SourceType
    labels, starts, ram = symbols()
    st, fm = program.getSymbolTable(), program.getFunctionManager()
    space = program.getAddressFactory().getDefaultAddressSpace()
    n = 0
    for a in sorted(starts):
        addr = space.getAddress(a)
        name = labels.get(a, f"sub_{a:06X}")
        f = fm.getFunctionAt(addr)
        if f is None:
            flat.disassemble(addr)
            f = flat.createFunction(addr, name)
        if f is not None and f.getName() != name:
            f.setName(name, SourceType.USER_DEFINED)
        n += 1
    # A5 jump table: each `jmp target` stub at $222+8i becomes a thunk, so `jsr d(a5)`
    # and `pea d(a5)` decompile to the real callee's name.
    for i in range(2631):
        addr = space.getAddress(0x222 + 8 * i)
        if fm.getFunctionAt(addr) is None:
            flat.disassemble(addr)
            flat.createFunction(addr, None)
    for a, name in list(labels.items()) + list(ram.items()):
        if a in starts:
            continue
        addr = space.getAddress(a)
        prim = st.getPrimarySymbol(addr)
        if prim is None or prim.getName() != name:
            st.createLabel(addr, name, SourceType.USER_DEFINED).setPrimary()
    return n


class Session:
    """Open (or create) the per-checkout Ghidra project and its single program."""

    def __init__(self, create: bool):
        import pyghidra
        pyghidra.start()
        from ghidra.base.project import GhidraProject
        from ghidra.program.flatapi import FlatProgramAPI
        from java.io import File
        if create:
            if PROJ_DIR.exists():
                shutil.rmtree(PROJ_DIR)
            PROJ_DIR.mkdir(parents=True)
            self.proj = GhidraProject.createProject(str(PROJ_DIR), PROJ_NAME, False)
            from ghidra.program.model.lang import LanguageID
            from ghidra.program.util import DefaultLanguageService
            lang = DefaultLanguageService.getLanguageService().getLanguage(LanguageID("68000:BE:32:default"))
            self.program = self.proj.importProgram(File(str(ROM)), lang, lang.getDefaultCompilerSpec())
            self.proj.saveAs(self.program, "/", "xmen2", True)
        else:
            self.proj = GhidraProject.openProject(str(PROJ_DIR), PROJ_NAME)
            self.program = self.proj.openProgram("/", "xmen2", False)
        self.flat = FlatProgramAPI(self.program)

    def edit(self, fn) -> None:
        tx = self.program.startTransaction("xmen2")
        ok = False
        try:
            fn()
            ok = True
        finally:
            self.program.endTransaction(tx, ok)
        self.proj.save(self.program)

    def close(self) -> None:
        self.proj.close()


def cmd_setup(_a) -> None:
    s = Session(create=True)
    from java.math import BigInteger
    program = s.program
    mem = program.getMemory()
    space = program.getAddressFactory().getDefaultAddressSpace()
    out = {}

    def body():
        rom = mem.getBlocks()[0]
        rom.setName("ROM")
        rom.setWrite(False)
        rom.setExecute(True)

        def ublock(name, start, size, volatile=False):
            b = mem.createUninitializedBlock(name, space.getAddress(start), size, False)
            b.setRead(True)
            b.setWrite(True)
            b.setVolatile(volatile)
            return b

        ublock("RAM", 0xFF0000, 0x10000).setExecute(True)
        mem.createByteMappedBlock("RAM_A5", space.getAddress(0xFFFF0000), space.getAddress(0xFF0000), 0x10000, False)
        ublock("Z80", 0xA00000, 0x10000, True)
        ublock("IO", 0xA10000, 0x20, True)
        ublock("Z80CTL", 0xA11000, 0x300, True)
        ublock("TMSS", 0xA14000, 0x4, True)
        ublock("VDP", 0xC00000, 0x20, True)
        program.getProgramContext().setValue(program.getRegister("A5"), space.getAddress(0),
                                             space.getAddress(0x1FFFFF), BigInteger.valueOf(A5))
        out["n"] = apply_names(s.flat, program)

    s.edit(body)
    s.close()
    print(f"ghidra: project {PROJ_DIR / PROJ_NAME} with {out['n']} functions")


def cmd_sync(_a) -> None:
    s = Session(create=False)
    out = {}
    s.edit(lambda: out.__setitem__("n", apply_names(s.flat, s.program)))
    s.close()
    print(f"ghidra: synced names for {out['n']} functions")


def cmd_decomp(a) -> None:
    s = Session(create=False)
    try:
        from ghidra.app.decompiler import DecompInterface
        from ghidra.util.task import TaskMonitor
        program = s.program
        ifc = DecompInterface()
        ifc.openProgram(program)
        fm = program.getFunctionManager()
        space = program.getAddressFactory().getDefaultAddressSpace()
        labels, _starts, _ram = symbols()
        by_name = {v: k for k, v in labels.items()}
        for target in a.functions:
            addr = by_name.get(target)
            if addr is None:
                addr = int(target, 0) if re.fullmatch(r"(0x)?[0-9A-Fa-f]+", target) else None
            f = fm.getFunctionContaining(space.getAddress(addr)) if addr is not None else None
            if f is None:
                print(f"// {target}: no function")
                continue
            res = ifc.decompileFunction(f, 60, TaskMonitor.DUMMY)
            df = res.getDecompiledFunction()
            print(df.getC() if df else f"// {target}: decompile failed: {res.getErrorMessage()}")
    finally:
        s.close()


def main() -> int:
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("setup").set_defaults(fn=cmd_setup)
    sub.add_parser("sync").set_defaults(fn=cmd_sync)
    p = sub.add_parser("decomp")
    p.add_argument("functions", nargs="+")
    p.set_defaults(fn=cmd_decomp)
    a = ap.parse_args()
    if not (ROOT / "build" / "symbols.txt").exists():
        sys.exit("run `uv run tools/build.py` first")
    env()
    if a.cmd != "setup" and not (PROJ_DIR / f"{PROJ_NAME}.gpr").exists():
        cmd_setup(a)
    a.fn(a)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
