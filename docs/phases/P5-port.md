# Phase 5: PC port (definition of done, DRAFT)

**Status: draft, revised 2026-10-17 at P0 for the user's approval** (with what phase 4 taught and
[LESSONS.md](../LESSONS.md) "Kickoff checklist"). Nothing below counts until the user approves it
(P0). The rulings it needs are under "Rulings", each with the default the loop takes meanwhile;
they are queued in [QUESTIONS.md](../QUESTIONS.md). `uv run tools/phase.py 5 --draft` measures
every criterion past the unapproved P0 (it never exits 0).

Goal: the game's C runs on **native memory and a platform layer**: no 68000 CPU, registers,
68000 stack, generated code or emulated work RAM; game state in native storage; hardware (video,
input, sound) behind a small C API. Behaviour stays provably equal to the original by
**exporting** native state to the 68000 RAM/VRAM/CRAM/VSRAM image the phase-4 references compare.

Checked by `uv run tools/phase.py 5` (writes `docs/progress/P5.md`). Requires phase 4 complete.
D8 was recorded 2026-10-17 (the user played the hand-C build on Linux, to Avalon). D2/D6 still
need their re-run on engine 22ed7f6, whose frame-synchronous mode now renders a frame and gives the
Z80 its V-int (sound). Phase 5 work proceeds meanwhile.

## What phase 4 changed in this plan

1. **All game code is hand C, one source per function** (3,621 functions, `game/c/<ADDR>.c`):
   MPW C 3.3 byte-matches 3,034 of them, shadow tests (`verify`) prove the rest, and the
   frame-synchronous stepped runner with only hand C equals the same runner with all generated
   code at every sync point of all 76 corpus runs (D6). The C never names a register or a byte
   offset (D5 lint), so it reaches memory only through the types of `xmen2_mem.h`. **The layout
   can therefore change in the headers, for all code at once**, and the sources only where they
   depend on layout.
2. **Sync points carry over unchanged.** Native code has no instruction timing, so phase 5 compares
   at phase 4's sync points against the same reference, `trace --mode stepped-gen`, with the same
   D1 replay inputs (P4-decomp.md "Definitions"). The port's machine is the frame-synchronous
   runner's (decision 5): one logic step per displayed frame, the V-int taken at each sync point.
   That is the build the user is playtesting for D8.
3. **What is still 68000 in the all-C build** (counted in `game/c`, 2026-10-17):
   - Calls: every call through a stored function pointer (`fnp`, `AnyFn`: state functions, class
     methods, hooks) goes through `xm::call68` onto the emulated 68000 stack and back into C through
     a slot entry. 9 files reserve 68000 stack for locals whose addresses escape (`sp_reserve`: 18
     uses). 11 files read or write SR (`CPU_GetSR/SetSR`, 27 uses), 11 read A7 (`CPU_GetSP`). The
     93 asm functions keep register conventions through `game/runtime/asm_conv.cpp`.
   - Memory: all 549 globals are `XM_G` macros over emulated RAM. Stored pointers are 68000
     addresses (`PTR(T)`, 1,435 uses in 713 files), and the original stores both alias forms
     (`$00FFxxxx` and `$FFFFxxxx`) of RAM pointers, sometimes to the same target (phase-4 TAS
     RAM scan). 53 uses of `AT68`/`ADDR68` turn numbers into pointers and back. The heap is
     `Mem_StackAlloc`, a bump allocator from `$FF0000` (`g_HeapTop`).
   - ROM data: 1,194 data names (`xmen2_data.h`, `xm::rom`) plus `CLASS()` (534 uses) and
     `CODEPTR()` (1,324); ROM structs are big-endian and use the same struct types as RAM ones.
   - Hardware: 51 files name VDP ports (236 uses), 13 the Z80 bus/RAM (37), 3 the pads (25), 1
     TMSS/PSG. All go through `m68k_read*/write*` onto the engine's bus.
   - The frame-synchronous runner takes no H-int and reads the H/V counter as 0. The game's only
     H-int handler (`Irq_HBlank`) counts and switches H-ints off; no raster effect was found.
     Since engine 22ed7f6 it renders the whole frame right after the V-int at each sync point
     (`fsync_render`), so the main program's VDP writes show a frame late. Its Z80 takes the
     V-int that paces the sound driver; the old model left the driver silent, and the D2/D6
     references made with it are stale.
   - The game has no save feature (no SRAM, no password code), so the platform layer has no saves.
   - The C already builds and plays on Linux (GCC 13 for D8; `long` is mapped to 32 bits on LP64
     in `xmen2_mem.h`, `be(T)` is explicit). This machine's WSL Ubuntu has GCC 15 and cmake
     4.2, and lacks SDL2 (`libsdl2-dev`, `pkg-config`).
4. **An export of native layout to the exact RAM image is not decidable as the draft defined it.**
   Byte-equal RAM needs each object's original address, the alias form of every stored pointer,
   and the stale bytes the original leaves in reused heap and unwritten fields. A native layout
   (host pointers, host-size structs) keeps none of these. Ruling R1 below picks the layout. The
   default keeps the export exact.
5. **The harness is the schedule.** Phase 4 spent ~17 h waiting on builds and checks
   (LESSONS.md). P0 therefore includes measured speed gates, and the per-batch worker gate is a tool
   (`tools/gate.py`), not advice.

## Rulings (asked at P0; the loop works on the defaults meanwhile, in separate commits)

- **R1 Memory layout of the port.** (a) *Native layout*: host pointers, host-size structs, C
  globals, the game's allocator over a host arena; the export then needs each object's original
  address and masks (stale heap, unwritten fields, pointer alias forms), which need their own
  rulings. (b) *Original layout in host byte order*: RAM state lives in a native arena laid out as
  the 68000's (same sizes and offsets), with fields in host byte order and stored pointers as 32-bit
  references holding the original value. The export is a generated per-field byte swap: exact, no
  masks. **Default (b).** Everything (b) needs is also needed by (a): host-order access, the ROM/RAM
  type split, layout-dependent sites, native calls and the platform layer. So (a) stays possible as
  a later step, with its masks ruled on then.
- **R2 ROM data.** **Default:** the user's ROM is loaded at start (SHA-1 checked) and stays a
  big-endian image that the C reads through accessor types. No ROM-derived data is shipped (P8
  scans the package). Alternative: extract the assets into native formats at install time.
- **R3 Video.** **Default:** the VDP model (VRAM/CRAM/VSRAM, registers, DMA, the line renderer)
  moves behind the platform layer as the renderer, the way the sound driver stays emulated. The C
  keeps issuing VDP commands through the platform API. Alternative: a new high-level renderer (much
  more work; P7 would still compare framebuffers).
- **R4 Phase 4's proofs stay regression gates.** **Default:** every source keeps compiling in all
  three modes (MPW, emulated PC, native). Every file that byte-matched at the end of phase 4 still
  matches, and `verify` still proves the rest (P2). Alternative: retire MPW matching and `verify` once
  the layout goes native. That frees the sources, but then only P1 checks behaviour.
- **R5 The port's timing is the frame-synchronous machine** (decision 5): no lag frames where
  the original lagged, the two-player half-rate wait takes a frame, the H/V counter reads 0, no
  mid-frame H-int, the main program's VDP writes show a frame late. **Default:** accept; it is
  what D8 plays. (D8 noted chugging in the Sentinel escape on a slower Linux PC, not investigated.
  Measuring frame time per scene before P8 is a work item, not a criterion.)
- **R7 Release platforms. Ruled by the user 2026-10-17:** "Windows only is acceptable for a
  first pass... we'd want to eventually do Linux also but that can come at the end." So P8 is
  the Windows release, and Linux is the last criterion (P9). The Linux build is made and checked
  in this machine's WSL Ubuntu, which needs `sudo apt install libsdl2-dev pkg-config` once; the
  loop does that when it reaches P9. Until then nothing gates on Linux. The LP64 rules already in
  `xmen2_mem.h` stay, so the code doesn't drift far.
- **R6 P0 exit gates and per-worker verification** (raised 2026-10-17 in QUESTIONS.md): clean
  build < 5 min, full corpus check < 15 min, workers verify in their own build dir; retire
  XMen2Recomp's "One runner at a time (#24)" rule. That rule is the engine's interactive one (relaunching on
  the debug port). Headless traces on private runner copies already ran 24 at a time in phase 4.
  **Default:** the gates as written; #24 stays for interactive runs only.

## Criteria

| ID | Criterion | Check |
|---|---|---|
| P0 | Criteria approved, harness fast | this file has a line `approved: YYYY-MM-DD` (user's word only) and the capitalised draft marker is gone from the title; and `XMen2Recomp/docs/bench.json` (`tools/bench.py`) shows all three gates passing: clean build of all runners < 5 min, full corpus check (the corpus traces P1 runs plus `verify`) < 15 min, two builds in two build dirs at once succeed |
| P1 | Equivalence through export | `xmen2check.py trace --mode native --replay REFDIR` (the native target; its sync rows come only from the exporter's image) equals `trace --mode stepped-gen --replay REFDIR` at every sync point of the TAS and every corpus run, with 0 misses, 0 interpreter instructions and 0 stub hits. It passes from the start, while all state is still in emulated RAM, which proves the target and the exporter. After that it is the regression gate |
| P2 | Still the original | phase 4's D4 ledger computed on the phase-5 sources (`build/phase5_functions.json`): 3,621/3,621 functions in C, documented, lint-clean and verified (byte match via `cc.py --match-recomp`, or `verify` with ≥1 checked call, 0 mismatches and 0 uncovered instructions, under decisions 7-13; decision 12's whole-game functions by P1) (R4) |
| P3 | No 68000 calls | `xmen2check.py build --native --json`: 0 `cpu68` symbols in the game objects (no register, 68000 stack or slot access: stored function pointers call C directly; SR becomes the platform's interrupt mask) |
| P4 | Platform layer | `build --native`: 0 `bus` symbols in the game objects, and 0 hardware addresses (`0x` literals of `$A0xxxx`/`$A1xxxx` Z80, I/O and TMSS, `$C000xx` VDP/PSG; comments not counted) in `game/c` and `game/include`; the hardware names and the API live in `platform/` |
| P5 | Native state | `build --native`: 0 `emu_ram` symbols in the game objects, and on every corpus run of P1 the exporter takes 0 bytes from emulated RAM (`copied_bytes` 0): all state is in native storage under R1's layout |
| P6 | No 68000 left | `build --native`: the native executable's link map defines no 68000 CPU state or core, interpreter, recomp runtime (dispatch, entry hooks, slot machinery), generated code or emulated work RAM (`link.forbidden` empty). The platform's video model, the Z80 with the YM2612/PSG and the ROM image may stay |
| P7 | Renderer | `trace --mode native --fb` and `trace --mode stepped-gen --fb` of the TAS give the same `fb_crc32` at every sync point (the frame drawn at the sync point after the V-int, as `fsync_render` does: the platform renderer against the engine's VDP renderer) |
| P8 | Release (Windows) | `xmen2check.py package --json` builds a Windows package that runs on the user's ROM (SHA-1 checked at start) and contains no ROM-derived data (no 256-byte window of any packaged file, other than runs of one byte value, occurs in the ROM); and `docs/USER_VERIFIED.md` has `port-verified: YYYY-MM-DD`, written only on the user's word after they played it |
| P9 | Linux (R7) | `xmen2check.py package --platform linux --json` builds the Linux package in WSL with the same ROM-free check, and its native runner's TAS trace there has the same sync rows as the stepped-gen reference (P1's comparison, on Linux) |

### Definitions (changing any of them needs the user's approval, recorded here)

- **Modes.** Each `game/c` file and `game/include` header compiles in three modes, switched in
  `xmen2_mem.h`: MPW (`applec`: byte matching), emulated PC (C++17 over the emulated 68000
  memory: the stepped, stepped-gen and verify runners) and **native** (`XMEN2_NATIVE`: the
  `XMen2Native` target). Layout and calls change in the native branch of the headers. A source
  changes only where its own code depends on layout, and then for all three modes (R4).
- **Native target** (`XMen2Native`): the frame-synchronous runner (P4-decomp.md "Definitions")
  built from the hand C in native mode, the platform layer and the exporter. Until P6 it may
  still link the engine's runtime around the C. It links no generated game code.
- **Export.** `game/runtime/export.cpp` writes the reference image at each sync point: the 64 KB
  of work RAM (`$FF0000-$FFFFFF`, 68000 layout, big-endian) and VRAM/CRAM/VSRAM from the video
  model. Every piece of state that has moved to native storage is serialized from its
  declaration, by a table generated from the headers (`tools/gen_headers.py`, so `diffstate`
  keeps naming bytes). Whatever is still in emulated RAM is copied and counted as `copied_bytes`.
  The sync row's CRCs are computed from this image exactly as P4-decomp.md defines them, stack area
  masked. Nothing else is masked under R1 (b).
- **Reference**: the run's `trace --mode stepped-gen --replay REFDIR` sync rows (as D2/D6), with
  REFDIR the run's D1 trace (timed runner == gpgx, `sync.csv`, replay log).
- **Object scan** (`build --native`): the undefined external symbols of each object file of the
  native target, from its COFF symbol table, in categories. `cpu68` covers the 68000's registers,
  stack and call convention (`g_cpu`, `xm::call_slots/sp_reserve/...`, `xm_slot_*`, `xm_reg*`,
  `CPU_*`, `x68k_*`, `recomp_*`, `g_xrts`). `emu_ram` is `g_ram`/`g_ram_ffff`. `bus` is
  `m68k_read*/write*`. `rom_image` (`g_rom`), `fnid` (`xm::fn_value/fn_host`) and `generated`
  (`func_*`) are reported. A **game object** is one compiled from a `game/c` file (its build
  wrapper maps back to it). The code a `game/include` header puts into it (inline functions,
  macros) counts as that object's, so a header fix shows in every file at once.
- **Platform layer** (`platform/`): plain C functions for video (VDP commands and DMA from game
  memory, R3), input (pads), sound (the Z80 bus and RAM, the PSG), the interrupt mask and the
  V-int, and the ROM image (R2). The hardware names (`VDP_DATA`, `IO_DATA(n)`, `Z80_BUSREQ`...)
  move here. Their MPW definitions keep the addresses, so matching is unchanged. Reads through a
  null reference (the 68000 reads the vector table at address 0: six such sites in phase 4)
  behave as on the 68000 in the memory layer, not through scattered guards.

## Where things live

| What | Where |
|---|---|
| Hand C, headers | `XMen2Recomp/game/c/`, `game/include/` (native branch of `xmen2_mem.h`) |
| Platform layer | `XMen2Recomp/platform/` |
| Exporter | `XMen2Recomp/game/runtime/export.cpp` + its generated table |
| Contract | `XMen2Recomp/tools/xmen2check.py` (extended, below); harness `tools/bench.py`, worker gate `tools/gate.py` |
| Queue | `uv run tools/port_queue.py` (this repo): the next files to port for the first failing criterion, from the object scan |
| Notes | `XMen2Recomp/docs/NOTES.md` "Phase 5" (findings, open questions, divergence log) |

## The contract (extends P4's)

```
xmen2check.py build --native --json
    # builds XMen2Native (with the other runners); {"ok", "exe", "map",
    #  "objects": {"game/c/ADDR.c": {"cpu68": N, "emu_ram": N, "bus": N, "rom_image": N, "fnid": N,
    #                                "generated": N, "symbols": {category: [names]}}, ...},
    #  "totals": {category: N, "files": {category: files with N > 0}},   # game/ objects only
    #  "link": {"forbidden": [{"symbol", "category", "object"}], "categories": {category: N}}}
xmen2check.py trace --mode native [--fb] --replay REFDIR --run R --input F --out D --json
    # as --mode handc, the native target; JSON adds "exported": {"native_bytes", "copied_bytes"};
    # --fb (also for stepped-gen) adds fb_crc32 to sync.csv
xmen2check.py package [--platform windows|linux] --json
    # P8/P9: {"ok", "platform", "zip", "files": [...], "rom_windows": N}; linux: built in WSL,
    # plus "tas_sync": the sync.csv of the Linux native runner's TAS trace (P9)
```

`phase.py 5` computes in cost order and reports in table order, logging each stage as it
finishes (to stderr and `build/phase5.log`): the object scan (P3-P6, seconds), the P1 traces,
the P2 ledger (`verify` and `--match-recomp`, the slowest), the P7 TAS traces. Traces are cached
by the hash of the runner executable, the input and the reference, so a commit that changes no
code reruns nothing.

## How to work it

The loop (ROADMAP.md "Working a phase autonomously") takes the first failing criterion, in
batches of ~5 items from `uv run tools/port_queue.py`. After each batch, run the worker gate
(`uv run tools/gate.py` in XMen2Recomp: build, pccheck, MPW match of changed matched files,
`verify` of the changed functions, a 6,000-sync-point native TAS trace), then notes, `phase.py 5`,
commit and push.

1. **P0 (this revision).** Rulings queued, harness measured (`tools/bench.py`), native target,
   exporter, object scan and worker gate built. Open speed-ups: savestates for the corpus check's
   long pole (LESSONS item 2), if the corpus gate fails.
2. **P1, P2** pass at the start and stay green. A batch that turns either red is fixed before the
   next one.
3. **P3 calls.** In the native branch, a stored function pointer calls the C function at its
   value through a table generated from `xmen2_funcs.h` (typed thunks per prototype, arguments
   converted per parameter type, as the bridge does for slots). Stored values stay the original's
   (R1 (b)), so `state == Foo` and the export are unchanged. Locals whose addresses escape into
   RAM (the `sp_reserve` sites, PlayerSelect_Run's fixed frame) get a stack region in the native
   arena at the original's addresses. SR becomes the platform's interrupt mask. The asm adapters
   become plain C.
4. **P4 platform.** `platform/xmen2_platform.h`. Move the hardware names out of `xmen2_mem.h`;
   each port access becomes an API call in the PC and native modes, and an address in MPW. The
   native main loop needs no fiber: `VDP_WaitVBlank` (the sync point) calls the platform's frame
   step, which presents the frame, runs the Z80 for a frame, reads the pads and calls the C V-int
   handler. `IRQ_WAIT()` does the same without a sync row.
5. **P5 state, the long one.** First a residency census (which struct types the TAS reaches in
   ROM, in RAM, or in both; which stored pointers use which alias form), recorded in NOTES. Then,
   under R1 (b):
   - the globals move to a native arena at their original offsets, generated from
     `xmen2_globals.h`;
   - the heap and the escaping-locals stack move into the same arena;
   - ROM-resident types stay big-endian accessors; RAM-resident ones go to host order;
   - types resident in both get a ROM view and a RAM view, with a conversion where the code
     copies a ROM record into RAM;
   - layout-dependent sites (byte buffers read as words, DMA sources) are fixed.

   After each step the exporter serializes the moved state, and `copied_bytes` falls to 0.
6. **P6** drops the engine's 68000 machinery from the native target (core, scheduler positions,
   glue, slot bridge, generated sources). **P7** adds `--fb`. **P8** packages the Windows build and queues
   the playtest in QUESTIONS.md the moment the package plays, without waiting for anything else.
   **P9** last: the Linux package in WSL and its TAS trace.

Same rules as earlier phases:
- never edit generated C;
- engine changes go in the forks (commit order core → engine → game repo);
- kill runners only by PID;
- never weaken a check in `tools/phase.py` or a contract tool.

Workers each get their own worktree and build dir (`XMEN2_BUILD`), batches of 30-40 files, and
the shipped batch tools. Read LESSONS.md before a parallel round.
