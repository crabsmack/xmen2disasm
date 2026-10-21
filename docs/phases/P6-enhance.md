# Phase 6: enhancements (definition of done)

approved: 2026-10-21

**Status: criteria approved by the user 2026-10-21, with rulings R1-R7** (asked one by one in
the session; R4 and R5 with the user's conditions, recorded below). Phase 6 is the user's three
enhancements, as decided on 2026-10-21 (ROADMAP.md "Decisions on record"): **full frame rate in
two-player**, **high frame rate** and **true widescreen**. Phase 7
([P7-multiplayer.md](P7-multiplayer.md)) is online play and four players. Work starts once
phase 5 is complete (its P8 playtest). Changing a criterion or a definition below needs the
user's approval, recorded here.

Goal: XMen2Native gains the three enhancements as **options**. With every option off it is still
the proven port of phase 5, checked by the same measurements. With an option on, it is checked
by its own measurements, which say what may change and what may not. The user plays it.

Checked by `uv run tools/phase.py 6` (writes `docs/progress/P6.md`). Requires phase 5 complete
(all of it but P8's playtest is done as of 2026-10-21).

## What phase 5 leaves (measured 2026-10-21)

1. **Two-player half rate.** `Level_FrameLoop` (`game/c/1FA124.c`) sets
   `g_TwoPlayerStep = g_PlayersAlive == 2`. Then each pass waits for the frame tick (an extra
   V-int) as well as its V-blank, so game logic runs at 30 Hz, and about 150 functions step their
   objects, timers and counters by 2 (`g_TwoPlayerStep ? 2 : 1`). One-player mode is the same code
   at step 1. `PlayerSelect_Run` and `Cerebro_PlayIntro` wait the same way, and five scene
   functions also set the flag (`0383DC`, `0C0E54`, `0C1258`, `0E78F2`, `1F98A8`).
2. **Screen width.** About 50 tests in 67 files compare against 320 / `0x140`: sprite culling,
   on-screen checks, spawn and despawn windows, and the camera's right limit (`mapWidth - 0x140`
   in `0820AE`, `082176`, `09907A`, `0FC8A4`). Not every `0x140` is a width: some are speeds and
   positions. The HUD's sprite positions are constants in `Level_FrameLoop`.
3. **Planes and streaming.** The planes are 64x32 cells (512x256 px; VDP register 16 = 1 in
   `Sys_InitGameVideo`). `Map_StreamColumns` draws a column at the plane's right edge 184 px ahead
   of the drawn x, or 44 tiles with `g_MapStreamNarrow`. A 16:9 view at 224 lines is about 400 px,
   so it fits in the plane, but not in what the streamer keeps drawn.
4. **Sprites.** The game builds an 80-entry sprite table (`g_SpriteTable`), DMA'd every V-blank.
   61 functions write entries directly, besides the common draw path. Hardware sprite x is 9 bits
   (visible at 128-447 in H40), which still covers a 16:9 view (88-487).
5. **The renderer is the engine's VDP model** (phase 5 R3). It already has what the engine's
   widescreen Sonic ports use: side margins (`gvdp_set_ws_extra`), a fixed 16:9 canvas with
   pillarbox bars (`gvdp_set_ws_canvas`), unlimited sprites (`gvdp_set_unlimited_sprites`), and
   host sprite and palette hooks. The engine has a game-owned scene renderer hook (`GameVideo`,
   `runner/game_video.h`; Sonic 1's `sonic1_video.c` draws the level from its block map). It has
   nothing for high frame rates.
6. **Speed.** 1.7 ms per frame median, 2.0 ms p99 (TAS, this machine; the render is about two
   thirds of it). The slower Linux PC where the D8 playtest chugged in the Sentinels escape is not measured.

## Rulings (ruled by the user 2026-10-21, one by one in the session)

- **R1 Options. Ruled: as proposed.** Each enhancement is a runtime option of the one release
  runner (command line, a settings file next to it, and keys for the two presentation options),
  off by default. Every check that compares against the original runs with all options off.
  (Not chosen: separate builds.)
- **R2 Sources. Ruled: keep the byte matches.** Phase 5's R4 continues: every source keeps
  compiling in all three modes, the files that byte-match keep matching, and `verify` keeps
  proving the rest. Option code goes in native-only branches (`#if defined(XMEN2_NATIVE)`), and
  the worker gate catches a branch that changes an MPW match. (Not chosen: letting the enhanced
  sources diverge from the matched ones. Phase 7 R4 asks again for four players, which touch far
  more files.)
- **R3 Two-player full rate. Ruled: as proposed.** With the option on, `g_TwoPlayerStep` stays 0
  and the extra waits go with it, so two players run at 60 Hz on the one-player stepping. Nothing
  in the original can check this mode, because the original never ran it; E3 measures what can
  be measured.
- **R4 High frame rate. Ruled: interpolation, latency only if unavoidable** (the user: "sure, if
  unavoidable"). The logic stays at 60 Hz, and the display shows frames interpolated toward the
  newest logic frame at the monitor's rate. The latency is avoided by timing, not accepted: each
  logic frame runs as soon as its input is read, at the point where the original reads it, and
  the interpolated frames lead up to it. So every whole logic frame appears when the 60 Hz build
  shows it, and the frames in between only add. E4 measures that this holds. Interpolated: the
  camera, per-line scroll, and sprites matched to their object and piece. Not interpolated: the
  HUD, anything unmatched, a jump over a set distance (it snaps), and palettes. Presentation only:
  the game's state never sees an interpolated frame.
- **R5 Widescreen size. Ruled: 16:9 first; non-gameplay screens stay 4:3 unless they have a
  sensible wide presentation** (the user: "if there's no sensible way they'd display in
  widescreen then yes"). Wider ratios need the host sprite path, and come later if wanted.
  Levels go wide. Title, menus, Cerebro, player select and cutscenes are decided screen by
  screen: wide where the screen extends naturally, for example a background that already
  continues past 320 px, otherwise 4:3 with bars. The list and the reason for each go in NOTES.
- **R6 Widescreen gameplay. Ruled: yes, objects activate across the wide view.** Objects activate,
  spawn and despawn across the wide view, not the original 320 px ("true widescreen": enemies
  appear earlier, as in the engine's Sonic 2). It is a separate margin from the view's. With that
  margin 0, the same code is a presentation-only widescreen that E5 compares against the original.
  Camera locks (boss arenas) and level edges get bars where the wider view would show what the
  level never meant to show.
- **R7 Widescreen planes. Ruled: widen the streaming first.** Widen the game's own streaming
  (`Map_StreamColumns` / `Map_StreamRows`, native branch) to keep the wide view drawn, with the
  engine's VDP margins as the renderer. Fallback, only where the streamer can't (narrow BG planes,
  `g_BgNarrow`: 44 tiles = 352 px): a scene renderer that draws plane A or B straight from the
  block map, as Sonic 1's does, checked against the name table wherever both exist.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| E0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title |
| E1 | The original is kept | the release runner with every option off passes phase 5's measured criteria: `phase.py 5`'s P1-P7 and P9, on the phase-6 sources and runner (the corpus traces equal the reference at every sync point, P2's ledger, the object scan and link map, the TAS framebuffers, the Linux TAS) |
| E2 | Options | `XMen2.exe --options --json` lists `full_rate_2p`, `high_fps`, `widescreen` (with their settings), each off by default, read from the command line and the settings file. A run with each option given explicitly off has the same sync rows and framebuffers on the TAS as a run without options |
| E3 | Two-player full rate | with `full_rate_2p` on: every corpus run that never has two players alive has the same sync rows and framebuffers as with it off (the option touches only two-player play); on the TAS from the frame player 2 joins and on `scenario-two-player`, every logic frame is one displayed frame (no frame-tick wait), `g_TwoPlayerStep` stays 0, and every corpus input runs to its end with no fatal from the memory layer and no hang |
| E4 | High frame rate | with `high_fps` at 120 and 144 Hz (a headless present clock): the sync rows of the whole corpus equal the reference (presentation only), and the frame shown at each logic instant has P7's hash. On the TAS's gameplay frames, at least 95% of the sprites outside the HUD are matched to an object and interpolated, and the 144 Hz render time is p99 < 6.9 ms on this machine. Latency (R4): on a scripted input change in each of 10 TAS scenes, the first displayed frame that shows its effect comes no later on the present clock than with `high_fps` off, and the whole logic frame is on screen at the same time as with it off |
| E5 | Widescreen | with `widescreen` 16:9: on every gameplay frame of the TAS input and each corpus input, the wide columns of planes A and B hold what the level's block map says (0 terrain-check errors), no sprite is lost to the 9-bit x range, the HUD is pinned to the screen edges, and each non-gameplay screen is as NOTES lists it (R5: wide with its wide columns drawn, or 4:3 centred with bars); every corpus input runs to its end with no fatal and no hang. With R6's activation margin 0, the sync rows of the whole corpus equal the reference |
| E6 | Release and playtest | `xmen2check.py package` (Windows and Linux) builds packages with the options and the same ROM-free check as P8/P9; and `docs/USER_VERIFIED.md` (XMen2Recomp) has `enhancements-verified: YYYY-MM-DD`, written only on the user's word after playing all three |

### Definitions (changing any of them needs the user's approval, recorded here)

- **Release runner**: XMen2Native as phase 5 packages it, plus the options. One executable.
  Verification runs pass the options explicitly.
- **Gameplay frame**: a frame in which `g_InLevelLoop` is set and no fade is running.
- **Terrain check**: for each 8x8 cell of plane A and B that the wide view shows, the name table
  entry in VRAM (or the scene renderer's tile, under R7's fallback) equals the cell the block map
  gives for that position (`g_FgBlockMap` / `g_BgBlockMap` and the block definitions), with the
  levels' known exceptions (tiles the game rewrites at run time, `Map_RedrawBlock`) listed in
  NOTES with their reason.
- **No fatal, no hang**: the native runner exits 0 at the end of the input; `xm::fatal` (an
  address outside work RAM and the ROM, a store tag out of range, the stack region overrun) and the
  hardware-poll limit both count as failures.

## Where things live

| What | Where |
|---|---|
| Options, interpolation, widescreen presentation | `XMen2Recomp/platform/native/` |
| Game-side changes (step, widths, streaming, activation, HUD) | `XMen2Recomp/game/c/`, native-only branches |
| Contract | `XMen2Recomp/tools/xmen2check.py` (`trace --options ...`, `package`) |
| Notes | `XMen2Recomp/docs/NOTES.md` "Phase 6" |

## How to work it

The loop (ROADMAP.md "Working a phase autonomously"), the worker gate (`tools/gate.py`) after
every batch, notes, `phase.py 6`, commit and push. Suggested order, smallest first:

1. **E0** approved 2026-10-21. **E1** passes from the start (phase 5's result) and
   stays the regression gate. **E2**: the option plumbing first, before any enhancement.
2. **E3** two-player full rate: one branch in `Level_FrameLoop` and the five scene setters, then
   the waits in `PlayerSelect_Run` and `Cerebro_PlayIntro`. Check the two-player corpus run for
   sprite flicker (consider the VDP model's unlimited sprites as part of the option).
3. **E5** widescreen: the widths as a native variable (each `0x140` read and classified, in
   NOTES), the camera limits, the streamer (R7), the HUD, the activation margin (R6), each non-gameplay
   screen wide or 4:3 (R5, listed in NOTES); the terrain check before anything else, so every later step is measured.
4. **E4** high frame rate: sprite tagging in the draw paths (object and piece), the present
   clock, each logic frame run as soon as its input is read (R4: no added latency), interpolation
   of the camera, scroll and sprites, the snap rules.
5. **E6** package, then queue the playtest the moment it plays.

Same rules as earlier phases: never weaken a check; engine changes go in the forks; kill runners
only by PID.
