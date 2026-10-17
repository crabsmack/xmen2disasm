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

### 2026-10-17: play the hand-C build (P4 D8)
- Question: play `build\Release\XMen2Stepped.exe game\xmen2.bin` in ..\XMen2Recomp (all hand C,
  live input; details in its CLAUDE.md "Phase 4"). If it plays like the original, add
  `handc-verified: DATE` to XMen2Recomp `docs/USER_VERIFIED.md` (or say so here).
- Default taken meanwhile: none needed; phase 5 P0 prep (LESSONS.md checklist) can start.
- Blocks only: P4 D8, so `phase.py 4` exiting 0.
- Answer:

### 2026-10-17: keep AvalonB1_RunScene's CLEAR_COUNTER macro? (P4)
- Question: the function byte-matches only through `#define CLEAR_COUNTER(x) if (1) (x) = 0`
  (XMen2Recomp `game/c/00FDAA.c`). Keep the macro, or drop it and the match? Details in
  XMen2Recomp `docs/NOTES.md` "Open questions".
- Default taken meanwhile: keep the macro (it is what passes today).
- Blocks only: nothing.
- Answer:

### 2026-10-17: phase 5 P0 kickoff rulings (P5 P0)
- Question: approve the P0 exit criteria proposed from LESSONS.md (clean build < 5 min, full
  corpus check < 15 min, workers verify in their own build dir), and retire XMen2Recomp's
  "One runner at a time (#24)" rule once workers have their own build dir and runner copy?
- Default taken meanwhile: harness speed work (savestates, parallel pccheck/corpus, fail-fast
  phase.py) proceeds, since it's needed under any criteria; the one-runner rule stays until answered.
- Blocks only: P5 P0 counting as passed, and per-worker verify.
- Answer:

## Answered

(none yet)
