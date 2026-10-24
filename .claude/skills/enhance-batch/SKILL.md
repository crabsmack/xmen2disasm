---
name: enhance-batch
description: Build one batch of X-Men 2's phase-6 enhancements (two-player full frame rate, high frame rate, 16:9 widescreen) as options of the native port - pick the first failing criterion of `phase.py 6`, build its contract piece and then the feature in native-only branches so every source still byte-matches under MPW, prove it with the worker gate and option traces, record. Use for phase 6 criteria E1-E6 and any "add/fix an enhancement option" task in XMen2Recomp.
---

# Build an enhancement batch (the phase-6 loop)

Criteria, rulings and the measurement contract: `docs/phases/P6-enhance.md` (approved 2026-10-21,
R1-R7; read "The contract" before writing anything). Notes: `XMen2Recomp/docs/NOTES.md` "Phase 6".
The work lives in the game repo (`$XMEN2_RECOMP`, XMen2Recomp), in your own worktree and build dir (`XMEN2_BUILD`).
Phase 6 starts once phase 5 is complete (the user, 2026-10-21); an explicit instruction from the
user to work phase 6 overrides that.

## Rules that make it provable

- **Off is the original.** Every option defaults to off (R1). With all options off the runner must
  stay byte-for-byte the phase-5 port: E1 reruns phase 5's measurement, and E2 checks that "every
  option given off" equals "no options". Never let option code run when its option is off.
- **Byte matches stay (R2).** Game-side changes go in `#if defined(XMEN2_NATIVE)` branches (or in
  `platform/native/`), never in the MPW path. The worker gate's MPW step catches a branch that
  moves a byte; a file that matched must still match.
- **The contract before the feature.** The doc's contract (`--options`, `options --json`, the
  `enhance` counters, `--present-log`, `--flip`, `game/widescreen_screens.toml`) is what
  `phase.py 6` measures. Build each piece exactly as specified before the feature it measures, so
  the criterion goes from "missing" to a real failure you then fix. If the contract is wrong or
  impossible, queue it in `docs/QUESTIONS.md` with the default you take; never loosen
  `phase.py` (changing a criterion needs the user's approval, recorded in the doc).
- **Counters come from the game's own state** (`g_PlayersAlive`, `g_TwoPlayerStep`, the sprite
  table in work RAM, the block maps), read by the platform side. Never make a counter report what
  the check wants to hear.
- No checks weakened, no generated C edited, runners killed only by PID.

## 1. Pick

```
uv run tools/phase.py 6        # in xmen2disasm (E1 is phase 5's whole run; build/phase6.log)
```
Take the first failing criterion. Order of work (P6-enhance.md "How to work it"): E2 options
plumbing, E3 two-player full rate, E5 widescreen (terrain check first), E4 high frame rate, E6
package and the playtest question. A batch is one contract piece, or one feature step (about 5
files or sites).

## 2. Change

- **E2**: options in `platform/native/` (command line, `xmen2.ini` beside the runner, the runner's
  `--options --json`), `xmen2check.py options` and `trace --options`, the `enhance` counters.
- **E3**: `Level_FrameLoop` (`1FA124.c`) and the five scene setters of `g_TwoPlayerStep`
  (`0383DC`, `0C0E54`, `0C1258`, `0E78F2`, `1F98A8`): read each one first and record what it is
  for. One-player runs must not change (E3 compares them).
- **E5**: the terrain check and `ws` counters first; then classify every `0x140`/320 in `game/c`
  (screen width or not) in NOTES, a native width variable at the width sites, the camera limits,
  `Map_StreamColumns`/`Map_StreamRows` (R7: widen first, the map renderer only where narrow
  planes need it), the HUD anchors, the activation margin (R6), and each screen's mode with its
  reason in `game/widescreen_screens.toml` (R5).
- **E4**: `--present-log` and the present clock first; each logic frame run as soon as its input
  is read (R4: no added latency); sprites tagged by object and piece in the draw paths; then
  interpolation of the camera, scroll and sprites, with the snap rules.

## 3. Prove (in the XMen2Recomp worktree)

```
export XMEN2_REFS=<xmen2disasm's build/phase_traces>   # the D1 references
uv run tools/gate.py                                   # build, pccheck, MPW match, verify, native TAS (options off)
uv run tools/xmen2check.py trace --mode native --replay $XMEN2_REFS/<run>-recomp-sync \
    --run <run> --input $XMEN2_REFS/<run>.input --out D --options K=V [--fb] [--present-log] --json
```
The gate is fail-fast; fix its first failure before anything else. Then the option traces of the
criterion you are on (two-player runs for E3: `scenario-two-player` and the TAS from the frame
player 2 joins; any gameplay run for E5). A one-player run that changes under `full_rate_2p=1`, or
any run that changes with every option off, is a bug in the option, never in the check.

## 4. Record

Append findings to `XMen2Recomp/docs/NOTES.md` "Phase 6" (each 320 site's classification, each
screen's mode, what the scene setters do, the snap rules and their thresholds). Design calls that
are the user's go to `docs/QUESTIONS.md` with a default. Rebase on `origin/main`, rebuild, gate,
commit (message via `git commit -F`), push both repos. Every few batches: `uv run tools/phase.py
6`. When the package plays with all three options, queue the playtest (E6:
`enhancements-verified: DATE`, the user's word only) and keep working.
