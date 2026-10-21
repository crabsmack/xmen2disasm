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

## Answered

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
