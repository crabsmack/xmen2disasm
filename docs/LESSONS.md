# Lessons from phases 0-4 (retrospective, 2026-10-17)

**Read this at every phase kickoff (P0) and before starting a parallel round.** The
[kickoff checklist](#kickoff-checklist-phase-5-p0) is the part to act on; the rest is the
evidence behind it. The cross-game version (for the next game) is at the
end.

Sources:
- The user's outside monitor during phase 4.
- A measured read of every session transcript: phase 4's main session plus its 55 workers, and the phase 0-3 sessions.
- The git logs of xmen2disasm, XMen2Recomp and the engine fork.

Times are UTC; durations are wall clock.

## Where the time went

| Phase | Active work | Waiting | Largest sinks |
|---|---|---|---|
| 0 setup (10-14 23:15 → 10-15 00:41) | 1.4 h | ~0 | first corpus 19 min; ~10 min on upstream gpgx, which desyncs the TAS, before switching to BizHawk 2.4 |
| 1 naming, 16 workers (→ 03:28, 16/16) | 2.8 h | 0.8 h on workers | `corpus.py --force` 26 + 31 min; main broken twice by stale names after rebases |
| 3 compiler ID (04:40 → 05:37) | 0.95 h | 17 min | about half went to getting toolchains (downloads, WSL, Go/mps) |
| 2 recomp (04:39 → 07:25 for 9/10; 10/10 at 14:42) | 2.8 h | 6.3 h for the playtest | corpus regeneration 25 min; first-divergence loop ~80 min; `phase.py 2` 52 + 53 min |
| 4 decomp (10-15 16:24 → 10-17 06:36) | ~14 h main | ~24 h | see below |

Phase 4 in one line: workers wrote all 3,161 C functions in about 12 h (by 10-16 06:12); proving
them correct took the next 24 h. From 07:40 that day until 04:18 the next day, at most one
worker was running, and the main session debugged serially behind slow builds and checks.

Phase 4 wall time:
- main session active ~14 h
- waiting on builds with nothing else running 9.9 h
- waiting on `phase.py`/verify ~7 h
- session-limit stalls 2.5 h (both resumed exactly at the quota reset)
- waiting on the user ~1.3 h
- bisects 0.5 h

## Kickoff checklist (phase 5 P0)

Do these before the first work item. Propose the measurable ones to the user as **P0 exit
criteria**, so the harness is fast before any real work depends on it.

**Never block on the user (applies to everything below).** The user starts these runs and leaves for
hours. Anything that waits for him stalls the run until he happens to look:
- phase 2 waited 6.3 h on its playtest
- phase 4 waited ~1.3 h on the user, and its two session-limit stalls (2.5 h) only resumed on a manual "continue"
- five rulings (decisions 9-13) were held and asked at the very end

The protocol (ROADMAP.md "Working a phase autonomously", step 4):
- Ask nothing interactively. Queue the question in [QUESTIONS.md](QUESTIONS.md) with the
  default being taken, notify if the tool exists, and continue on the default in separate commits.
- Prepare user-only gates (playtest, approvals) there as soon as they're possible, then keep
  working on whatever else is open.
- Ask the known rulings in one batch at a session's start, while the user is still there.
- Schedule a resume at the quota reset.
- So "get rulings at P0" below means *raise* them at P0. Work never waits on the answer.

**Harness speed (gates: clean build < 5 min, full corpus check < 15 min, measured):**
1. **Time a clean full build and watch the `cl.exe` count.** `/MP` was in the vcxproj all through phase 4 and did nothing.
   - Cause: per-file `COMPILE_DEFINITIONS` stop MSBuild from batching files into one `cl` call.
   - It cost 9-10 h: eight builds of 59-95 min, at ~76 files/min.
   - The fix (XMen2Recomp 3c87909): one generated wrapper per file, all with one command line. A full rebuild now takes ~1.5 min (33 `cl.exe`, 100% CPU).
   - Never use per-source flags in a big MSBuild target; Ninja avoids the problem entirely.
2. **Savestates at fuzz branch points, on both sides.**
   - Neither the BizHawk 2.4 core (`emu/xmen2emu.py:6,242`: "biz core has no savestates") nor the recomp runner can start from a savestate.
   - So every fuzz run replays the TAS from frame 0: 62 runs × (N + 3,600) ≈ 2.0M frames, of which ~0.22M are fuzzed. That is ~85% of verify frames, and most of each 25-30 min corpus generation.
   - Fix: runner-native states every 1,800 TAS frames (`runner/local_states.c` exists). For the reference core, a snapshot of the DLL's data/bss (the waterbox approach; not yet tried).
   - Prove once that a run from a state equals the same run from frame 0.
   - Open: whether hand-C/native mode can snapshot the game fiber's C stack. If not, take the states at frame boundaries in a mode that can.
   - Expected: full verify ~15 → ~3-4 min. The long pole is the TAS (~57k frames at ~290 fps per job).
3. **Parallel everything, longest job first, sized to the 32 threads.**
   - Already applied: `verify --jobs 24` (d3655ba), `PHASE_JOBS` 24 (e866953).
   - **Still serial: `tools/pccheck.py`** (XMen2Recomp). It writes one `.bat` with 3,161 `cl` calls in sequence: 27 runs for 138 min of main-session blocking, growing from 2 to 9.5 min per run. A 32-thread pool should bring it under 30 s.
   - `emu/corpus.py` is also serial.
4. **Trace and result caches keyed on content hashes** (exe, input, reference CSV), shared through the git common dir rather than per-worktree `build/`. Wrong keys cost ~3.5 h:
   - `Traces.rev` is `HEAD:engine`, or None when the tree is dirty. Writing `USER_VERIFIED.md` re-traced all 76 runs (107 min).
   - A worker's compile relinked the timed runner and redid D1 (~85 min).
   - Each new worktree started cold (54 min).
5. **`phase.py` fails fast and talks.** Run the newest-risk stages first and the long-passing D1 last. Log each stage as it finishes; the log stayed empty until the end. Run it against a committed snapshot in its own worktree, never against a tree workers are editing:
   - a half-written worker file broke a 23-min build
   - one 3 h run returned D2 0/76 from a bug a 1-minute stepped TAS replay would have shown
   - of 8 phase-4 runs, ~6 h were killed, hung or unusable
6. **Verify exits non-zero when a run's testing stops early or coverage drops.** Two full verifies (~1.5 h) kept going after a fatal stopped testing: one checked only 498 functions, another 416.
7. **Turn off MSVC identical-code folding (`/OPT:NOICF`) from day one.** Folding merged functions, which broke function-address identity (`fn_value` stops).
8. **Superset trace schema, versioned.** In phases 1-2 the per-run record grew three times (reader map, DMA destinations, VDP/Z80 CRCs), and each time the whole corpus was regenerated (~82 min plus core rebuilds). `corpus.py` should rerun only runs whose schema is stale.
9. **Headless verify mode.** Runners open a D3D11 window and keep 60 rewind snapshots. Small gain, not measured.

**Day-one debugging features** (phase 4 added each one late, after it had cost cycles):
- a crash report that names the C function and its call chain (added 10-17 03:13; the last two crashes then needed no bisect)
- call68 naming its target
- interrupt hold during the C run
- `noreturn`/`vector` tags
- coverage probes
- synthetic cases with ROM mutation and nesting
- `poke N` and per-port hardware supplies (added 05:56 on the last morning)
- case path traces (`XMEN2_VERIFY_TRACE_CASE`)
- a log-and-continue mode for null reads that reports every site in one run

On null reads: phase 4 found six null dereferences one verify cycle at a time (about 10 sequential cycles, 3-4 h). They were Obj_UpdateBoxes, Spr_Draw, Boulder_Init, WallCrawlBio_Move, Player_IsClimber and CloneA2_StartCamera, each a read the 68000 harmlessly takes from the ROM vector table at address 0. For phase 5, put the address-0 behaviour in the platform layer, not in scattered guards. The existing guards are listed in [P4-decomp.md](phases/P4-decomp.md) and found with `grep -n Vectors game/c/*.c game/include/xmen2_macros.h`.

**Criteria and human gates:**
- **Prove each criterion measurable on this target before the user approves it**, with a dry run or a citation of the code path. Examples that weren't:
  - R4 asked for scenarios the game doesn't have
  - S3's regex over-counted
  - the P2 doc assumed `on_frame_post` was called, and nothing called it
- **List the "can't be verified as defined" cases at P0 and get rulings then.** Phase 4 needed five at the very end (decisions 9-13: callee arg slots, listed unreachable instructions, dead features and interrupt-only paths, synthetic cases for never-created states, noreturn and vectors). Some had been recorded a day earlier and held back to ask in one batch. A 42-min matching worker became moot after decision 9. Queue each one in QUESTIONS.md when it is found, with the default being taken, while work continues.
- **Queue the playtest as soon as the build is playable**, and keep working. D8's build was playable from 10-17 01:11, but the playtest was only offered after D4. In phase 2 the session waited 6.3 h for it.
- Phase 5 specific:
  - Build the native-state → 68000-RAM projection first and prove it on the phase-4 C, before any struct is ported.
  - Generate the export from the one header source (`gen_headers.py`), so `diffstate` keeps naming bytes.
  - Decide whether MPW byte-match proofs (`cc.py`) retire once the layout goes native.

**Integration, workers and orchestration:**
- **Integrate continuously, not big-bang.** Phase-4 workers were told "Do NOT run tools/xmen2check.py build, trace or verify". XMen2Recomp's CLAUDE.md "One runner at a time (#24)" is a phase-2 rule. The per-batch gate was only pccheck plus the MPW match.
  - The first whole-game hand-C replay came at 10-16 09:30, and the first verify of all the C at 15:59, both after all C was written.
  - About 20 harness and C defects then surfaced one per cycle, with no workers left to absorb them.
  - Once builds take < 5 min, give each worker its own build dir and runner copy. Make a ~6,000-frame TAS replay plus verify part of every batch gate. Retire the one-runner rule (the user's call; it's in XMen2Recomp's CLAUDE.md).
- **Ship the batch tools workers otherwise write themselves.** Workers made 744 helper-file writes:
  - a match loop (`m.py`) in 26 of 41 workers
  - a prototype-line updater in 29
  - variant and permutation searchers in 30+
  - The sandbox also refused 126 shell loops over `$var`, and each refusal produced another wrapper.
  - Provide `tools/match.py ADDR...` (batch match + pccheck, a one-line verdict and differing-byte count per file, run in parallel), `setproto.py ADDR "decl"` (locked header edits) and `cc.py --variants SPEC` (compile alternative snippets in parallel, ranked by differing bytes).
- **Characterize the compiler once, up front.** Rules reached workers only at spawn, and were rediscovered:
  - argument pops in 31 reports
  - register-use ranking in 10
  - prologue order in 8
  - Nine rounds of appended skill rules gave **no throughput gain**: about 106 → 92 → 103 functions per hour, while the skill grew to 435 lines (310 of them "Learned").
  - The register allocator was modelled only on the last morning: priority = references, ×8 inside loops; register locals first; ties go to the later declaration. The model reproduced 4 real compiles exactly.
  - For a new compiler: one characterization worker with probe files, a regalloc predictor and a one-page rule card at kickoff.
- **Batches of 30-40 functions, or hand back and re-spawn at ~250K context.**
  - Workers handled ~90 functions each and grew to a median ~500K-token context.
  - Latency after a tool result rose from 2.7 s (< 100K) to 8.4 s (400-500K). Time between C-file writes rose from 17 s to 49 s. This is confounded with harder late functions.
  - Ramp-up (~48K tokens, ~3 min) is cheap by comparison.
- **Route easy work cheaply.**
  - 36% of functions are under 0x40 bytes and match first try 93-97% of the time. Families are large: Init 117, GetSize 110, Nop* ~115, ClassInit 60, EmptyStub 28.
  - Generate the template families deterministically, and route functions under 0x40 bytes to a cheaper model. Keep the strongest model for functions over 0x80 bytes, which matched first try only 42-63% of the time.
  - Overall, 83.6% of functions matched on the first compile, and 3.7% needed more than 3 compiles (those used 20% of all compiles).
- **No shared-tree mutations while workers run.** Orchestrator `handoff.py`/`rename.py` runs in the shared worktree caused 115 spurious "$X is not a function start" results across 19 workers. Give cc.py a frozen names snapshot per batch, and do renames and handoff only at batch boundaries.
- **Split monolithic headers.**
  - Workers hit 51 "modified since read" conflicts: 41 on `xmen2_types.h`, 10 on `xmen2_funcs.h`.
  - Retyped prototypes broke callers others had already committed (Cam_TrackPlayer, XPlayer_Update, 37 files at 10-16 01:31).
  - A concurrent duplicate SprFrame/SprDef forced a batch re-match.
  - `xmen2_types.h` was read 10-47 times per worker; shared headers were 25% of all tool-result text.
  - Fix: per-module headers (generated or concatenated), prototypes owned by one generator, and exact line ranges in worker prompts.
- **Name unknown globals before a batch.** 20 of 41 worker reports listed functions that differed only by an unnamed `-$XXXX(a5)` global, which a worker can't fix. Scan a batch's asm for them first.
- **Move routine integration off the orchestrator.** After the writing ended, the main session was the bottleneck: 79 commits and pushes, 27 pccheck runs, 17 submodule fetch/checkouts (69 min including the pccheck runs inside them), and all build and verify work.

**Session, quota and tool friction:**
- **Session limits:** two stalls of 63 and 87 min, each needing a manual "continue". Seven workers sat and were resumed by SendMessage, and lost no work. Phase 4 used ~3.0B worker plus ~1.0B main context tokens; the limits hit at 3-4-worker peaks of 300-400M tokens/hour.
  - Pace concurrent workers to the plan quota.
  - Keep the orchestrator lean: logs to files and fewer polls (it averaged ~500K context per call).
  - Have something resume at the reset, such as a scheduled check-in, instead of waiting for the user.
- **The 2-hour background-task limit** killed a `phase.py` run, and PID waiters twice.
  - Run long checks detached, with a done-file the session waits on.
  - Don't use foreground `until`/`while tasklist` polling loops; they hit the 600 s tool timeout 11 times.
- **Worktree isolation versus a multi-repo phase:** 148 "isolated in the worktree" refusals (22 main, 126 workers). The phase-4 session was confined to the xmen2disasm worktree but worked mostly in XMen2Recomp and the engine, and could not fast-forward main at the end. Give a multi-repo phase a worktree per repo, or no isolation.
- **Shell:**
  - 59 PowerShell errors before the session switched to Bash (~10-16 01:00), including `$nladdr` expanded inside game.toml.
  - Workers' `python -` calls hung to the timeout 22 of 69 times.
  - Heredoc escaping broke code three times in phase 2.
  - Use Bash for POSIX-style commands and `.py` files for any real Python.
- **96 "not read yet" Edit failures after compactions** (22 main, 74 workers). Re-read before editing after any context reset.
- **Artifacts outside the repos.** `emu/runs` exists only in the main checkout, so H2 fails in worktrees, and every `progress.py` run rewrites PROGRESS.md (`c8e9d4f` reverted exactly that). Keep runs, coverage, traces and caches in one directory set by an env var, and write progress files only with `--record`.
- **MPW "Unable to open the resource fork"** happened only in the orchestrator's parallel `--match-recomp` runs, never in workers. A tool error must never be cached as NO MATCH: 4 Tuskette functions were (fixed in 511c8f3). Per-job temp dirs are still open.
- Commit and push per batch. On 10-16 about 6 h of work (34 files) sat unpushed while sessions showed "idle".

## Phase 5 (2026-10-21, one session, ~3 h from P0-approved to 9/10)

What made it fast: the P0 harness (gate.py ~2-4 min a batch, a 76-run corpus in 3-7 min, cached
references) and phase 4's discipline (the C reaches memory only through header types). P3 and P4
were header changes plus 22 files; the native machine was ~700 lines adapted from the engine's
fsync mode; the host-byte-order arena (R1 (b)) changed no source: a per-byte store tag lets every
access stay exact while values sit in host order. Every step was proved on the whole corpus.

What cost time (about an hour of the three):
- **A gate that kills its other steps on a failure killed `mps` mid-compile** and the shared MPW
  compiler lost its resource fork; every later compile failed with a tool error. Restored from the
  MacBinary original; `cc.py` now runs a private copy of the compiler per job. Never let a harness
  kill a tool that writes into a shared toolchain.
- **Stale derived data in the main checkout.** Phase 4 ran in a worktree that was later removed;
  the main checkout's `build/recomp` handoff tables were from phase 1-2, so 129 matching files read
  NO MATCH, and the match cache kept those verdicts (it didn't key on the tables). Also the D1
  references (`*-recomp-sync`) and `inputs/` were gone. setup.py now refreshes the handoff; the
  cache keys on it. When a phase's worktree is removed, its build products go with it: rebuild
  them in the main checkout first.
- **`python -` starts Python 3.14's REPL** here and hangs to the timeout (twice). Scripts only.
- **CRLF worktrees** (core.autocrlf=true) change the MPW cache keys: set `core.autocrlf false`
  per worktree (`git config --worktree`) and re-check out before the first gate.
- **A stale `.git/index.lock`** in the main checkout (no git process alive) blocked pulls twice.
- **MSVC links a C and a C++ global of one name as two variables** (`g_snd_frame`); GCC refused.
  Build the port with the second compiler early.
- **Removing an XMen2Recomp worktree**: `git worktree remove` refuses a tree with submodules, and
  `git submodule deinit --all` there unsets the submodules in the config every worktree shares, so
  the main checkout shows them uninitialised: run `git submodule init` in the main checkout after.

## Phase 6 (2026-10-21, one session: E2-E5 built, E6 waiting for the playtest)

What worked: the contract written before the work (`phase.py 6` measured every piece the moment it
existed), counters read from the game's state through the 68000 view (independent of the C they
check), macros that are the original bound token for token under MPW (3,034 byte matches kept
through ~60 edited files), and a `phase.py` run against a snapshot worktree while development
went on (`XMEN2_RECOMP` = a second checkout; its submodules are directory junctions to the
main checkout's, `submodule.*.ignore all` in its worktree config; a full run takes ~50 min).

What the session learned:
- **The corpus covers less in the native machine than it looks.** The frame-synchronous machine
  (P5 R5) has no lag frames, so the TAS's input stops fitting in the first stage: the native TAS
  never leaves Siberia and keeps pausing; of 76 runs only two reach anything else (the attract
  demos). P1/P7 compare native with stepped-gen, the same machine, so they never showed it. Check
  what a run *reaches* (`ws.screens`), and test every stage with a start-scene switch and a
  walker input (`XMEN2_DEBUG_SCENE`, `tools/ws_warp.py --all`): that found three stages whose
  planes aren't their maps, which the corpus never showed.
- **A measurement that needs a visible reaction needs inputs that get one**: E4's latency probe
  flips C at evenly spread TAS points, mostly pause screens in the native TAS (queued for the user).
- **`cc.py` substitutes global names in the source text before MPW compiles**: a header macro
  must not expand to a global (MPW: "identifier not declared"); pass the globals as arguments.
- **`cmake --build --target XMen2Native` doesn't refresh the hand-C snapshot**: a game/c change
  needs `xmen2check.py build` (a warp test ran the old code once).
- **Shell slips cost time again**: `python -` hung three times despite the memory note (write a
  .py file, always); GNU sed turns `\n` in a replacement into a newline (broke C strings twice: use
  the Edit tool for anything with string literals); a stale `.git/index.lock` once more.
- **Contract wording vs `phase.py`**: E2's check reads `options[name]` while the contract nests the
  runner's report (adapted the tool, recorded); the screen id (a scene name) can't tell the player
  select after a death from its stage (queued for the user).

## For the next game (shared kit)

**Transfers directly:**
- Run the TAS on the emulator version it was recorded on, with recording-only patches (`emu/build_core.py`).
- The `frames.csv` CRC contract.
- `export_input.py` (6-button handling, X/Z swap).
- The engine fork's exact mode: per-line DMA, IRQ latency, MAME-order Z80, the YM timer grid, HV counter tables.
- The first-divergence tools (instruction traces with a register hash, Z80/YM logs, named state diff).
- A measured definition of done that is never weakened, the byte-identical gate, and the ROM-hygiene hooks.
- Everything in the kickoff checklist above.

**Doesn't transfer to hand-written asm:**
- A5 jump-table and LINK-heuristic discovery (`explore.py`, `split.py`, `m68k.py`'s jump-table helpers).
- `switches.py`, `classes.py`, `extend_thunks.py`.
- Phase 3 and `cc.py` (there is no compiler to match).
- MPW's one-file-per-function boundaries.
- Byte-match proofs for unexecuted code. Without them only differential or synthetic tests cover it, so measure the unexecuted fraction early and set the policy at kickoff.

**Reusable kit inventory:**

| Module | Verdict |
|---|---|
| `emu/build_core.py`, `bizcore/xm_biz.c`, `core/xm_trace.c` | generalize: BizHawk tag, patch anchors, add savestates |
| `emu/xmen2emu.py` | split into a generic harness (BizEmu, Recorder, bk2/script/fuzz) and a game config (ROM SHA, TAS, fuzz bias) |
| `corpus.py`, `export_input.py`, `cycle_trace.py`, `reg_probe.py`, `dump_state.py` | reuse; `corpus.py` needs a config, a pool and savestates |
| `build.py`, `guard.py` hooks, `setup.py` | reuse with a config |
| `rename`, `header`, `label_data`, `sublabel`, `symbolize`, `fix_stale`, `peek`, `coverage`, `datamap`, `dataitems`, `decomp.py` | generalize: drop the A5 assumptions; absolute RAM globals |
| `explore.py`, `split.py`, `m68k.py`, `xref.py` | generalize: the discovery seeds are MPW-specific |
| `autolabel.py` rules, `switches.py`, `classes.py`, `extend_thunks.py`, `cc*.py`, `mpwobj.py` | game- or compiler-specific |
| `progress.py`, `phase.py` | the runner, `Traces` and the contract are reusable; the criteria are per game |
| Recomp: `xmen2check.py` contract, `sync_disasm.py`, `compare`, `diffstate`, `ctrace_diff`, `ztrace_diff`, `xloop`, `cycle_census` | reuse (rename) |
| Engine fork: exact mode, `PADS` input, the `on_frame_post` call, interpreter counters | reuse as is; move off the core fork's `xmen2` branch |
| Skills: first-divergence, find-code, disasm-function, review-names | generalize the wording |
