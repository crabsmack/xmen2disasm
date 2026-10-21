"""Bootstrap a checkout or worktree so every tool works. Safe to re-run.

    uv run tools/setup.py            # everything
    uv run tools/setup.py --no-ghidra

1. ROM: copied from $XMEN2_ROM or the main checkout (never committed)
2. Emulator cores (emu/bin): copied from the main checkout, else built (MSVC + cmake)
3. Byte-identical build (also writes the symbol/code-address files the others need)
4. Emulator runs: reused from the main checkout's emu/runs, else the TAS is replayed
5. Ghidra project for tools/decomp.py (per-checkout, outside the repo)
"""
from __future__ import annotations

import argparse
import shutil
import subprocess
import sys

import build

ROOT = build.ROOT


def step(msg: str) -> None:
    print(f"== {msg}", flush=True)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--no-ghidra", action="store_true")
    args = ap.parse_args()
    main_co = build.main_checkout()

    step("ROM")
    if not build.ensure_rom():
        print("no ROM: put your dump at xmen2.bin (or set XMEN2_ROM)")
        return 1

    step("emulator cores")
    bin_dir = ROOT / "emu" / "bin"
    if not (bin_dir / "xmen2_bizgpgx.dll").exists() and not (bin_dir / "libxmen2_bizgpgx.so").exists():
        src = main_co / "emu" / "bin" if main_co else None
        if src and src.exists() and src != bin_dir:
            shutil.copytree(src, bin_dir, dirs_exist_ok=True)
        else:
            subprocess.run([sys.executable, str(ROOT / "emu" / "build_core.py"), "biz"], cwd=ROOT, check=True)

    step("build")
    if subprocess.run([sys.executable, str(ROOT / "tools" / "build.py"), "--quiet"], cwd=ROOT).returncode:
        return 1

    # the handoff tables (build/recomp) the game repo and cc.py resolve names with: refreshed when
    # any source of the disassembly is newer (a stale one made cc.py report 129 matching files as
    # NO MATCH, 2026-10-21)
    step("handoff")
    marker = ROOT / "build" / "recomp" / "ram_globals.csv"
    sources = [ROOT / "xmen2.asm", *(ROOT / "src").rglob("*.asm"), ROOT / "config" / "seeds.txt"]
    newest = max((p.stat().st_mtime for p in sources if p.exists()), default=0)
    if not marker.exists() or marker.stat().st_mtime < newest:
        if subprocess.run([sys.executable, str(ROOT / "tools" / "handoff.py")], cwd=ROOT).returncode:
            return 1
    print(f"handoff: {marker.parent}")

    step("emulator runs")
    if not (build.runs_dir() / "tas" / "func_frames.json").exists():
        subprocess.run([sys.executable, str(ROOT / "emu" / "xmen2emu.py"), "movie", "--name", "tas",
                        "--png-every", "600", "--ram-every", "60"], cwd=ROOT, check=True)
    print(f"runs: {build.runs_dir()}")

    if not args.no_ghidra:
        step("ghidra")
        subprocess.run([sys.executable, str(ROOT / "tools" / "decomp.py"), "setup"], cwd=ROOT, check=True)
    print("setup complete")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
