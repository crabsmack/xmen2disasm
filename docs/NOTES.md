# NOTES: shared findings log

Append-only knowledge for every agent and session. Before starting work, read the
section for your area. When you learn something another agent would need, add it
here in the same commit as the code change. Cite evidence (function, address,
emulator frame). Correct wrong entries by striking them through (`~~...~~`) and
adding the correction under them. Don't silently delete.

progress.py also reads this file:
- **R5**: every `code_as_data` start address (written `$XXXXXX`) must appear under
  "Code read as data" with an explanation.
- **S5**: every remaining unlabelled never-read span start must appear under "Unknown".

## Binary facts

- **Compiler**: C/C++ from a classic Macintosh toolchain (MPW C/C++ or Symantec;
  exact version TBD). ~3,000 `link.w a6,#N` frames; args at `8(a6)`...; result in d0;
  d3-d7/a2-a4 callee-saved. Objects have vtables at offset 0.
- **A5 = $000200, constant** (emulator, frames 3000 and 40000). So:
  - `-d(a5)` = RAM global at `($200 - d) & $FFFFFF`, e.g. `-$38A6(a5)` = `$FFC95A`.
  - `+d(a5)` with `d = $22 + 8i` = jump-table entry i (ROM `$220 + 8i`, jmp at `+2`).
    `pea d(a5)` passes a function pointer.
- **Jump table** at `$220`, 2,631 entries; ~1,000 point at data, and some at small
  `jmp d(a5)` thunk tables entered at computed offsets (e.g. `$0119E6`, found at runtime).
- **Boot**: `EntryPoint` ($1F43AE) is Sega's ICD_BLK4 init. Vectors 28/30 (H-int,
  V-int) are stubs calling through the pointers at `$210/$214/$218`.
- **Main loop**: `sub_005466` (jt[0]) inits, waits on VDP status, then loops forever
  calling `sub_005CC6`.
- **Resources by name**: `sub_1F9464(name, callback)` is called with C strings such as
  `Str_SiberiaB1Blizzard` and jump-table function pointers, and its results are stored
  in byte globals (`sub_0054C6`). Probably registers named resources/handlers.
- **No title screen first**: power-on drops straight into the snowy first stage.

## Emulator facts

- The TAS (TASVideos 4473M, BizHawk 2.4, Genplus-gx, 2 x 6-button pads) syncs only on
  BizHawk 2.4's own gpgx fork (`emu/bizcore`). Upstream GPGX desyncs within seconds.
- The full TAS is 57,465 frames and replays in ~46 s headless.
- Runtime ground truth so far: the TAS executes 95,800 distinct instruction starts.

## Subsystems

_(module → functions, globals, data; add as you learn them)_

## Data formats

- Graphics compression: Burt Sloane nibble Huffman (`huffsloane` in
  [sega2asm](https://github.com/hansbonini/sega2asm)). Unverified for this ROM.

## Code read as data (R5)

_(for each `code_as_data` span: `$XXXXXX` - who reads it and why; or "fixed: ...")_

## Unknown (S5)

_(remaining unlabelled, never-read spans: `$XXXXXX-$YYYYYY` - what was tried)_

## Open questions

- Exact compiler/version (matters for an optional C decomp phase).
- Playable character list for scenario R4 (assumed: Cyclops, Wolverine, Gambit,
  Psylocke, Nightcrawler, Beast, Magneto). Verify and fix `REQUIRED_SCENARIOS`.
