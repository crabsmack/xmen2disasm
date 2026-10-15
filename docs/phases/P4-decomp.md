# Phase 4: decompilation (definition of done, DRAFT)

**Status: draft.** D0 makes the agent revise these criteria with what phases 2 and 3
learned (engine hook mechanism, compiler verdict, how fast differential tests run) and get
the user's approval before any other criterion counts.

Goal: every one of the 3,620 functions exists as **hand-written, readable C** in
`XMen2Recomp`, the game runs with **no generated code** for game functions, and the result is
still frame-identical to the emulator. C here still uses the 68000 memory layout (the
emulated work RAM, big-endian accessors), because generated code shares it until the
last function is replaced. Native layout is phase 5.

Checked by `uv run tools/phase.py 4` (writes `docs/progress/P4.md`). Requires phases 2
and 3 complete.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| D0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and no longer says DRAFT |
| D1 | Types | `XMen2Recomp/game/include/xmen2_types.h` has a struct for every class descriptor `tools/classes.py` finds (non-actor classes in NOTES too, by review), plus named globals for `build/recomp/ram_globals.csv`; ≤5% of struct fields named `unk_*` (`xmen2check.py types --json`) |
| D2 | Every function in C | `xmen2check.py handc --json`: each function in `build/recomp/functions.csv` has a hand-written C definition, with the disassembly name and a doc comment |
| D3 | Every function verified | `xmen2check.py difftest --all --json`: each replaced function passes differential tests against its generated version (captured corpus states + generated inputs, ≥1,000 cases each, all branches the generated version takes reached); under `decomp_policy = matching-*` the functions P3 policy names also match byte for byte (`tools/cc.py --match`) |
| D4 | Whole game, hand C only | P2's K6 + K8 traces with `--mode handc` (game functions' generated C not linked): all compared columns equal every frame, 0 misses, 0 interpreter instructions |
| D5 | Readable | `xmen2check.py lint --json`: in `game/`, 0 uses of 68000 register variables, 0 raw work-RAM or ROM addresses outside the memory-access layer, 0 raw struct offsets (fields by name), 0 `goto` into the middle of another function's code |
| D6 | Independently reviewed | `XMen2Recomp/docs/reviews/*.md` cover ≥5% of functions (random sample), agreement ≥90% (correct + readable), `open disputes: 0`; reviewers never review their own functions |

## How to work it (to be confirmed in D0)

- Replacement mechanism: the engine's `instruction_hook` at a function's entry PC replaces
  it (the hook owns the register/stack contract); for thousands of functions, a
  per-function replacement table in the engine fork is likely better. Decide in D0.
- Order: types first (D1), then leaves up, subsystem by subsystem (runtime/library,
  VDP/DMA, sprites, objects/actors by class, AI scripts, levels, menus). A C function whose
  callers are still generated reads its args from the emulated stack and returns in d0:
  keep that glue in one thin generated-or-macro layer, not in the readable C.
- Drafts: `uv run tools/decomp.py decomp NAME` (Ghidra) in this repo; headers and NOTES give
  the meaning. Keep original behaviour including bugs (RECOMP_HANDOFF.md lists two).
- Skill: `/first-divergence` when a whole-game trace diverges.
