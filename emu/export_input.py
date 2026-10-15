"""Export a reference run's full input stream as a segagenesisrecomp runner `.input` script.

    uv run emu/export_input.py tas --out build/phase_traces/tas.input
    uv run emu/export_input.py fuzz-01800-s1          # writes build/inputs/<run>.input

The stream is exactly what the reference emulator was fed, frame by frame: the TAS prefix a
run started from (`start_frame` in its run.json: fuzz runs and `@tas N` scenarios), then the
p1/p2 columns of its frames.csv. Frame k of the script is frame k of the reference trace.

Format (the engine fork's runner/input_script.c): `PADS P1 P2` sets both pads' held buttons
(hex, runner bit layout: Up 1, Down 2, Left 4, Right 8, B 10, C 20, A 40, Start 80, X 100,
Y 200, Z 400, Mode 800; note gpgx swaps X and Z), `WAIT N` holds them for N frames, `EXIT 0`
ends the run after the last frame. Resets aren't representable yet; a run with one fails here.
"""
from __future__ import annotations

import argparse
import csv
import json
import subprocess
import sys
from pathlib import Path

EMU = Path(__file__).resolve().parent
ROOT = EMU.parent
sys.path.insert(0, str(EMU))
from xmen2emu import TAS, read_bk2  # noqa: E402

RUNNER_BITS = {"U": 0x001, "D": 0x002, "L": 0x004, "R": 0x008, "B": 0x010, "C": 0x020, "A": 0x040,
               "S": 0x080, "X": 0x100, "Y": 0x200, "Z": 0x400, "M": 0x800}


def runs_dir() -> Path:
    """This checkout's emu/runs, or the main checkout's (worktrees share the main runs)."""
    here = EMU / "runs"
    if (here / "tas" / "frames.csv").exists():
        return here
    r = subprocess.run(["git", "rev-parse", "--path-format=absolute", "--git-common-dir"],
                       cwd=ROOT, capture_output=True, text=True)
    return Path(r.stdout.strip()).parent / "emu" / "runs" if r.returncode == 0 else here


def mask(buttons: str) -> int:
    bad = set(buttons) - set(RUNNER_BITS)
    if bad:
        raise ValueError(f"unknown buttons {sorted(bad)}")
    return sum(RUNNER_BITS[c] for c in set(buttons))


def stream(run: str) -> list[tuple[int, int]]:
    """[(p1 mask, p2 mask)] for reference frames 1..N."""
    d = runs_dir() / run
    meta = json.loads((d / "run.json").read_text())
    start = int(meta.get("start_frame") or 0)
    src = meta.get("script")
    if src:
        text = (EMU / "corpus" / "scenarios" / src).read_text()
        if "@reset" in text or "@power" in text:
            raise SystemExit(f"{run}: resets are not representable in the runner .input format yet")
    out: list[tuple[int, int]] = []
    if start:
        tas = read_bk2(TAS)
        for sys_f, p1, p2 in tas[:start]:
            if sys_f.strip("."):
                raise SystemExit(f"{run}: TAS prefix has a console event {sys_f!r}")
            out.append((mask(p1), mask(p2)))
    with open(d / "frames.csv", newline="") as f:
        for row in csv.DictReader(f):
            if int(row["frame"]) != len(out) + 1:
                raise SystemExit(f"{run}: frames.csv frame {row['frame']} where {len(out) + 1} was expected")
            out.append((mask(row["p1"]), mask(row["p2"])))
    return out


def script(frames: list[tuple[int, int]], run: str) -> str:
    lines = [f"# {run}: {len(frames)} frames, exported by xmen2disasm emu/export_input.py",
             "# PADS p1 p2 (hex, runner bits) then WAIT n: those pads for the next n frames"]
    i = 0
    while i < len(frames):
        j = i
        while j < len(frames) and frames[j] == frames[i]:
            j += 1
        lines += [f"PADS {frames[i][0]:X} {frames[i][1]:X}", f"WAIT {j - i}"]
        i = j
    lines.append("EXIT 0")
    return "\n".join(lines) + "\n"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("run")
    ap.add_argument("--out")
    a = ap.parse_args()
    out = Path(a.out) if a.out else ROOT / "build" / "inputs" / f"{a.run}.input"
    frames = stream(a.run)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(script(frames, a.run), newline="\n")
    print(f"{out}: {len(frames)} frames")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
