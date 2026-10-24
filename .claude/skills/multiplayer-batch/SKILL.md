---
name: multiplayer-batch
description: Build one batch of X-Men 2's phase-7 multiplayer (savestates, rollback netplay, four players, the second sound machine) on the native port - pick the first failing criterion of `phase.py 7`, build its contract piece and then the feature, in platform/native and native-only branches so every source still byte-matches under MPW, prove it with the worker gate, probe traces and loopback sessions, record. Use for phase 7 criteria M1-M6 and any "savestate / netplay / four-player" task in XMen2Recomp.
---

# Build a multiplayer batch (the phase-7 loop)

Criteria, rulings (R1-R10) and the measurement contract: `docs/phases/P7-multiplayer.md`
(approved 2026-10-21; read "What the earlier phases leave" and "The contract" before writing
anything). Notes: `XMen2Recomp/docs/NOTES.md` "Phase 7". The work lives in the game repo (`$XMEN2_RECOMP`)
(and the engine fork's `external/recomp-net`, `external/rbengine` for library changes), in your own
worktree and build dir (`XMEN2_BUILD`).

## Rules that make it provable

- **Off is the original.** `players` defaults to 2 and netplay is off unless asked. With both, the
  runner is phase 6's: M1 reruns phase 6's measurement, M4 checks `players=2` equals no options.
  Nothing new runs with one or two players offline (R5, R6, R9: only with three or more).
- **Byte matches stay (R4).** Game-side changes go in `#if defined(XMEN2_NATIVE)` branches or
  `platform/native/`, never the MPW path; the worker gate's MPW step catches a moved byte. After the
  first 20 four-player files, record the cost (lines, macros, readability) in NOTES (R4).
- **Determinism is the product.** Netplay and the probe only work if a run is a function of its
  inputs. Anything that reads the host (wall clock, V counter in played runs, SDL state, uninitialised
  memory, addresses) must come from the session (seed, sealed options) or stay out of the game.
  Peers compare the **canonical digest** (68000-view RAM, VRAM, CRAM, VSRAM, Z80 RAM, a fixed field
  list), never raw structs: MSVC and GCC lay them out differently.
- **The contract before the feature.** `--session`, `--digest`, `--state-probe`/`--state-skip`,
  `--scene`, `netplay`, the `mp` counters, `--netplay --json`, the package's `netplay`: build each
  exactly as specified before the feature it measures, so the criterion goes from "missing" to a real
  failure. Contract wrong or impossible: queue it in `docs/QUESTIONS.md` with the default you take;
  never loosen `phase.py`.
- **Counters come from the game's state** (players' objects, the sprite table and owner tags, the
  second machine's track slots and key-on writes), read by the platform side. Never make a counter
  report what the check wants.
- **Stage inputs** (`game/mp_inputs/boot.input`, `scene<N>.input` for each `tools/ws_warp.py --all`
  scene) are free-form four-pad scripts; M4 judges them by what they reach (each player in play
  ≥ 50% of gameplay frames). Write them to play the stage (join, pick, walk, fight), screenshots
  (`XMEN2_SHOTS`) to confirm.
- No checks weakened, no generated C edited, runners killed only by PID, no `python -`.

## 1. Pick

```
uv run tools/phase.py 7        # in xmen2disasm; log build/phase7.log. M2-M5 run first, then M1 (long), then M6
```
Run it against a snapshot worktree of XMen2Recomp (`XMEN2_RECOMP`, LESSONS.md "Phase 6") while you
develop. Take the first failing criterion (M2, M3, M4, M5, M6: R3's order). A batch is one contract
piece, or one feature step (about 5 files or sites).

## 2. Change

- **M2**: the game on a fiber with the host owning the loop (pacing, input, present out of
  `plat_sync_point`; no trace may change: gate it), the section table (arena + tags, fiber stack and
  context, `g_machine` with host pointers scrubbed, machine/VDP/runtime statics, the sound chips, the
  options and widescreen statics; later the four-player region and the second machine), the probe,
  the canonical digest, the session machine. Measure the fiber stack depth and a replay tick's cost.
- **M3**: the `RNetRbHost` table on `recomp_net` + `retcomm_rbengine` (link them directly; the
  engine's `genesisrecomp_enable_netplay` needs its launcher), resim begin/end (mute; render only if
  the VDP's sprite flags need it), pad rows per seat, the R10 seal (host options + seed; F10 refused
  online), `xmen2check.py netplay` (a Python driver; the engine's harness is bash), the WSL seat.
- **M4**: `players` (2/3/4) and the `mp` counters and stage inputs first; then the R5 region for
  players 3-4, joins with Start, the select's four cursors (unique characters, R7), lives, start
  positions, the camera on the group, the HUD panels built from the ROM's tiles (R6a), VRAM slots and
  the raised sprite stop (R6), the second sound machine (R9: same base song, `$B`/`$C` = players 3/4,
  `$A` = 2, its base tracks muted in its track slots, mixed by the host).
- **M5**: four seats on the LAN hub, then ICE on loopback.
- **M6**: `--netplay --json`, the package's `netplay`, then the playtest question.

## 3. Prove (in the XMen2Recomp worktree)

```
export XMEN2_REFS=<xmen2disasm's build/phase_traces>   # the D1 references and exported inputs
uv run tools/gate.py                                   # build, pccheck, MPW match, verify, native TAS
uv run tools/xmen2check.py trace --mode native --replay $XMEN2_REFS/<run>-recomp-sync --run <run> \
    --input $XMEN2_REFS/<run>.input --out D --fb --state-probe 300:60 --json          # M2
uv run tools/xmen2check.py trace --mode native --run s1 --input game/mp_inputs/scene1.input \
    --scene 1 --session 1 --options players=4 --digest --out D --json                  # M4 / offline refs
uv run tools/xmen2check.py netplay --seats 2 --input $XMEN2_REFS/scenario-options-menu.input \
    --session 1 --link latency=50,jitter=10,loss=2,seed=7 --out D --json               # M3
```
The gate is fail-fast; fix its first failure first. A desync is a determinism bug in the port (or
a section missing from the digest), never in the check: find the first differing sync point and
what wrote it (`/first-divergence` works on two sync.csv files).

## 4. Record

Append to `XMen2Recomp/docs/NOTES.md` "Phase 7" (sections and sizes, fiber depth, replay cost,
determinism fixes, R4's cost, the joins, the second machine's mixing). User calls go to
`docs/QUESTIONS.md` with a default. Rebase on `origin/main`, rebuild, gate, commit (`git commit -F`),
push every repo touched (engine forks too). Every few batches: `uv run tools/phase.py 7`. When an
online game and a four-player game play, queue the playtest (M6: `multiplayer-verified: DATE`, the
user's word only) with the exact commands, and keep working.
