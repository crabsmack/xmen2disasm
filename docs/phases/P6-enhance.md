# Phase 6: enhancements (definition of done)

approved: 2026-10-21

**Status: criteria approved by the user 2026-10-21, with rulings R1-R7** (asked one by one in
the session; R4 and R5 with the user's conditions, recorded below), **and R8 on 2026-10-22**
(two widescreen modes). Phase 6 is the user's three
enhancements, as decided on 2026-10-21 (ROADMAP.md "Decisions on record"): **full frame rate in
two-player**, **high frame rate** and **true widescreen**. Phase 7
([P7-multiplayer.md](P7-multiplayer.md)) is online play and four players. Work starts once
phase 5 is complete (its P8 playtest). Changing a criterion or a definition below needs the
user's approval, recorded here.

**Changed 2026-10-21 (user, in the session):** E5 no longer asks that the sync rows equal the
reference with the activation margin 0. Under R7 the widened streaming writes the extra columns
into VRAM, and the camera's limits move at the level edges, so the state differs from the
original even when no object acts differently. E1 proves the original with widescreen off. The
same day, before any work, "The contract" section was added: how each criterion is measured
(the `phase.py 6` checks), with the criteria unchanged.

**Changed 2026-10-21 (user, in the session, two rulings asked from QUESTIONS.md):**
- **E4's latency probes** are the first gameplay sync point at or after each of the 10 evenly
  spread points (before the next one) where the flip changes the 60 Hz picture within 40 frames.
  The native TAS (the frame-synchronous machine) doesn't play its recorded game and keeps
  pausing, where C changes nothing, so 7 of the 10 spread points showed no change whatever the
  feature did. A stretch with no such point fails its probe.
- **The screen id inside `Cerebro_Run`** is the Cerebro screen's (`CerebroScreen PlayerSelect`
  for the select after a death, 4:3), not the stage's scene whose index it runs under.

**Changed 2026-10-22 (user, in the session): R8, two widescreen modes.** The user asked for a
16:9 view that only changes the picture, as the default when widescreen is on, beside R6's
gameplay-affecting one, and approved the design discussed in the session (a render camera rather
than bars at the level edges). Ruled as R8 below. E2 lists the new setting, E5 is measured in both
modes and checks in the presentation mode that the game's state is the 4:3 run's; the contract
gains `--game-rows` and the `bars_unneeded` counter.

**Changed 2026-10-30 (user, in the session: "do add that check"): E4's even frames.** A player
reported stutter at `high_fps=120`. The frames in between were an absolute 120 Hz clock's ticks
with each whole frame on top: 180 a second, bunched where the clock ran near a whole frame, which
a 120 Hz screen drops unevenly (xmen2-pc NOTES "Even frames"). E4 measured each whole frame's time
but not the spacing. It now also asks, of every present log it reads, that the frames between two
whole frames split the span evenly. The negative control: the 23 present logs left by the earlier
runner fail it, and the fixed runner's pass.

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
  (Not chosen: separate builds.) *Later (the user, 2026-10-24, outside phase 6's criteria):
  `music_voices`, the music on sound machines of its own, is the first option on by default. It
  is sound only (the session machine's audio; no game state, not in the canonical digest, no
  traced run starts it), so the checks against the original are unchanged with it on; E2 lists
  only the phase-6 options.* *Later (the user, 2026-10-30: "let's use auto for refresh rate and
  aspect ratio"): `high_fps` and `widescreen` default to `auto`, the display the window opens on
  (its rate when over 60 Hz; 16:9 when wider than 3:2), else off. Presentation only, and with no
  window (every traced run) `auto` is off, so the checks against the original are unchanged; E2
  takes `auto` as their default (xmen2-pc b9d1fc6).*
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
  appear earlier, as in the engine's Sonic 2). It is a separate margin from the view's (0 gives the
  original activation, for diagnosing; not a deliverable, and not compared: see the 2026-10-21
  change below).
  Camera locks (boss arenas) and level edges get bars where the wider view would show what the
  level never meant to show.
- **R7 Widescreen planes. Ruled: widen the streaming first.** Widen the game's own streaming
  (`Map_StreamColumns` / `Map_StreamRows`, native branch) to keep the wide view drawn, with the
  engine's VDP margins as the renderer. Fallback, only where the streamer can't (narrow BG planes,
  `g_BgNarrow`: 44 tiles = 352 px): a scene renderer that draws plane A or B straight from the
  block map, as Sonic 1's does, checked against the name table wherever both exist.
- **R8 Widescreen modes (ruled by the user 2026-10-22, in the session). Ruled: presentation only
  by default, R6's gameplay mode as a second setting** (the user: "make this r8 ... the default
  widescreen mode should be presentation-only, not the gameplay-affecting one").
  - `widescreen=16:9` alone is **presentation only**: the game plays as in 4:3. Objects activate,
    spawn and despawn at the original 320 px (`ACT_L`/`ACT_R` give the original windows), the
    camera keeps its original limits (`CAM_LO`/`CAM_HI` the original), and every 320-px test that
    decides what the game does stays 320. Only what is drawn widens: the sprite culls that choose
    what is drawn, the streamer (R7), the HUD.
  - A **render camera**, which exists only in the renderer, keeps the 400-px window inside the
    level: it starts at `clamp(camera - 40, L, R - 400)`, `[L, R)` the x the level shows (the
    camera's range widened by the 320-px view, within the FG map). In mid-level that is
    `camera - 40`, the same picture as R6's; at a level's edge the 80 extra pixels go to the open
    side instead of a bar. A level narrower than 400 px is centred, with bars past its ends. (Not
    chosen: bars wherever the view passes the camera's 4:3 limits, which would put a bar at the
    start of every level.)
  - The cost the user accepted: objects still appear and vanish at the original 320-px edges, now
    inside the margins.
  - `widescreen_gameplay=1` (with `widescreen=16:9`) is R6 as built: objects activate across the
    wide view and the camera keeps the wide view inside the level. Off by default.
  - Online (phase 7 R10): `widescreen_gameplay` changes the game and is the host's. The 16:9 view
    stays the host's too for now: presentation only, it still changes the sprite table and the
    planes that the canonical digest compares, so a seat with another view would read as a desync.
    Making the view a local setting (R10's note) needs the digest to leave that state out
    (`--game-rows`' masks); phase 7's to decide.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| E0 | Criteria approved | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title |
| E1 | The original is kept | the release runner with every option off passes phase 5's measured criteria: `phase.py 5`'s P1-P7 and P9, on the phase-6 sources and runner (the corpus traces equal the reference at every sync point, P2's ledger, the object scan and link map, the TAS framebuffers, the Linux TAS) |
| E2 | Options | `XMen2.exe --options --json` lists `full_rate_2p`, `high_fps`, `widescreen`, `widescreen_gameplay` (R8) (with their settings), each off by default (`high_fps` and `widescreen`: `auto`, off without a display; R1's 2026-10-30 note), read from the command line and the settings file. A run with each option given explicitly off has the same sync rows and framebuffers on the TAS as a run without options |
| E3 | Two-player full rate | with `full_rate_2p` on: every corpus run that never has two players alive has the same sync rows and framebuffers as with it off (the option touches only two-player play); on the TAS from the frame player 2 joins and on `scenario-two-player`, every logic frame is one displayed frame (no frame-tick wait), `g_TwoPlayerStep` stays 0, and every corpus input runs to its end with no fatal from the memory layer and no hang |
| E4 | High frame rate | with `high_fps` at 120 and 144 Hz (a headless present clock): the sync rows of the whole corpus equal the reference (presentation only), and the frame shown at each logic instant has P7's hash. On the TAS's gameplay frames, at least 95% of the sprites outside the HUD are matched to an object and interpolated, and the 144 Hz render time is p99 < 6.9 ms on this machine. Latency (R4): on a scripted input change that shows on screen in each of 10 TAS scenes, the first displayed frame that shows its effect comes no later on the present clock than with `high_fps` off, and the whole logic frame is on screen at the same time as with it off |
| E5 | Widescreen | in both of R8's modes (`widescreen=16:9`, presentation only, and with `widescreen_gameplay=1`): on every gameplay frame of the TAS input and each corpus input, the wide columns of planes A and B hold what the level's block map says (0 terrain-check errors), no sprite is lost to the 9-bit x range, the HUD is pinned to the screen edges, and each non-gameplay screen is as `game/widescreen_screens.toml` lists it (R5: wide with its wide columns drawn, or 4:3 centred with bars; each with its reason); every corpus input runs to its end with no fatal and no hang. Presentation only (R8): at every sync point of every corpus input the game's state equals the run with widescreen off (`--game-rows`), and no gameplay frame has a bar where the level shows 400 px or more (the render camera) |
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
- **The game's state** (R8, `--game-rows`): work RAM with the stack area masked as the sync rows,
  less the RAM the view changes that nothing deciding the game reads (each range listed in the
  runner, `main.cpp` `k_view_ram`, and in NOTES with its readers: the sprite table and its fill
  state, the streamer's drawn x, the sprite-slot splices of Cyclops's beam and the hologram
  flickers); CRAM; VSRAM; VRAM less the plane A and B name tables and the
  sprite table. A masked range that fed the game would show in the rest, so the comparison checks
  the masks too.
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

## The contract (extends P5's)

What `phase.py 6` calls in XMen2Recomp. Building these is phase 6's work: until a piece exists,
the criteria that need it fail and name it.

```
XMen2Native --options --json        # (the release runner, XMen2.exe in the package) prints, exits 0:
    # {"options": {"full_rate_2p": {"default": "0", "values": [...]},
    #              "high_fps":     {"default": "0", "values": [...]},     # 0 = off, else a rate in Hz
    #              "widescreen":   {"default": "0", "values": [...]},     # 0 = off, "16:9"
    #              "widescreen_gameplay": {"default": "0", "values": ["0", "1"]},   # R8: 1 = R6's mode
    #              ...}}                                                    # more settings may follow
    # --options K=V,K=V on a played or traced run sets them; a settings file beside the runner
    # (`xmen2.ini`, [options] K=V) sets them too, the command line winning
xmen2check.py options --json
    # {"ok", "exe", "options": <the runner's --options --json>,
    #  "from_settings": {K: V}}   # the effective values of a run whose xmen2.ini sets every option
    #                             # to its first non-default value (the runner's own report)
xmen2check.py trace --mode native ... [--options K=V,...] [--present-log] [--flip N] [--game-rows]
    # as phase 5; the runner gets --options. The JSON adds "options" (the effective values) and
    # "enhance" (counters below). --present-log writes OUT/present.csv: one row per displayed
    # frame on a headless present clock (high_fps's rate, 59.92 Hz when off), columns
    #   sync      the sync row whose frame this leads to (fb_fnv1a64's row k)
    #   t_us      its display time (row k's whole frame: k x 16,688.9 us in both modes)
    #   whole     1 for the frame of a whole logic frame, 0 for an interpolated one
    #   gameplay  1 on a gameplay frame
    #   fb_fnv1a64  the frame's hash (as --fb)
    # --flip N: the C button's state inverted in runner frames N to N+7 of the input script
    # (the latency probe). --frames cuts the run as before. --game-rows (R8) writes OUT/game.csv:
    # `sync,game_crc32`, the CRC-32 of the game's state ("Definitions") at each sync point.
xmen2check.py package [--platform P] --json
    # as phase 5, plus "options": the packaged runner's --options --json
```

`enhance` counters, in every native trace:

| Counter | What |
|---|---|
| `two_player_frames` | logic frames with two players alive (`g_PlayersAlive == 2`) |
| `two_player_step_frames` | logic frames with `g_TwoPlayerStep` set |
| `frame_tick_waits` | V-ints taken by a wait for the frame tick outside a sync point (`plat_wait_vint`) |
| `present` (with `high_fps` or `--present-log`) | `{"hz", "frames", "whole", "sprites", "sprites_matched", "render_us_p99"}`: sprites counted on gameplay frames, outside the HUD; matched = drawn interpolated from their object's previous position; render time per displayed frame |
| `ws` (with `widescreen`) | `{"gameplay_frames", "terrain_checks", "terrain_errors", "sprites_lost", "hud_misplaced", "bars_unneeded", "screens": {screen id: "wide" or "4:3"}}` |

- `sprites_lost`: sprite table entries reached by the links whose 16-bit x word lies in the wide
  view but outside the 9 bits the VDP reads (R8: the word as the render camera shifts it for the
  VDP, the HUD's unshifted).
- `hud_misplaced`: gameplay frames where a HUD sprite `Level_FrameLoop` writes (tile attribute
  `$A7xx`) is not at its 4:3 x minus the left margin (player 1's) or plus the right margin
  (player 2's): the view's margin, 40 px (R8's render camera leaves the HUD where it is).
- `bars_unneeded` (R8): gameplay frames on a wide screen, presentation only, with a bar where the
  level's showable `[L, R)` is 400 px or wider.
- **Screen id**: the name string of the running scene's `g_SceneTable` entry
  (`g_SceneIndex`), or `boot` before the first scene; inside `Cerebro_Run`, the Cerebro
  screen's (the select after a death runs under its stage's index: `CerebroScreen PlayerSelect`). `game/widescreen_screens.toml` lists
  each id the corpus reaches: `"<id>" = { mode = "wide" | "4:3", why = "..." }`.

How `phase.py 6` measures each criterion (corpus runs under P5's D1 replay inputs; traces cached
by the runner's hash as in phase 5):

- **E1**: phase 5's measurement (`phase5()`), passing when P1-P7 and P9 pass.
- **E2**: `options --json` lists the four settings with default `0` (`high_fps` and `widescreen`:
  `0` or `auto`), `from_settings` equals what the settings file set (each option's first value
  other than its default), and the TAS with
  `--options full_rate_2p=0,high_fps=0,widescreen=0,widescreen_gameplay=0 --fb`
  has the same rows and frame hashes as without options.
- **E3**: every corpus run with `--fb`, with the option off and on. A run whose off trace has
  `two_player_frames` 0 must have the same rows and frame hashes both ways. Any other run must
  have `two_player_step_frames` 0 and `frame_tick_waits` 0 with the option on. All of them end
  normally.
- **E4**: every corpus run with `high_fps=120` and with `144`, each with `--present-log`.
  - Its rows equal the reference.
  - Even frames (2026-10-30): between two consecutive whole frames at `t0` and `t1`, its present
    log has no frame, or n - 1 frames at `t0 + i (t1 - t0) / n` (within 1 us), n = the rate x
    (`t1 - t0`) rounded. The same for the TAS at 144 below.
  - On the TAS at 144: each whole frame's hash equals the `--fb` row it leads to, and each whole
    frame is at the same `t_us` as in the TAS's `--present-log` run with the option off;
    `sprites_matched / sprites` ≥ 0.95; `render_us_p99` < 6900.
  - Latency: 10 points spread evenly over the TAS's gameplay sync points; each probe is the
    first gameplay sync point N at or after one (before the next) where `--flip N` with the
    option off changes the picture within 40 frames (none: that probe fails). At each, `--flip N`
    at 144: the first displayed frame that differs from the unflipped run comes no later at 144
    than with the option off.
- **E5**: every corpus run with `widescreen=16:9` and with `widescreen=16:9,widescreen_gameplay=1`.
  Each ends normally with `terrain_errors`, `sprites_lost` and `hud_misplaced` 0, and
  `terrain_checks` > 0 when it has gameplay frames. Every reported screen is in
  `widescreen_screens.toml` with the same mode and a reason. Presentation only (R8): with
  `--game-rows`, its `game.csv` equals that of the run with `widescreen=0` (every row), and
  `bars_unneeded` is 0.
- **E6**: both packages as P8/P9 (ROM-free, built), each runner listing the options of E2, and
  `enhancements-verified: DATE` in XMen2Recomp `docs/USER_VERIFIED.md`.

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
