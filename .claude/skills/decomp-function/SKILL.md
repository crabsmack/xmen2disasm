---
name: decomp-function
description: Write one X-Men 2 function as hand-written, readable C in XMen2Recomp and prove it equal to the original - pick from the phase-4 queue, draft from Ghidra and the disassembly, write against the shared headers, verify by MPW byte match or shadow differential test, lint, record. Use for phase 4 criterion D4 (and D3/D5 field naming) or any "decompile function X to C" task.
---

# Decompile a function (the phase-4 loop)

Goal per iteration: one function gets a `XMen2Recomp/game/c/<ADDR>.c` that a newcomer can read,
that is **verified** equal to the original, and the whole game (D2) still equals the sync
reference. Criteria and definitions: `docs/phases/P4-decomp.md`. Never edit generated C.

## 1. Pick

`uv run tools/decomp_queue.py -n 10` (or `--module Barbarian` to stay in one class). Take
the top ~5: callees already done come first. The `coverage` column decides verification:
- `never`: the corpus never runs it, so it **must byte-match** (`cc.py --match-recomp`).
- `full`: shadow verification (`verify`) is enough. A match is fine too.
- `partial`: a match, or `verify` plus synthetic cases until `uncovered` is 0. Writing it
  to match is often faster than building inputs that reach the cold paths.

## 2. Understand (read, don't guess)

```
uv run tools/xref.py NAME               # callers, callees, globals, runtime frames + screenshot
uv run tools/decomp.py decomp NAME      # Ghidra pseudo-C, globals and jt calls named
```
Read `src/f/<ADDR>.asm` (its header is the spec) and `docs/NOTES.md` for the subsystem and
object layouts. `docs/COMPILER.md` "How the original C was written" has the idioms that
reproduce MPW C's output: 4-byte argument slots, register ties go to the later declaration,
`p[i]` vs `*(p + i)`, operand order, `do { } while (0)` state macros, `CLASS()` for parent
calls, `CODEPTR()` for ROM data.

## 3. Write

- One function per file, `game/c/<ADDR>.c`, the disassembly's name, a doc comment (purpose,
  arguments, result; from the asm header, corrected if you learned better).
- Only through the headers in `game/include/`: struct fields by name, globals by name,
  prototypes from `xmen2_funcs.h`. No `g_cpu`, no raw RAM/ROM/hardware addresses, no raw
  offsets: if a field has no name yet, name it in `xmen2_types.h` (or `unk_XX` until known).
- C89 that MPW C 3.3 accepts (`/* */` comments, declarations first). The same file builds
  as C++ on PC through the header's wrapper types.
- Keep the original behaviour exactly, bugs included, and read hardware in the original
  order (the replay log is consumed in order).
- Computed control flow (switch tables, thunk tables entered at k, interior entries): see
  P4 "How to work it" step 4 and NOTES for the convention already chosen.

## 4. Verify

```
uv run tools/cc.py --match-recomp ../XMen2Recomp --json    # (this repo) which files byte-match
cd ../XMen2Recomp && uv run tools/xmen2check.py verify --inputs <dir> --functions ADDR,... --json
uv run tools/xmen2check.py lint --json
```
- No match: `cc.py FILE` lists the compiled code; diff it against `uv run tools/peek.py ADDR`
  and adjust declaration order, types and expression shape. Don't add casts that change
  meaning to force it.
- `verify` mismatch: `first_mismatch` names the call and the differing bytes or registers. Fix
  the C (the generated version is the truth) and keep the state as a regression case.
- `uncovered > 0`: add synthetic cases (mutate a captured state to take the other branch) or
  make it match.

## 5. After the batch

`uv run tools/phase.py 4` (rewrites the ledger, `docs/progress/P4.md`). If D2 broke, the batch
changed whole-game behaviour: `/first-divergence` at the first differing sync point. Append
findings (naming, conventions, fields learned) to `XMen2Recomp/docs/NOTES.md`, then commit and
push both repos (game repo: C + headers; this repo: progress). Done means pushed.

Stuck after a real attempt: write what was tried under NOTES "Open questions", take the next
queue entry, come back with more context.
