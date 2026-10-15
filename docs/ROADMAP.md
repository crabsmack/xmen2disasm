# Roadmap: disassembly to PC port

End goal: X-Men 2: Clone Wars as **readable, modifiable C that runs natively on PC**. Five
phases, each with a measured definition of done and a checker that exits 0 only when every
criterion passes:

| Phase | Goal | Where the work lives | Criteria | Check |
|---|---|---|---|---|
| 1 | Byte-matching disassembly, everything named | this repo | [DONE.md](DONE.md) | `uv run tools/progress.py` |
| 2 | Static recompilation: native PC game, frame-identical to the emulator | new repo `XMen2Recomp` | [phases/P2-recomp.md](phases/P2-recomp.md) | `uv run tools/phase.py 2` |
| 3 | Identify the original compiler (or prove we can't) | this repo | [phases/P3-compiler.md](phases/P3-compiler.md) | `uv run tools/phase.py 3` |
| 4 | Decompilation: hand-written C replaces every generated function | `XMen2Recomp` | [phases/P4-decomp.md](phases/P4-decomp.md) (draft) | `uv run tools/phase.py 4` |
| 5 | Port: native memory and platform layer, no 68000 left | `XMen2Recomp` | [phases/P5-port.md](phases/P5-port.md) (draft) | `uv run tools/phase.py 5` |

Status: phase 1 complete (2026-10-14); phase 3 complete (2026-10-15: MPW C 3.3, policy
`matching-for-unexecuted`, [COMPILER.md](COMPILER.md)). `uv run tools/phase.py status` prints the last
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
  first, and verified the same way the recomp was. C at this stage still works on the
  emulated 68000 RAM layout, because generated code shares it until the last function goes.
- **Port (5) last**: once no generated code is left, game state moves to native structs and
  hardware access moves behind a platform layer. Equivalence is kept checkable by exporting
  native state back to the 68000 RAM image the reference compares.

Phases 4 and 5 are **drafts**: each starts with a kickoff criterion (`D0`/`P0`) where the
agent revises the criteria with what phases 2-3 taught and the user approves them.

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
   (`user-verified`, kickoff approvals) are the agent's cue to stop and ask, never to fill
   in itself.

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
