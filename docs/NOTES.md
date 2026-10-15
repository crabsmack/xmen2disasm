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

## Game flow (from emulator screenshots, R4 scenarios)

- **Power-on is real play**: a random X-Man (Cyclops with no input; the TAS's U+D mashing
  gets Nightcrawler) in Siberia, P2 "PRESS START" blinking. Buttons take control. With no
  input the stage ends at ~frame 1380, then SEGA logo (~1500), Marvel logo, copyright, title
  (~2950-3450), then an attract loop of demos in other stages (idle run).
- **Title has no menu**: any button starts a new game in Siberia. There is **no options
  menu, no continue and no password** (no such text in the ROM; web sources agree: 9 lives,
  no continues). Cerebro screen names (strings at `$0057D9-$005C50`): LogoAndDemo,
  PlayerSelect, Failure, Credits, FinalText, Clone, Space, Savage, BaniMaza, Avalon, Sentinels.
- **Between stages**: Cerebro briefing text (Start skips) then **PlayerSelect**: portraits
  Beast, Cyclops, Gambit, Nightcrawler, Psylocke, Wolverine (+ Magneto 7th after his stage;
  present at TAS frame 27660). Right wraps last -> first. Cursor input is ignored while the
  highlighted character's intro animation plays (~80 frames). P2 joins by pressing Start
  there (TAS does at the end, frame ~49070) or in play. "LIVES 8" shown at the first select.
- **Death**: back to PlayerSelect for the next life. **Game over**: Failure screen ("WARNING:
  RAPPORT PHALANX INFECTION DETECTED ... NEW YORK ASSIMILATED ..."), "Game Over" text, then
  the power-on style Siberia game again (scenario `game-over`, script frames ~25640-28700).
- Scenario files can start mid-game with `@tas N` (replay the TAS to frame N first).

## Emulator facts

- The TAS (TASVideos 4473M, BizHawk 2.4, Genplus-gx, 2 x 6-button pads) syncs only on
  BizHawk 2.4's own gpgx fork (`emu/bizcore`). Upstream GPGX desyncs within seconds.
- The full TAS is 57,465 frames and replays in ~46 s headless.
- Runtime ground truth so far: the TAS executes 95,800 distinct instruction starts; the
  full standard corpus (TAS + idle + 62 fuzz runs) 110,308. All are disassembled. The
  fuzz runs found ~14.5k the speedrun never touches, so scenarios for paths the
  corpus misses (R4) are likely to find more.
- ~31k disassembled instruction starts (22%) never ran in the corpus: static-only code
  (rare paths, unused code, or paths only a scenario reaches).

## Subsystems

_(module → functions, globals, data; add as you learn them)_

- **Runtime library, `$1F4xxx-$1FExxx`** (most-called helpers): `Mem_Set`/`Mem_Copy`
  (memset/memcpy, args dst, val|src, n), `Math_SinDeg`/`Math_CosDeg` (degrees -> 16.16,
  `Tbl_SineQuarter`), `List_Unlink` (node {+0 next, +4 prev, +8 owner}, head ptr),
  `Irq_Enable`/`Irq_Disable` (SR mask), `VDP_WaitVBlank`.
- **Sound, `$1FE4B6-$1FE6xx`**: every call does `Z80_BusAcquire` (returns into the caller
  with the Z80 stopped, d1 = Z80 RAM `$A00036`, a1 = `$A01B40`) ... `jmp Z80_BusRelease`.
  `$1FE50A` writes one command byte; `$1FE584`/`$1FE5A2` send command `$10`/`$12` + a byte
  argument unless byte `-$18AC(a5)` is set (sound off?). `$1FE5A2` has 232 callers (SFX?).
- **Players**: two player objects at `$FFE9B8` and `$FFEAA8` (`Player_Nearest`). Which is P1
  is not yet confirmed.
- **Game object layout** (from `Player_Nearest`, `$1F4BA2`, `$1F6334`): +4 word flags (bits
  $C000 = $8000: present and alive), +8 long x and +$C long y (16.16; pixel = value >> 8 is
  used for boxes), +$2E byte flags (bit 4 = h-flip, bit 3 = v-flip, bits 0-1 from the
  sprite-def record), +$2F byte frame index ($FF = none), +$30 long sprite-definition
  pointer (frame records of $14 bytes from +$24, signed box offsets at +4..+7),
  +$4C/+$4E/+$50/+$52 word box top/left/bottom/right in pixels.

## Data formats

- Graphics compression: Burt Sloane nibble Huffman (`huffsloane` in
  [sega2asm](https://github.com/hansbonini/sega2asm)). Unverified for this ROM.

## Code read as data (R5)

_(for each `code_as_data` span: `$XXXXXX` - who reads it and why; or "fixed: ...")_

## Unknown (S5)

_(remaining unlabelled, never-read spans: `$XXXXXX-$YYYYYY` - what was tried)_

## Open questions

- Exact compiler/version (matters for an optional C decomp phase).
- ~~Playable character list for scenario R4 (assumed: Cyclops, Wolverine, Gambit,
  Psylocke, Nightcrawler, Beast, Magneto). Verify and fix `REQUIRED_SCENARIOS`.~~
  Verified on the select screen: exactly those seven. `options-menu` and `continue` name
  features the game does not have; their scenario files cover the nearest real paths
  (title/pause input; game over -> restart) and say so in their headers.
