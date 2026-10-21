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

### 2026-10-21: play the enhancements (P6 E6)
- Question: play the native port with the three options (XMen2Recomp 3b8503a or later; this can be
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
  If they play well, add `enhancements-verified: DATE` to XMen2Recomp `docs/USER_VERIFIED.md` (or
  say so here). Anything off (seams in the wide view, objects popping, judder at 144 Hz, flicker),
  a line here is enough; most useful with the stage and roughly where.
- Default taken meanwhile: none needed; the other criteria are worked meanwhile.
- Blocks only: E6 (its `enhancements-verified` line), so `phase.py 6` exiting 0.
- Answer:

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
- Answer:

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
- Answer:

### 2026-10-21: play the native port (P5 P8)
- Question: play the port that has no 68000 left (XMen2Recomp 78cb548 or later). It is the
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
- Answer:

### 2026-10-21: phase 7 criteria and rulings (P7 M0)
- Question: the same for [phases/P7-multiplayer.md](phases/P7-multiplayer.md) (M0-M6, rulings
  R1-R8). It is a draft to be revised at its kickoff with what phase 6 teaches, so this can wait
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
- Default taken meanwhile: none (phase 7 follows phase 6).
- Blocks only: M0, so all of phase 7.
- Answer:

## Answered

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
  in XMen2Recomp `docs/USER_VERIFIED.md` (cc2bfdf, build 731f5f6, engine 22ed7f6). D2/D6 re-ran
  on that engine 2026-10-20: `phase.py 4` 9/9, phase 4 complete.

### 2026-10-17: keep AvalonB1_RunScene's CLEAR_COUNTER macro? (P4)
- Question: the function byte-matches only through `#define CLEAR_COUNTER(x) if (1) (x) = 0`
  (XMen2Recomp `game/c/00FDAA.c`). Keep the macro, or drop it and the match? Details in
  XMen2Recomp `docs/NOTES.md` "Open questions".
- Default taken meanwhile: keep the macro (it is what passes today).
- Blocks only: nothing.
- Answer: keep the macro (the user, asked in the phase-4 session, 2026-10-17). Nothing to change.
