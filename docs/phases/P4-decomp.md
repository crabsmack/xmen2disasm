# Phase 4: decompilation (definition of done)

approved: 2026-10-15

**Status: criteria approved by the user 2026-10-15** (revised the same day with what phases 2
and 3 learned). The user approved these decisions with them:
1. Whole-game equality is checked at sync points, in an untimed stepped runner that replays
   interrupts and hardware reads, not at hardware frame ends.
2. One C source per function: MPW C 3.3 compiles it for byte matching, and the PC compiles it
   as C++ over big-endian wrapper types.
3. Partially executed functions are verified by a byte match **or** by `verify` with 0
   uncovered instructions (synthetic cases allowed). Never-executed functions must match.
4. D8: the user plays the hand-C build before phase 4 counts as complete.

**Changes approved by the user 2026-10-15, after the D2 attempt** (evidence:
`XMen2Recomp/docs/NOTES.md` "Phase 4"). Replaying the timed run's interrupts at logical
positions (function entries, hardware reads) does not reproduce it, even with no hand C: the
V-int lands a few instructions after `VDP_WaitVBlank` returns, and whether the main program's
next RAM write comes before or after it changes the handler's path (843 bytes of RAM are shared
between the handlers and the main program, many reached through pointers). The TAS diverged at
sync points 1243 and 2042 with all code generated. So:
5. **D2 and D6 compare the stepped runner with hand C against the same stepped runner with all
   generated code**, at every sync point of every corpus run. The stepped runner is
   frame-synchronous and untimed: the V-int is taken at each sync point, the pads come from the
   run's input (the reference frame of each sync point, from the D1 `sync.csv`), hardware is
   emulated without timing. Both sides see interrupts at the same logical point, so any
   difference comes from the C. D1 is unchanged (timed runner == gpgx, `sync.csv`, replay log).
6. **The sync-point RAM CRC masks the whole 68000 stack area** `[stack_low, $FFC518)` (the reset
   SSP), not only `[stack_low, A7)`: live frames hold uninitialised locals with stale
   interrupt-frame bytes, and C functions keep no 68000 frames.
7. **Fragments** (the 460 functions the disassembly split off a C function: switch cases and
   blocks with no frame, only branched into; tagged `fragment` in `xmen2_funcs.h`) are done when
   their parent's C is done: the parent's file names the fragment in a comment where its code
   is, and the parent is verified.
8. **The 7 never-executed asm functions** (no MPW frame; MPW C can't produce them) may be
   verified by `verify` with synthetic cases (0 uncovered instructions) instead of a match.

Goal: every one of the 3,620 functions exists as **hand-written, readable C** in
`XMen2Recomp`, the game runs with **no generated code** for game functions, and the result is
provably the same game as the emulator. C here still uses the 68000 memory layout (emulated
work RAM, big-endian), because generated code shares it until the last function is replaced.
Native layout is phase 5.

Checked by `uv run tools/phase.py 4` (writes `docs/progress/P4.md` and the per-function
ledger `build/phase4_functions.json`). Requires phases 2 and 3 complete. Next functions to
work: `uv run tools/decomp_queue.py`. Per-function procedure: skill `/decomp-function`.

## What phases 2 and 3 changed in this plan

1. **Frame identity in phase 2 needs instruction timing.** The game polls the VBLANK bit and
   runs its logic straight through the frame end, so the RAM at a frame end is a mid-logic
   snapshot, and pads are read in the V-int. Phase 2 matches it because the recompiler emits
   `XI(pc, cost)` before every instruction (exact mode). Hand-written C has no instruction
   timing, so the draft's "hand-C traces equal the emulator at every frame end" can't hold:
   readable C would need a cycle charge per statement. `VDP_WaitVBlank` runs on only 50,744
   of the TAS's 57,465 frames (loading and lag stretches), so timing also decides which inputs
   the logic sees.
   **So whole-game equality for C is checked at logical frames ("sync points").** These are the
   entries to `VDP_WaitVBlank`, where the main program has finished its logic. The C runs in an
   untimed **stepped** runner. Interrupts and timing-dependent hardware reads are replayed from
   the timed reference. Phase 5 (native, no 68000 at all) needs the same comparison, so this
   phase builds it.
2. **The compiler is known (MPW C 3.3, `-mbg off -b`), and plain C with struct pointers
   matches the ROM** (24 match files). That allows **one source per function**. Each
   function's C compiles with MPW C 3.3, so it can be byte-matched against the ROM. On PC the
   same file compiles as C++, with header-only big-endian wrapper types (`be16`, `be32`, a
   68000-address pointer template, function pointers that dispatch by 68000 address), so
   `self->state = f` works on emulated RAM. Matching is how policy `matching-for-unexecuted`
   verifies code the corpus never runs. In phase 5 the same source moves to native layout by
   changing those types.
3. **Coverage, measured** (committed `emu/coverage/`, 76 runs): 1,936 functions are fully
   executed by the corpus, 979 partially, 705 never. 29,557 of 141,029 instructions (21%) are
   never executed.
4. **Calls are uniform.** MPW C passes every argument in a 4-byte slot (right to left, caller
   pops), returns in d0 and preserves d3-d7/a2-a4. The exceptions are the six hand-assembled
   MPW library modules (`Math_*` take register arguments; `Mem_Copy`/`Mem_Set` take stack
   arguments without a frame). One generated layer can therefore bridge C and generated code
   in both directions, and the C never needs to know which side a callee is on.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| D0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title |
| D1 | Sync reference | `xmen2check.py trace --mode recomp --sync` (the timed runner, all generated code) still equals the gpgx reference on every frame of the TAS and every corpus run (P2's K6/K8, 0 misses, 0 interpreter instructions), and every run also wrote `sync.csv` (≥1 row) and the replay log |
| D2 | Stepped runner equals it | `xmen2check.py trace --mode stepped --replay REFDIR` (the frame-synchronous untimed runner with hand C wherever it exists and generated code, emitted without exact timing, elsewhere) equals `trace --mode stepped-gen --replay REFDIR` (the same runner with all generated code) at every sync point of the TAS and every corpus run, with 0 misses and 0 interpreter instructions on both. REFDIR is the run's D1 output (sync-point frames for the input). Passes with zero hand C (it proves the harness is deterministic) and stays green as C lands (regression gate). (Changed 2026-10-15, decision 5.) |
| D3 | Types declared | `xmen2check.py types --json`: a struct for every class `tools/classes.py` finds (142), and every global in `build/recomp/ram_globals.csv` declared under its disassembly name |
| D4 | Every function done | per function (ledger `build/phase4_functions.json`): `game/c/<ADDR>.c` defines it under its disassembly name with a doc comment (`xmen2check.py handc`), the file is lint-clean (`lint`), and it is **verified**: it byte-matches the ROM (`tools/cc.py --match-recomp`), **or** it is executed by the corpus and `xmen2check.py verify` reports 0 mismatches over ≥1 checked call and 0 uncovered instructions. Never-executed functions (705) must match (policy `matching-for-unexecuted`), except the 7 never-executed asm functions, which may use `verify` with synthetic cases (decision 8). A **fragment** (`handc` reports `fragments`: address -> parent) is done when its parent is done and the parent's file names it (decision 7) |
| D5 | Readable | `xmen2check.py lint --json` over `game/c/` and `game/include/`: 0 `registers` (no `g_cpu`, no `XI`), 0 `raw_addresses` (work RAM, ROM or hardware outside the memory/hardware layer), 0 `raw_offsets` (fields by name), 0 `cross_function_goto`; and ≤5% of struct fields named `unk_*` (`types`) |
| D6 | Whole game, hand C only | `xmen2check.py build --handc --json` links 0 generated game functions; `trace --mode handc --replay REFDIR` equals `trace --mode stepped-gen --replay REFDIR` at every sync point of the TAS and every corpus run, with 0 misses and 0 interpreter instructions (changed 2026-10-15, decision 5) |
| D7 | Independently reviewed | `XMen2Recomp/docs/reviews/*.md` cover ≥5% of functions (random sample) with `reviewed:`, `agree:`, `open disputes:` lines; agreement ≥90% (correct and readable); `open disputes: 0`; reviewers never review their own functions |
| D8 | User verified | `XMen2Recomp/docs/USER_VERIFIED.md` has `handc-verified: YYYY-MM-DD` for the D6 build, written only on the user's word after they played it live |

### Definitions (changing any of them needs the user's approval, recorded here)

- **Sync point**: every entry to `VDP_WaitVBlank` (`$1FDC5C`) from the main program
  (outside interrupt handlers), counted from reset. `sync.csv` has columns
  `sync,frame,ram_crc32,vram_crc32,cram_crc32,vsram_crc32`. `sync` (the index) and the four
  CRCs are compared. `frame` is the reference's hardware frame and is reported only. CRCs are
  defined as in P2, except that **RAM in `[stack_low, $FFC518)` is zeroed** before the CRC: the
  whole 68000 stack area, from the lowest A7 the timed runner sees over the corpus to the reset
  SSP (changed 2026-10-15, decision 6; it was `[stack_low, A7)`). Its contents depend on where
  interrupts landed (also above A7: uninitialised locals) and C keeps no 68000 frames. The D1
  trace reports `stack_low` in its JSON. Nothing else is masked.
- **Frame-synchronous stepped runner** (D2, D6; decision 5): untimed, one sync interval per
  runner frame. At each sync point, after its row is written, the V-int is taken (when enabled
  and unmasked); the pads for the next interval are the run's input at the reference frame of
  the next sync point (D1 `sync.csv`). Hardware is emulated without timing: DMA completes at
  once, the VDP status shows VBLANK to a `VDP_WaitVBlank` poll right after it shows it clear,
  the Z80 runs a fixed slice whenever the 68000 polls it. Every rule is a function of the
  program's own hardware accesses, so the generated and the C sides see the same machine.
- **Replay log** (written by D1, read by `--replay`): the only inputs the stepped and handc
  runners may take from the reference are (a) the values the 68000 read from **hardware**
  (`$A00000-$A1FFFF` Z80 area and I/O including pads, `$C00000-$C0001F` VDP status and HV
  counter) and (b) **where interrupts were taken**. Never work-RAM contents and never CRCs. A
  runner that copies game state from the reference is not a pass.
  - The recommended way to say where: a logical position, `(game-function entries in the
    main context since reset, hardware reads since the last entry)`. Interrupts are replayed
    at the same position and hardware reads are consumed in order, so polling loops (VBLANK,
    Z80 bus, DMA busy) read the same sequence of values.
  - The C must therefore read hardware in the original order, which "keep the original
    behaviour" already requires.
- **Verified by `verify`** (shadow differential test). The game repo builds a verification
  runner, timed and with all generated code, that runs every corpus input.
  - At every call of a function F that has hand C, the runner snapshots the state, journals
    F's generated effects (RAM writes, d0, A7, callee-saved registers, hardware writes, with
    hardware reads recorded), rolls them back, runs the hand C with those reads replayed,
    compares, and continues with the generated result. Nested calls run plain inside both
    versions.
  - A call during which an interrupt was taken isn't comparable and isn't counted as
    checked.
  - The JSON reports per function `calls_checked`, `mismatches`, `first_mismatch`,
    `instructions` (in the generated function) and `uncovered`: instructions no passing case
    executed. Passing cases are the checked corpus calls, synthetic cases (captured states
    mutated to reach other paths, run the same way) and, for calls that never return (top-level
    loops such as `Game_Main`), execution inside a passing D6 trace.
  - A partially executed function (979 of them) is verified either by a byte match or by
    reaching 0 `uncovered` with synthetic cases.
- **Matched**: `uv run tools/cc.py --match-recomp $XMEN2_RECOMP --json` (this repo) compiles
  each `game/c/<ADDR>.c` with the verdict compiler and flags, with the game repo's headers in
  their MPW mode, and reports every file whose function equals the ROM's bytes, every
  relocation resolved to the same target, exactly as `--match` does. Results are cached by the
  hash of the file and the headers.
- **Generated game function**: a `func_XXXXXX` the recompiler emits for an address in
  `build/recomp/functions.csv`. The handc build may still link the engine runtime, the VDP/Z80
  emulation and the bridge layer, but no generated game code (`build --handc` checks the link
  map).

## Where things live

| What | Where |
|---|---|
| Hand-written C | `XMen2Recomp/game/c/<ADDR>.c`, one function per file named by start address (as `src/f/` here; stable across renames) |
| Headers | `XMen2Recomp/game/include/`: `xmen2_types.h` (class structs, records), `xmen2_globals.h` (A5 globals by disassembly name), `xmen2_funcs.h` (a prototype for every function), `xmen2_mem.h` (the MPW-mode / PC-mode switch: big-endian wrapper types, the address pointer, ROM data access, hardware access) |
| Bridge | generated from the prototypes (outside `game/c`): generated callers enter C through a wrapper that reads 4-byte argument slots and sets d0; C calls a not-yet-converted function through a stub that pushes the slots and dispatches. Converting a callee never changes its callers' C |
| Contract | `XMen2Recomp/tools/xmen2check.py` (extended; below) and this repo's `tools/cc.py --match-recomp` |
| Notes | `XMen2Recomp/docs/NOTES.md` "Phase 4" (findings, open questions, the divergence log) |
| Reviews | `XMen2Recomp/docs/reviews/` |

## The contract (extends P2's)

```
xmen2check.py trace --mode recomp --sync --run R --input F --out D --json
    # P2's timed trace, plus D/sync.csv and D/replay.bin; JSON adds "sync_points", "stack_low"
xmen2check.py trace --mode stepped|handc --replay REFDIR --run R --input F --out D --json
    # untimed runner (handc: built without generated game code); writes D/sync.csv;
    # JSON {"sync_points", "dispatch_misses", "interp_instructions", "stub_hits", "fps", "exe"}
xmen2check.py types  --json   # {"structs": [names], "globals": [names], "fields": N, "unk_fields": N}
xmen2check.py handc  --json   # {"functions": {"ADDR": {"name": "...", "doc": true, "file": "game/c/ADDR.c"}}}
xmen2check.py lint   --json   # {"violations": {rule: N}, "files": {every linted file, e.g. "game/c/ADDR.c": {rule: N}}}
                              # rules: registers, raw_addresses, raw_offsets, cross_function_goto
xmen2check.py verify --inputs DIR --json [--functions ADDR,...]
    # DIR has <run>.input for every corpus run (phase.py exports them);
    # {"functions": {"ADDR": {"calls_checked", "mismatches", "first_mismatch", "instructions", "uncovered"}}}
xmen2check.py build --handc --json   # {"ok", "exe", "generated_game_functions": N, "first": "ADDR"}
```

`phase.py` caches traces and `verify` per game-repo revision. The D1 timed traces are keyed
only by the last commit that touched something other than `game/c`, `game/include` and
`docs`, so adding C doesn't re-run the long timed corpus.

## How to work it

1. **D1, D2 first: the harness, before any C.** D1 is a game-spec addition (an
   `instruction_hook` site at `$1FDC5C` for sync rows, a hardware-read and interrupt log in the
   engine fork). D2 is the real work: generated code without `XI`, a stepped scheduler that
   runs the main program until a sync point and replays interrupts and hardware reads from the
   log, and the VDP/DMA/Z80 behaviour that this makes visible. Debug with `/first-divergence`
   at sync points (diff RAM at the first differing sync). **If D2 can't be made equal after a
   real attempt, stop and ask the user**: the answer may change the definitions above.
2. **D3**: headers from the disassembly (`docs/NOTES.md` layouts, `tools/classes.py`,
   `build/recomp/ram_globals.csv`), in both modes. Fields are named as they become understood.
   Unknown ones are `unk_XX` until D5. Prove the MPW mode early: the 24 P3 match files
   rewritten against the shared headers must still match.
3. **D4, the long loop.** Take batches of ~5 from `uv run tools/decomp_queue.py` (leaves
   first; callees already done) and follow `/decomp-function`.
   - Draft with `uv run tools/decomp.py decomp NAME`, then rewrite with names, structs and
     the original macros (`CLASS()`, `SET_STATE`, `GOTO_STATE`: COMPILER.md "How the original
     C was written").
   - Executed functions: `verify --functions` and D2 after the batch. Never-executed ones:
     `cc.py --match-recomp`. Writing to match is also often the fastest way to get a
     partially executed function exactly right.
   - Keep the original behaviour, bugs included (`AvalonA4_ClearCameraZone`,
     `Tank_SetTrackLimits`).
   - Order: runtime/library, VDP/DMA, sprites, objects by class, AI scripts, levels, menus.
4. **Computed control flow** has no 1:1 C function shape:
   - AI-script thunk tables entered at offset k: a C function taking k, or one function
     per step with a table.
   - `Sw_` switch tables: C `switch`, which also matches.
   - `Scaler_RowBlocks`, entered at one of 160 blocks: a loop or `switch` fall-through.
   - Interior labels other functions jump into (`game/xmen2.labels.toml`): the bridge maps
     each `(function, entry)` to the C that implements it.
   - Record each choice in NOTES.
5. **D5** (lint, field names) is enforced per file in D4. What's left at the end is the
   headers and the last `unk_` fields. **D6** links without generated code and re-runs D2's
   traces. Then **D7** reviews, then ask the user for **D8**.

Same rules as earlier phases: never edit generated C, fix the recompiler/engine/spec in the
forks (commit order core → engine → game repo), one runner at a time and kill only by PID,
and never weaken a check in `tools/phase.py` or a contract tool.
