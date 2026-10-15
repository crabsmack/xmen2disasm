# Definition of done: disassembly + naming phase

This phase is done when **every criterion below passes** in `uv run tools/progress.py`
(which also writes `docs/PROGRESS.md`). Then phase 2, static recompilation on
segagenesisrecomp, starts from `build/recomp/`. Criteria are measured, not judged,
except N4, which is an independent review with a recorded result.

Why these: the recompiler needs (a) every byte of code found and nothing else
called code, (b) every code pointer in data known, and (c) enough understanding
to debug it. Frame-by-frame comparison against the emulator is phase 2's main loop.
The reference traces for it are produced here (H2).

## Always

| ID | Criterion | Check |
|---|---|---|
| S1 | Tree rebuilds byte-identical | `tools/build.py` exit 0 |

## Code completeness (runtime ground truth)

The emulator harness (`emu/`) runs BizHawk 2.4's Genesis Plus GX, the core the TAS
was recorded on, with an execution and data-read logger.

| ID | Criterion | Check |
|---|---|---|
| R1 | Standard corpus fully run | all runs of `emu/corpus.py --list` present (TAS, idle, 62 fuzz sessions, scenarios) |
| R2 | No executed code is missing from the disassembly | `coverage.py`: missed_code = 0 |
| R3 | No disassembled instruction is contradicted at runtime | `coverage.py`: mid_insn = 0 |
| R4 | Required scenarios exist in `emu/corpus/scenarios/` | files named for each id in `REQUIRED_SCENARIOS` (progress.py): pause-screen cheat codes, game over, 2-player, and each playable character (the game has no options menu, continue or password) |
| R5 | Every code byte read as data is explained or fixed | each `code_as_data` start address appears in `docs/NOTES.md` |

## Static completeness

| ID | Criterion | Check |
|---|---|---|
| S2 | Every jump-table entry resolved | 0 numeric `jtentry $XXXXXX` lines (target is a code label or a named data label) |
| S3 | No numeric ROM addresses in code operands | 0 `$XXXX(pc)` / `($XXXXXX).l` operands below `$200000` in `src/f/` |
| S4 | All data the game reads is identified | every ROM byte read as data or DMA'd at runtime lies in a *labelled* span (`label_data.py`, prefix + format comment) |
| S5 | Unknown bytes are rare and listed | unlabelled raw bytes ≤ 2% of the ROM, and each remaining span listed under "Unknown" in `docs/NOTES.md` |

## Understanding

| ID | Criterion | Check |
|---|---|---|
| N1 | Every function named | 0 functions whose label is `sub_/loc_XXXXXX`; `unk_` names (tried, still unclear) ≤ 5% |
| N2 | Every function documented | each `src/f` header has a `; Name - purpose` line (the generated header doesn't) |
| N3 | Shared globals named | 0 numeric `-$XXXX(a5)` globals used by 2+ functions |
| N4 | Names independently reviewed | `docs/reviews/*.md` cover ≥ 10% of functions (random sample), agreement ≥ 90%, `open disputes: 0` |

## Recomp handoff

| ID | Criterion | Check |
|---|---|---|
| H1 | Handoff artifacts generated | `tools/handoff.py` writes `build/recomp/` (code_addrs, functions, jump table, RAM globals, seeds) without errors |
| H2 | Reference traces exist | `emu/runs/tas/frames.csv` (per-frame RAM + framebuffer CRC) and `ram/` snapshots, documented in `docs/RECOMP_HANDOFF.md` |

## What "done" does not require

- Understanding every data format byte-for-byte (graphics/level formats can stay
  labelled blobs with a one-line description).
- A C decompilation (phase 4 of [ROADMAP.md](ROADMAP.md)).
- Matching output for a modified game (shiftable builds).
