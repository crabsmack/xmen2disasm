"""The standard runtime-coverage corpus (definition of done, criterion R2).

    uv run emu/corpus.py            # run whatever is missing (resumable)
    uv run emu/corpus.py --list     # show the corpus and which runs exist
    uv run emu/corpus.py --force    # re-run everything

Corpus:
  tas              the 2021 TASVideos movie [4473M]: the whole game, start to final boss
  idle             10 minutes of no input from power-on (intro/attract/demo paths)
  fuzz-FFFFF-sN    from every 1,800th TAS frame, 2 seeds x 3,600 frames of biased random
                   play (dying, game over, continue screens, enemy variety, other routes)
  scenario-*       hand-written input scripts in emu/corpus/scenarios/*.txt (one line per
                   frame: `p1 p2` button letters, `.` for none, `#` comments, `xN` repeat
                   suffix like `R x120`); add scenarios for paths the corpus misses.

Every run lands in emu/coverage/<name>.{exec,data,dma}.bin.gz + <name>.json; tools/coverage.py
unions them. The emulator is deterministic, so a run's coverage never changes.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

EMU = Path(__file__).resolve().parent
TAS_FRAMES = 57465
FUZZ_EVERY, FUZZ_LEN, FUZZ_SEEDS = 1800, 3600, (1, 2)


def corpus() -> list[tuple[str, list[str]]]:
    runs = [("tas", ["movie", "--name", "tas", "--png-every", "600", "--ram-every", "60"]),
            ("idle", ["idle", "--name", "idle", "--frames", "36000"])]
    for f in range(FUZZ_EVERY, TAS_FRAMES, FUZZ_EVERY):
        for s in FUZZ_SEEDS:
            name = f"fuzz-{f:05d}-s{s}"
            runs.append((name, ["fuzz", "--name", name, "--from-frame", str(f), "--frames", str(FUZZ_LEN),
                                "--seed", str(s), "--png-every", "0"]))
    for sc in sorted((EMU / "corpus" / "scenarios").glob("*.txt")):
        name = f"scenario-{sc.stem}"
        runs.append((name, ["script", str(sc), "--name", name]))
    return runs


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--list", action="store_true")
    ap.add_argument("--force", action="store_true")
    args = ap.parse_args()
    todo = corpus()
    have = {p.stem for p in (EMU / "coverage").glob("*.json")}
    if args.list:
        for name, _cmd in todo:
            print(f"{'done' if name in have else 'todo'}  {name}")
        print(f"{sum(n in have for n, _ in todo)}/{len(todo)} runs present")
        return 0
    for i, (name, cmd) in enumerate(todo, 1):
        if name in have and not args.force:
            continue
        print(f"[{i}/{len(todo)}] {name}", flush=True)
        r = subprocess.run([sys.executable, str(EMU / "xmen2emu.py"), *cmd], capture_output=True, text=True)
        if r.returncode != 0:
            print(r.stdout[-500:] + r.stderr[-1500:])
            return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
