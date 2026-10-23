# Roadmap: disassembly to PC port

End goal: X-Men 2: Clone Wars as **readable, modifiable C that runs natively on PC**. Five
phases, each with a measured definition of done and a checker that exits 0 only when every
criterion passes, then two phases of enhancements on the finished port (6 and 7, decided by the
user 2026-10-21):

| Phase | Goal | Where the work lives | Criteria | Check |
|---|---|---|---|---|
| 1 | Byte-matching disassembly, everything named | this repo | [DONE.md](DONE.md) | `uv run tools/progress.py` |
| 2 | Static recompilation: native PC game, frame-identical to the emulator | new repo `XMen2Recomp` | [phases/P2-recomp.md](phases/P2-recomp.md) | `uv run tools/phase.py 2` |
| 3 | Identify the original compiler (or prove we can't) | this repo | [phases/P3-compiler.md](phases/P3-compiler.md) | `uv run tools/phase.py 3` |
| 4 | Decompilation: hand-written C replaces every generated function | `XMen2Recomp` | [phases/P4-decomp.md](phases/P4-decomp.md) | `uv run tools/phase.py 4` |
| 5 | Port: native memory and platform layer, no 68000 left | `XMen2Recomp` | [phases/P5-port.md](phases/P5-port.md) | `uv run tools/phase.py 5` |
| 6 | Enhancements: full frame rate in two-player, high frame rate, true widescreen | `XMen2Recomp` | [phases/P6-enhance.md](phases/P6-enhance.md) | `uv run tools/phase.py 6` |
| 7 | Online play and four players | `XMen2Recomp` | [phases/P7-multiplayer.md](phases/P7-multiplayer.md) | `uv run tools/phase.py 7` |

Status: phase 1 complete (2026-10-14); phase 3 complete (2026-10-15: MPW C 3.3, policy
`matching-for-unexecuted`, [COMPILER.md](COMPILER.md)); phases 2 and 4 complete (2026-10-15,
2026-10-20); phase 5 complete, 10/10 (2026-10-21: every measured criterion passes; P8 the user played the
Windows package, "looks good"); phase 6 at 5/7 (2026-10-21, started on the user's word
before phase 5's playtest: the three options built; E4's latency probe ruled, to re-measure; E6
waits for the user's playtest in QUESTIONS.md); phase 7 approved (2026-10-21, M0 with rulings
R1-R10 after the kickoff's measurements, [phases/P7-kickoff.md](phases/P7-kickoff.md)), 1/7, ready
to run autonomously (`/multiplayer-batch`). `uv run tools/phase.py status` prints the last
recorded result of every phase (from `docs/progress/`).

## Why this order

- **Recomp first** because it is the verifier for everything after it. The original
  compiler is unknown, so hand-written C can't be checked by recompiling to identical bytes;
  it is checked by running the game against the emulator frame by frame. Phase 2 builds and
  proves that harness, and gives a whole, working native game to replace piece by piece.
- **Compiler identification (3) does not depend on 2.** It works on the ROM and old Mac
  toolchains only, so it can run in parallel with phase 2 (a separate session). It must
  finish before phase 4, because its verdict sets phase 4's verification policy: functions
  the corpus never executes (22% of instructions) can only be checked by a matching compile
  or by differential tests against their recompiled version.
- **Decomp (4) inside the recomp**: each function is replaced in the running game, leaves
  first. Each one is verified against its generated version (shadow differential test) or by
  an MPW C byte match. The whole game is compared with the emulator at logical frames ("sync
  points"), because C has no instruction timing. C at this stage still works on the emulated
  68000 RAM layout, because generated code shares it until the last function goes.
- **Port (5) last**: once no generated code is left, game state moves to native structs and
  hardware access moves behind a platform layer. Equivalence is kept checkable by exporting
  native state back to the 68000 RAM image the reference compares.

Phases 4 and 5 are **drafts**: each starts with a kickoff criterion (`D0`/`P0`) where the
agent revises the criteria with what phases 2-3 taught and the user approves them. Phase 4's
revision was approved 2026-10-15. Phase 5's was revised 2026-10-17 (P0-P9) and approved 2026-10-20 with rulings R1-R7.
Phases 6 and 7 were drafted 2026-10-21 (E0-E6, M0-M6), and phase 6 was approved the same day
with rulings R1-R7; phase 7 on the same day after its kickoff measurements, with rulings R1-R10.
Each approved phase's measurements are written into `phase.py` before its work starts (its doc's
"The contract").

Every enhancement is an **option** that is off by default. With every option off, the port is
still the proven one: phase 6's E1 and phase 7's M1 rerun phase 5's measurements. So the original
stays the regression gate, and each option is checked by its own measurements.

## Working a phase autonomously

"Work through phase N until it's done" means, from a session started in this repo:

1. `uv run tools/setup.py`, then read this file, the phase's criteria doc, and the phase's
   notes (phase 2+ keep their notes in the repo the work lives in; see each doc).
2. Loop until `uv run tools/phase.py N` exits 0:
   - take the **first failing criterion** in table order, work it in batches of ~5 items;
   - after each green batch: notes appended, `phase.py N` re-run (it rewrites
     `docs/progress/PN.md`), commit and push every repo you changed. Done means pushed.
   - stuck after a real attempt: record what was tried under "Open questions" in the
     phase's notes, move to the next item, return later.
3. When everything passes, report the phase complete. Criteria that need the user
   (`user-verified`, kickoff approvals) are never filled in by the agent.
4. **Never block on the user.** The user starts these runs and leaves; a question that waits for an
   answer stalls the run until he next looks (phase 2 sat 6.3 h on its playtest). So:
   - Ask nothing interactively (no AskUserQuestion, no turn that ends on a question). Add the
     question to [QUESTIONS.md](QUESTIONS.md) with the default being taken, push a notification
     if the tool exists, and continue on that default. Keep the default's work in its own
     commits so a different answer reverts cleanly. Choose the default that keeps the most work
     valid either way: the stricter reading, the reversible option.
   - Prepare a user-only gate (playtest build and command, an approval's exact wording) in
     QUESTIONS.md the moment it becomes possible, then go on to the next failing criterion, the
     next phase's harness prep, or the open speed-ups in [LESSONS.md](LESSONS.md). Stop only when
     nothing doable remains without an answer, and say so.
   - When the user is present at a session's start, ask every known ruling then, in one batch.
   - Read QUESTIONS.md at session start and apply any answers.
   - At a session limit, schedule a resume at the reset rather than waiting for "continue".

Same rules as phase 1: never weaken a check in `tools/phase.py` (or the contract tools it
calls) to make it pass; changing a criterion needs the user's approval, recorded in the
phase doc with the date.

## Decisions on record

- 2026-10-15 (user): phase 2 repo is a private GitHub repo `crabsmack/XMen2Recomp` at
  `..\XMen2Recomp`; the engine is pinned as a **fork** `crabsmack/segagenesisrecomp`
  (engine changes land there; upstream PRs only when the user chooses).
- 2026-10-15 (user): phase 3 may download archived copies of discontinued toolchains
  (THINK C, Symantec C++, CodeWarrior) as well as Apple's free MPW. Toolchains are never
  committed; they live outside the repos (see P3).
- 2026-10-15 (user): phase 4 criteria approved. The whole game is compared at sync points
  (untimed stepped runner with replay), one C source serves both MPW matching and the PC,
  partially executed functions may be verified by `verify` plus synthetic cases, and the user
  plays the hand-C build (D8). Details: P4-decomp.md.
- 2026-10-17 (user): phase 5 releases for Windows first; Linux comes at the end (P5-port.md R7, P9).
- 2026-10-20 (user): phase 5 criteria approved (P0-P9). R1 memory layout: the original layout in
  host byte order with 32-bit references (exact export), native pointers possibly later; R2 the
  user's ROM read at run time; R3 the VDP model as the renderer behind the platform layer; R4 MPW
  matching and `verify` stay regression gates; R5 the frame-synchronous timing; R6 the P0 speed
  gates, #24 for interactive runs only.
- 2026-10-21 (user): two more phases after the port. Phase 6 is full frame rate in two-player,
  high frame rate and true widescreen ([phases/P6-enhance.md](phases/P6-enhance.md)). Phase 7 is
  online play and four players ([phases/P7-multiplayer.md](phases/P7-multiplayer.md)). Both are
  drafts until the user approves them.
- 2026-10-21 (user): phase 6 criteria approved (E0-E6). R1 runtime options, off by default; R2
  every byte match kept, with option code in native-only branches; R3 two players at the
  one-player stepping; R4 interpolated high frame rate with latency only if unavoidable (avoided
  by timing, measured by E4); R5 16:9 first, with non-gameplay screens 4:3 unless they have a
  sensible wide presentation; R6 objects activate across the wide view; R7 widen the game's
  streaming first. The same day E5 dropped its "activation margin 0 equals the reference"
  clause, which R7's streaming makes impossible (the user's choice). "The contract" then fixed
  how `phase.py 6` measures each criterion, before any work.
- 2026-10-21 (user): phase 6's E4 latency probes move to the first point after each spread point
  where the flip shows at 60 Hz; the select after a death is the Cerebro screen (4:3) for E5.
- 2026-10-21 (user): phase 7 criteria approved (M0-M6), after the kickoff measured netplay
  readiness, the characters' video and the music ([phases/P7-kickoff.md](phases/P7-kickoff.md)).
  R1 the engine's `recomp-net`/`rbengine` with XMen2Native's own glue; R2 in-process savestates
  (the game on a fiber), not offered to players; R3 savestates, two online, four local, four
  online; R4 byte matches kept (cost measured after 20 files); R5 players 3-4 in a native region;
  R6 with three or more players extra VRAM and sprites with no per-line limits, palettes unchanged;
  R6a HUD panels 3-4 built from the ROM's tiles at run time; R7 the two-player rules extended; R8
  LAN/IP, then relay and ICE, no lobby server; R9 a second sound machine for players 3-4's music
  parts; R10 online the host's game options (widescreen included) and seed apply to everyone,
  `high_fps` stays each player's (a later presentation-only 16:9 would be local). Online play runs
  the "session machine" and peers compare a canonical digest (MSVC and GCC lay structs out
  differently).
- 2026-10-22 (user): phase 6 R8, two widescreen modes. `widescreen=16:9` alone is presentation
  only and the default: the game plays as in 4:3 (original activation, camera limits and logic),
  with a render camera keeping the 400-px window inside the level instead of bars at its edges;
  `widescreen_gameplay=1` is R6's mode. E2 lists the setting; E5 runs both modes and, presentation
  only, compares the game's state with the 4:3 run (`--game-rows`). Online both stay the host's
  until phase 7 makes the view local (the digest would have to leave the view's state out).
- 2026-10-23 (user): phase 7 R12, the presentation-only 16:9 view is each seat's own online (F10
  works); with the host's `widescreen_gameplay=1` it stays sealed. The canonical digest's
  definition leaves the picture's state out; M3 adds a sealed-gameplay session and an F10 session.
