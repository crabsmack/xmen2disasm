---
name: port-batch
description: Move one batch of X-Men 2's hand-written C off the 68000 for the PC port (phase 5) - pick from the port queue, change the native branch of the headers or the files' layout-dependent code so every source still builds in all three modes (MPW, emulated PC, native), prove the batch with the worker gate, record. Use for phase 5 criteria P3 (no 68000 calls), P4 (platform layer), P5 (native state), and for any "port X to native memory/platform" task.
---

# Port a batch (the phase-5 loop)

Criteria and definitions: `docs/phases/P5-port.md` (R1-R6 rulings: read the current answers in
`docs/QUESTIONS.md` first). Design notes: `XMen2Recomp/docs/NOTES.md` "Phase 5". The work
lives in `../XMen2Recomp`, in your own worktree and build dir (`XMEN2_BUILD`).

## Rules that make it provable

- **One source, three modes.** Every `game/c` file and `game/include` header compiles as MPW
  (byte matching), emulated PC (stepped / stepped-gen / verify runners) and native
  (`XMEN2_NATIVE`, `XMen2Native`). Change layout and calls in the **native branch** of the
  headers; change a source only where its own code depends on layout, and then so all three
  modes still build.
- A file that byte-matched at the end of phase 4 must still match (P2, R4). An MPW-only edit
  must stay byte-identical; check before moving on.
- The exporter is the proof. When state moves to native storage, it is serialized into the
  export image from its declaration, so P1 keeps comparing the whole RAM. Never make a sync row
  from anything but the export.
- Fix wide things once: a symbol used by hundreds of files (`xm::call_slots`, `g_ram_ffff`) is
  a header change, not hundreds of edits.
- Never weaken a check, edit generated C, or copy state from a reference.

## 1. Pick

```
uv run tools/port_queue.py -n 20            # first failing of P3/P4/P5: wide symbols, then files
uv run tools/port_queue.py --stats          # what is left, per category and module
```
Batch ~5 items (one header-level symbol, or 30-40 files of one module).

## 2. Change

- P3 (calls): stored function pointers dispatch to C directly in native mode (a table
  generated from `xmen2_funcs.h`, typed per prototype); stored values stay the original's.
  Escaping locals get the native arena's stack region; SR becomes the platform interrupt mask.
- P4 (platform): hardware names and their API go in `platform/`. MPW keeps the addresses, PC
  and native call the API. Hardware reads stay in the original order.
- P5 (state): run the residency census first (NOTES), then globals, heap and escaping locals
  into the native arena (R1), ROM types as big-endian accessors, RAM types in host order, and a
  converter where a ROM record is copied into RAM.

## 3. Prove (in the XMen2Recomp worktree)

```
uv run tools/gate.py                         # build, pccheck, MPW match of changed matched files,
                                             # verify of changed functions, 6,000-sync TAS trace
uv run tools/xmen2check.py build --native --json   # the object scan: did the counts fall?
```
A P1 divergence: `/first-divergence` at the first differing sync point (diff the export image
with the stepped-gen RAM at that sync).

## 4. Record

Append findings to `XMen2Recomp/docs/NOTES.md` "Phase 5" (choices of layout, conversions, any
"can't be verified as defined" case: queue it in `docs/QUESTIONS.md` with the default you take,
and continue). Rebase on `origin/main`, rebuild, gate again, commit (message via `git commit
-F`), push. Every few batches: `uv run tools/phase.py 5` (or `--draft` until P0 is approved)
from xmen2disasm.
