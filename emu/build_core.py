"""Build the instrumented emulator cores into emu/bin/.

    uv run emu/build_core.py            # both cores
    uv run emu/build_core.py biz        # only BizHawk 2.4's gpgx (TAS-sync core, the default)

biz:  BizHawk 2.4's Genesis Plus GX fork, sparse-fetched from TASEmulators/BizHawk
      tag 2.4 into emu/_src/. The TAS in emu/corpus was recorded on it, so it syncs.
gpgx: current upstream Genesis Plus GX (emu/gpgx submodule) as a libretro core;
      has savestates, but does not sync the 2021 TAS.
Windows: MSVC via the `cmake` dev dependency in the uv env.
"""
from __future__ import annotations

import glob
import shutil
import subprocess
import sys
from pathlib import Path

EMU = Path(__file__).resolve().parent
BIN = EMU / "bin"
BIZ_SRC = EMU / "_src" / "bizhawk-2.4"


def find_cmake() -> str:
    venv = Path(sys.executable).parent / ("cmake.exe" if sys.platform == "win32" else "cmake")
    if venv.exists():  # `cmake` dev dependency in the uv env
        return str(venv)
    exe = shutil.which("cmake")
    if exe:
        return exe
    hits = glob.glob(r"C:\Program Files\Microsoft Visual Studio\*\*\Common7\IDE\CommonExtensions"
                     r"\Microsoft\CMake\CMake\bin\cmake.exe")
    if not hits:
        sys.exit("cmake not found (uv sync --dev, or put cmake on PATH)")
    return hits[0]


def fetch_biz() -> None:
    if (BIZ_SRC / "waterbox" / "gpgx" / "core").exists():
        return
    BIZ_SRC.mkdir(parents=True, exist_ok=True)
    g = ["git", "-C", str(BIZ_SRC)]
    subprocess.run(["git", "init", "-q", str(BIZ_SRC)], check=True)
    subprocess.run(g + ["remote", "add", "origin", "https://github.com/TASEmulators/BizHawk.git"], check=False)
    subprocess.run(g + ["config", "core.sparseCheckout", "true"], check=True)
    (BIZ_SRC / ".git" / "info" / "sparse-checkout").write_text("waterbox/gpgx/\n")
    subprocess.run(g + ["fetch", "-q", "--depth", "1", "origin", "2.4"], check=True)
    subprocess.run(g + ["checkout", "-q", "FETCH_HEAD"], check=True)


def patch_biz() -> None:
    """Recording-only hooks for xm_biz.c; the emulation is unchanged (the TAS stays
    frame-identical):
    - vdp_ctrl.c: xm_dma_note(code, addr) (the VDP's private code/address registers) right
      before BizHawk logs a DMA source word;
    - z80/z80.c: xm_z80_exec() before each Z80 instruction (after interrupt acceptance), for
      the phase-2 Z80 instruction trace."""
    p = BIZ_SRC / "waterbox" / "gpgx" / "core" / "vdp_ctrl.c"
    t = p.read_text(encoding="latin-1")
    if "xm_dma_note" not in t:
        hook = "CDLog68k(source,eCDLog_Flags_DMASource);"
        if hook not in t:
            sys.exit("patch_biz: DMA logging call not found in vdp_ctrl.c")
        t = t.replace(hook, "xm_dma_note(code, addr); " + hook)
        t = t.replace("static uint8 code;", "extern void xm_dma_note(unsigned int code, unsigned int addr);\nstatic uint8 code;", 1)
        p.write_text(t, encoding="latin-1", newline="\n")
    p = BIZ_SRC / "waterbox" / "gpgx" / "core" / "z80" / "z80.c"
    t = p.read_text(encoding="latin-1")
    if "xm_z80_exec" not in t:
        hook = "    Z80.after_ei = FALSE;\n    R++;\n    EXEC_INLINE(op,ROP());"
        if hook not in t:
            sys.exit("patch_biz: Z80 run loop not found in z80/z80.c")
        t = t.replace(hook, "    Z80.after_ei = FALSE;\n    xm_z80_exec();\n    R++;\n    EXEC_INLINE(op,ROP());")
        t = t.replace("void z80_run(unsigned int cycles)\n", "extern void xm_z80_exec(void);\nvoid z80_run(unsigned int cycles)\n", 1)
        p.write_text(t, encoding="latin-1", newline="\n")


def build(src: Path, target: str) -> None:
    cmake = find_cmake()
    out = src / "_build"
    subprocess.run([cmake, "-S", str(src), "-B", str(out)], check=True)
    subprocess.run([cmake, "--build", str(out), "--config", "Release", "--parallel"], check=True)
    BIN.mkdir(exist_ok=True)
    name = f"{target}.dll" if sys.platform == "win32" else f"lib{target}.so"
    built = [p for p in out.glob(f"**/{name}") if p.is_file()]
    if not built:
        sys.exit(f"build produced no {name}")
    shutil.copy2(built[0], BIN / name)
    print(f"core -> {BIN / name}")


def main() -> int:
    which = sys.argv[1:] or ["biz", "gpgx"]
    if "biz" in which:
        fetch_biz()
        patch_biz()
        build(EMU / "bizcore", "xmen2_bizgpgx")
    if "gpgx" in which:
        if not (EMU / "gpgx" / "core").exists():
            subprocess.run(["git", "submodule", "update", "--init", "emu/gpgx"], cwd=EMU.parent, check=True)
        build(EMU / "core", "xmen2_gpgx")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
