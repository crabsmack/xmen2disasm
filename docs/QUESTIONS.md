# Questions for the user (non-blocking queue)

The user starts autonomous runs and leaves. A session that stops to ask stalls until he next looks,
so questions go **here**, with the default the session is taking, and work continues. See
ROADMAP.md "Working a phase autonomously" and LESSONS.md "Never block on the user".

**Sessions:** read this at start; apply any answer the user wrote (and revert the default's commits if
the answer differs), then move the entry to "Answered". Add a new entry the moment a question
comes up, send a PushNotification if that tool is available, and keep going on the default.
Never write the user's answer, a `user-verified`/`handc-verified` line, an approval or a `user_ack`
yourself.

**The user:** answer inline under "Answer:" (a word is enough); the next session picks it up.

Entry format:

```
### YYYY-MM-DD: short title (phase/criterion)
- Question:
- Default taken meanwhile: (what, and which commits carry it, so a different answer reverts cleanly)
- Blocks only: (what can't finish without the answer; everything else continues)
- Answer:
```

## Open

### 2026-10-22: try R8's two widescreen modes (P6, after E6)
- Question: R8 is built (XMen2Recomp `ws-presentation` merged to main; see P6-enhance.md R8).
  `--options widescreen=16:9` (or `widescreen=16:9` in `xmen2.ini`) is now presentation only: the
  game plays exactly as in 4:3 (checked: the game's state equals the 4:3 run's at every sync
  point of the corpus and of every stage's walker run), enemies still appear at the old 320-px
  edge, and at a stage's edge the picture slides instead of showing a bar. Add
  `widescreen_gameplay=1` for the mode you played before (enemies across the wide view). Also
  fixed in both modes: Siberia's right 40 px were barred on every frame (its foreground is a
  repeating 512-px strip, which the bar test misread as the stage's end). A look at a stage's
  start and end in each mode is enough; anything odd (a bar, a seam, a jump of the picture at
  an edge, the HUD moving), a line here.
- Default taken meanwhile: none needed. E6's `enhancements-verified: 2026-10-22` predates R8 and
  stays; this is a check of the new mode, not a criterion.
- Blocks only: nothing.
- Answer:

### 2026-10-22: play four players and online (P7 M6)
- Question: play the multiplayer build (XMen2Recomp 9538d30 or later; the package as before:
  `uv run tools/xmen2check.py package`, or on Linux `native-build`; the README in it has all of this):
  - **Four on one machine**: `--options players=4` (or 3) with four controllers plugged in (players 1-4
    in plugging order; the keyboard is player 1). Players 3-4 press Start at the player select to
    join and pick a character as player 2 does (no two the same); in Siberia's opening they join with
    Start. Things to look at: their panels ("3"/"4" beside 1 and 2), the camera keeping everyone in
    view, their sprites and shots, the teleporters in CloneA2, the music: on Siberia (Blizzard),
    BaniMaza's exterior, Savage's Jungle 2 and the Clone stages players 3-4's characters add their
    own parts to the stage music, as players 1-2's do.
  - **Online**: two machines (or two windows on one): host `XMen2 xmen2.bin --netplay lan --seat 0
    --seats 2 --bind 0.0.0.0:7000`, the other `--netplay lan --seat 1 --seats 2 --bind 0.0.0.0:7001
    --peer HOSTIP:7000` (UDP 7000 open on the host). For four: `--netplay hub --seats 4` on every
    seat (seats 1-3 each with their own `--seat N`, port and `--peer HOSTIP:7000`) and
    `--options players=4` on the host. Each seat plays with its own keyboard / first controller.
  If they play well, add `multiplayer-verified: DATE` to XMen2Recomp `docs/USER_VERIFIED.md` (or say
  so here). Anything off (a desync message, lag, a player 3-4 missing from the picture or the
  music, the camera losing someone), a line here is enough, with the stage.
- Default taken meanwhile: none needed.
- Blocks only: M6 (its `multiplayer-verified` line), so `phase.py 7` exiting 0.
- Answer:

## Answered

### 2026-10-21: play the enhancements (P6 E6)
- Question: play the native port with the three options (XMen2Recomp 64c0ef9 or later; this can be
  the same session as P5's `port-verified` playtest below). Windows: `uv run tools/xmen2check.py
  package` makes `build\package\xmen2-native-windows.zip`; Linux: pull, `uv run tools/xmen2check.py
  native-build`. Then, each on its own or together:
  - `--options widescreen=16:9`: a 400-px view in the stages (Cerebro screens stay 4:3, bars where a
    room is narrower than the view); the HUD at the screen's edges; enemies appear earlier (R6).
  - `--options high_fps=144` (or 120/165/240 for your display): frames in between the game's own.
    F9 turns it off and on while playing; F10 turns the 16:9 view on/off from the next screen.
  - `--options full_rate_2p=1` with a second pad: two players at 60 Hz. (Also new, with the option
    off: two players now play at the original's 30 Hz in the played port; before they ran at
    twice the speed, the frame-synchronous machine showing one frame per logic frame.)
  - Or an `xmen2.ini` beside the program: `[options]` then `widescreen=16:9` etc.
  - Cheats (asked for during the playtest, not criteria): `lives=inf` or `lives=N` (1-99),
    `magneto=1` (selectable from the start), `start_char=beast..magneto` (Siberia's character at
    power-on, otherwise at random: played runs now read a real V counter, so it varies again).
  - Progress (2026-10-21): the first session found ghost limbs beside an idling Cyclops and part
    of him missing in his charged blast at 144 Hz; fixed in XMen2Recomp 8adad13 (sprites move by
    their object's anchor).
  If they play well, add `enhancements-verified: DATE` to XMen2Recomp `docs/USER_VERIFIED.md` (or
  say so here). Anything off (seams in the wide view, objects popping, judder at 144 Hz, flicker),
  a line here is enough; most useful with the stage and roughly where.
- Default taken meanwhile: none needed; the other criteria are worked meanwhile.
- Blocks only: E6 (its `enhancements-verified` line), so `phase.py 6` exiting 0.
- Answer (the user, in the session, 2026-10-22): played since 8adad13, all good. The
  `enhancements-verified: 2026-10-22` line went into USER_VERIFIED.md at his word.

### 2026-10-22: M4's bounds where the original has players off view or dead (P7 M4)
- Question: M4 wants every player in play ≥ 50% of a stage input's gameplay frames and outside the
  view ≤ 1% of its in-play frames. 20 of the 23 stage inputs meet every bound with `players` 4 and
  with 3 (M4 runs both); the other three can't, with either, for reasons that are the original game's:
  - **avalon** (scene 8, AvalonB1): the stage opens with the camera panning up to the players, 191
    frames with players 1-2 outside the view, the same 191 with `players` 2 (the original). Under 1%
    would need about 19,100 frames in play after it.
  - **boot** (SiberiaB1): in the snow drifts the players' feet (their position) go below the view's
    bottom edge, 3-4% of frames per player (the TAS's one player, by the same measure, is outside the
    view on 23% of its gameplay frames). Player 1 also dies early there (44% in play). And M4's
    `hud_missing` 0: boot has 106 such frames with `players` 4 (105 with 3). 102 are the original's own:
    player 1's panel is absent for frames 300-401 of the opening, the same 102 with `players` 2. The
    other 4 are join frames: Level_FrameLoop draws the HUD before it reads the pads, so a player who
    joins with Start gets a panel the next frame (with `players` 2, player 2's join frame is covered
    by the blinking "press Start" prompt, whose sprite has the panel's tile).
  - **cloneA5** (scene 42, Brood): its attacks aim at players 1-2 by name and kill them within 500
    frames (35% in play) while players 3-4 live on (87%).
  Proposed, for off view: a player counts as off view only while the camera is following the players
  (not during a scripted pan, `g_Camera` locked or panning) and with the HUD row (the bottom 32 px)
  counted as in view; or: each player's off-view share no more than players 1-2's with `players` 2 on
  the same input, plus 1%. For cloneA5: Brood (and the other enemies that still pick players 1-2 by
  name, about 80 files) taking aim at all four (R7: the two-player rules extended), or the input's play
  cut to under 500 frames.
- Default taken meanwhile: the bounds as written. M4 stays failing on those three inputs; the inputs
  meet them on the other 20 (on stages whose enemies kill players early, the input plays 900-2,000
  frames instead of 3,000: NOTES.md "M4"). The rest of phase 7 (M5, M6's packages) goes on.
- Blocks only: M4 passing (so `phase.py 7`).
- Answer (the user, in the session, 2026-10-22), recorded in P7-multiplayer.md (M4, "Rulings after M0"):
  - off view relative to the original: each player's `off_view` share at most the larger of players
    1-2's shares with `players` 2 on the same input, plus 1%;
  - HUD relative to the original, join frames skipped: a missing panel counts only where the
    `players` 2 run of the same input draws it, and not on the first frame of a stretch in play;
  - enemies aim at all four: the ones that pick players 1-2 by name choose among every player in
    play (R7, the two-player rules extended).

### 2026-10-21: phase 7 criteria and rulings (P7 M0)
- Question: the same for [phases/P7-multiplayer.md](phases/P7-multiplayer.md) (M0-M6, rulings
  R1-R9). It is a draft to be revised at its kickoff with what phase 6 teaches, so this can wait
  until phase 6 is done. The defaults:
  - R1 the engine's rollback netplay (`recomp-net`, `rbengine`); R2 full in-process savestates
    with the game back on a fiber (quick save and rewind not in the release); R3 two players
    online first, then four on one machine, then four online.
  - R4 four-player sources: native-only branches on the first 20 files, with the cost measured
    and recorded, then this is asked again (the alternative is letting the four-player sources
    diverge from the byte-matched ones).
  - R5 players 3 and 4 in a native memory region outside the 68000's 64 KB; R6 extra palettes and
    tile memory as host-side renderer extensions; R7 the two-player rules extended (no difficulty
    scaling, the camera follows the group); R8 LAN and direct IP first, then relay and ICE, no
    lobby server until you say who hosts one.
  - R9 (added 2026-10-21 from your note that players 3 and 4 should add their characters' music
    parts as players 1 and 2 do): a second, audio-only sound machine running the same driver
    with `$B`/`$C` = players 3 and 4, mixing in only its part channels; the alternative is an
    edited four-slot song bank.
- Default taken meanwhile: none (phase 7 follows phase 6).
- Blocks only: M0, so all of phase 7.
- Answer: approved, with the rulings asked one by one in the session after the kickoff's three
  measurements (the user, 2026-10-21): R1 the engine's libraries with our own glue; R2 savestates
  internal only (no quick save/rewind); R3 online two-player first; R4 keep the byte matches
  (checkpoint after 20 files); R5 a native region; R6 extend with no sprite limits (palettes need
  nothing: every hero is on line 1); HUD panels 3-4 built from the ROM's tiles; R7 the two-player
  rules extended; R8 LAN/IP then relay+ICE, no lobby; R9 the second sound machine; new R10 the
  host's game-changing options apply to everyone ("we already have 16:9 so check it (I believe
  it affects gameplay). I may add an option later for 16:9 with no gameplay changes (just
  presentation), and if so that could be a local setting"). The revised criteria and thresholds
  approved as shown. Recorded in P7-multiplayer.md (`approved: 2026-10-21`) and ROADMAP.md.

### 2026-10-21: E4's latency probes can't see the C button on the native TAS (P6 E4)
- Question: E4 flips player 1's C at 10 evenly spread gameplay sync points of the TAS and needs
  the flip to change the picture. In the native machine the TAS doesn't play the recorded game:
  the frame-synchronous machine (P5 R5, no lag frames) desyncs it in the first stage (its rows
  differ from the D1 recomp's from sync 1; P1 compares native with stepped-gen, the same machine).
  It stays in Siberia, and its inputs keep pausing the game: 4 of 6 probe points looked at are the
  pause screen (a gameplay frame by the definition: `g_InLevelLoop` set, no fade), where C does
  nothing. 7 of the 10 probes change nothing on screen, so E4 fails there whatever the feature
  does. In the 3 that do, 144 Hz shows the change one 144 Hz tick before 60 Hz (e.g. 555,556 us
  vs 567,423 us), as R4 intends. Proposed: each of the 10 points becomes the first sync point at
  or after it where the flip changes the 60 Hz picture within 40 frames (still 10 TAS scenes,
  spread evenly). Or: probe A or B too; or leave pause frames out of the probe points.
- Default taken meanwhile: none possible (it is `phase.py`'s probe selection). Everything else of
  E4 is built and passes on the TAS (whole frames = P7's, on time, 96.2% of sprites interpolated,
  render p99 1.8 ms at 144 Hz); E4 stays failing on the probes until you choose.
- Blocks only: E4 passing.
- Answer (the user, in the session, 2026-10-21): the proposal: each probe is the first gameplay sync
  point at or after its evenly spread point (before the next) where the flip changes the 60 Hz
  picture within 40 frames. Recorded in P6-enhance.md ("Changed 2026-10-21", the contract's E4);
  `phase.py 6` selects the probes so.

### 2026-10-21: the screen id of the player select after a death (P6 E5)
- Question: P6-enhance.md "The contract" defines a screen id as the running scene's name. The
  player select after a death runs under the *stage's* scene index (`PlayerSelect_RunScene`
  restores `g_SceneIndex` before `Cerebro_Run`), so by that definition it is the stage, and would
  have to be drawn wide like it. It looks meant only in 4:3 (drawn wide, the Cerebro frame ends in
  a black strip at the right). OK to treat any frame inside `Cerebro_Run` as the Cerebro screen it
  is (`CerebroScreen PlayerSelect`, 4:3)?
- Default taken meanwhile: yes. `Cerebro_Run` tells the platform (`plat_ws_cerebro`, a native
  branch), the runner draws it 4:3 and reports it as `CerebroScreen PlayerSelect`; the doc is
  unchanged (XMen2Recomp commit "P6 E5: 16:9 ..."; reverting is that branch and two lines in
  `platform/native/widescreen.cpp`).
- Blocks only: nothing (E5 is measured either way; with "no", the death select is drawn wide).
- Answer (the user, in the session, 2026-10-21): yes, the Cerebro screen, 4:3 (the default stays).
  The contract's screen id now says so (P6-enhance.md "Changed 2026-10-21").

### 2026-10-21: play the native port (P5 P8)
- Question: play the port that has no 68000 left (XMen2Recomp 1106d9d or later). It is the
  frame-synchronous machine D8 played (R5), now with its own memory, machine and player. Any of:
  - Windows: unzip `..\XMen2Recomp\build\package\xmen2-native-windows.zip` (made by
    `phase.py 5` / `uv run tools/xmen2check.py package`), run `XMen2.exe path\to\xmen2.bin`.
  - Linux: pull XMen2Recomp, `sudo apt install libsdl2-dev pkg-config ninja-build`
    once, then `uv run tools/xmen2check.py native-build` and `build/XMen2Native path/to/xmen2.bin`
    (or the zip `build\package\xmen2-native-linux.zip` from this machine: `./xmen2 path/to/xmen2.bin`).
  - Keys: arrows; Z/X/C = A/B/C, Enter = Start, A/S/D = X/Y/Z, Q = Mode; controllers work; F11
    fullscreen; Esc quits (README.txt in the zips).
  If it plays like the original, add `port-verified: DATE` to XMen2Recomp `docs/USER_VERIFIED.md`
  (or say so here). Anything off (picture, sound, input, speed), a line here is enough.
- Default taken meanwhile: none needed; every other criterion is worked meanwhile.
- Blocks only: P8 (its `port-verified` line), so `phase.py 5` exiting 0.
- Answer (the user, 2026-10-21): a quick test of the Windows package: "looks good". `port-verified: 2026-10-21` written to XMen2Recomp `docs/USER_VERIFIED.md`.

### 2026-10-21: phase 6 criteria and rulings (P6 E0)
- Question: approve [phases/P6-enhance.md](phases/P6-enhance.md) (criteria E0-E6, "Definitions")
  and rule on its points ("Rulings" there has the detail). Each line is the default. A word per
  line is enough ("ok", or the other option):
  - R1 options: each enhancement is a runtime option of the one release runner, off by default;
    every check against the original runs with all options off.
  - R2 sources: every byte match is kept; option code goes in native-only branches.
  - R3 two-player full rate: the step stays 1 and the extra waits go (60 Hz with two players).
  - R4 high frame rate: interpolate between the last two logic frames (one logic frame, 16.7 ms,
    of added latency); the HUD and palettes are not interpolated, and big jumps snap.
  - R5 widescreen: 16:9 first; title, menus, Cerebro, player select and cutscenes stay 4:3 with
    bars.
  - R6 widescreen gameplay: objects activate across the wide view (enemies appear earlier), with
    bars where a locked camera would show past a boss arena. Or keep the original activation
    (objects pop in at the margins, but it stays comparable to the original).
  - R7 widescreen planes: widen the game's own tile streaming; a renderer that draws the level from
    its map only if that can't work.
- Default taken meanwhile: none, nothing of phase 6 starts before phase 5 is complete and this
  is approved. If you want a head start, say "start phase 6" and a session works on these
  defaults, in commits that revert cleanly.
- Blocks only: E0, so all of phase 6.
- Answer: approved, with the rulings asked one by one in the session (the user, 2026-10-21): R1
  runtime options, R2 keep the byte matches, R3 as proposed, R5 16:9 first, R7 widen the
  streaming first; R6 "yes"; R4 "sure, if unavoidable" (it is avoided by timing: each logic
  frame runs when its input is read, and E4 measures the latency); non-gameplay screens "if
  there's no sensible way they'd display in widescreen then yes" (4:3, decided per screen).
  Recorded in P6-enhance.md (`approved: 2026-10-21`) and ROADMAP.md "Decisions on record".
  Phase 6 starts once phase 5 is complete.

### 2026-10-17: phase 5 criteria and rulings (P5 P0)
- Question: approve the revised [phases/P5-port.md](phases/P5-port.md) (criteria P0-P9,
  "Definitions") and rule on its points ("Rulings" there has the detail). Each line below is
  the default; a word per line is enough ("ok", or the other option):
  - R1 memory layout: (b) original layout in host byte order, stored pointers as 32-bit
    references (exact export, no masks), with (a) native pointers/allocator possible later.
  - R2 ROM data: the user's ROM loaded at start, read as a big-endian image; nothing ROM-derived
    shipped.
  - R3 video: the VDP model moves behind the platform layer as the renderer (like sound).
  - R4 MPW matching and `verify` stay regression gates through phase 5 (P2).
  - R5 the port's timing is the frame-synchronous machine D8 plays: no lag frames, H/V counter 0,
    the main program's VDP writes show a frame late (engine 22ed7f6's `fsync_render`).
  - R6 P0 gates: clean build < 5 min, full corpus check < 15 min, workers verify in their own
    build dir. #24 ("one runner at a time") stays for interactive runs only. Headless traces on
    private copies already ran 24 at once in phase 4.
  - R7 release platforms: **answered** in the session (the user, 2026-10-17): "Windows only is
    acceptable for a first pass... we'd want to eventually do Linux also but that can come at the
    end". P8 is the Windows release; Linux is the last criterion, P9 (WSL Ubuntu).
- Default taken meanwhile: the defaults of R1-R6. Every one keeps the most work valid: (b) is a
  prefix of (a), and retiring R4's gates later loses nothing done. Harness work (native target,
  exporter, object scan, worker gate, bench) is done under any answer. With R1 (a), P5's export
  needs masks, ruled on then.
- Blocks only: P0 passing (it also needs `approved: DATE` in P5-port.md, your word only); every
  later criterion is measured meanwhile with `phase.py 5 --draft`.
- Answer: approved, every ruling as proposed (the user, in the session, 2026-10-20, one by one): R1 (b)
  now, (a) possibly later; R2 read the user's ROM; R3 VDP model behind the platform; R4 keep both
  proofs; R5 accept; R6 approve as written. Recorded in P5-port.md (`approved: 2026-10-20`) and
  ROADMAP.md "Decisions on record".

### 2026-10-17: play the hand-C build (P4 D8)
- Question: play `build\Release\XMen2Stepped.exe game\xmen2.bin` in ..\XMen2Recomp (all hand C,
  live input; details in its CLAUDE.md "Phase 4"). If it plays like the original, add
  `handc-verified: DATE` to XMen2Recomp `docs/USER_VERIFIED.md` (or say so here).
- Default taken meanwhile: none needed; phase 5 P0 prep (LESSONS.md checklist) can start.
- Blocks only: P4 D8, so `phase.py 4` exiting 0.
- Answer: played on Linux to Avalon, plays fine (the user, 2026-10-17): `handc-verified: 2026-10-17`
  in XMen2Recomp `docs/USER_VERIFIED.md` (e162e5a, build 020dc0b, engine 22ed7f6). D2/D6 re-ran
  on that engine 2026-10-20: `phase.py 4` 9/9, phase 4 complete.

### 2026-10-17: keep AvalonB1_RunScene's CLEAR_COUNTER macro? (P4)
- Question: the function byte-matches only through `#define CLEAR_COUNTER(x) if (1) (x) = 0`
  (XMen2Recomp `game/c/00FDAA.c`). Keep the macro, or drop it and the match? Details in
  XMen2Recomp `docs/NOTES.md` "Open questions".
- Default taken meanwhile: keep the macro (it is what passes today).
- Blocks only: nothing.
- Answer: keep the macro (the user, asked in the phase-4 session, 2026-10-17). Nothing to change.
