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
  **Update (w140):** the Z80 command ring is 64 bytes at Z80 `$1B40`, write index at `$0036`;
  a command is `$FF, cmd, args` (`Snd_PutCmd`/`Snd_PutByte`). Commands: `$10` `Snd_Play(id)`,
  `$12` `Snd_Stop(id)` (222/279 Stop calls are followed by Play of the same id = restart),
  `$0C`/`$0D` `Snd_Pause`/`Snd_Resume` (Start-button pause, `sub_15CAA4`), `$16` `Snd_StopAll`,
  `$1B` `Snd_SetParam(slot, value)`, `$20` unknown (`Music_Play` sends `$0A`), `$0B` + four
  24-bit ROM pointers at boot (`Snd_Init`). `-$18AC(a5)` = mute flag, set while demos play
  (`loc_005EB8`) and around some init calls. `Music_Play(track)` keeps the track in `-$38D2`.
  Driver image `$1FE66C-$1FFED2` (`Z80_LoadDriver`). Around V-blank DMA the 68k sets Z80
  `$1B20` = 1 and waits for `$1B21` = 0 (`Z80_DriverPause`/`Z80_DriverResume`).
- **Video/frame (w140)**: V-int `Irq_VBlank` (hook `$210`): `Pad_ReadBoth`, frame counter long
  `-$3A10`, then hooks `-$3A14` (system) and `-$3A18` (game, skipped if `-$38C0`/`-$359E`).
  `VDP_FrameUpdate` runs once per frame (guard `-$3A0C`, cleared by `VDP_WaitVBlank`):
  `Pal_Update`, `VDP_UpdateScroll`, and when byte `-$1D4A` is set `VDP_FlushDmaQueue` (sprite
  table `$FFE226` (-$1FDA) -> VRAM `$F000`, $280 bytes, plus the `VDP_QueueDma` queue at -$7A4,
  count -$7B4, $18-byte records). Word `-$1D48` = VDP reg 1 shadow ($81xx: $40 display, $20
  V-int, $10 DMA); `-$204` = reg 11 shadow. VRAM map: plane A `$C000`, sprites `$F000`,
  H-scroll `$F400`. Palettes: `-$3A00` working (uploaded), `-$3980` base; fades step a level
  0-7 through an 8-byte-per-level component table (`Pal_StartFade`/`Pal_ApplyFade`).
- **Joypads (w140)**: `Pad_ReadPort` returns active-high bits 0-3 U/D/L/R, 4-7 B/C/A/Start,
  8-11 Z/Y/X/Mode, `$4000` 6-button, `$8000` no pad. Raw `-$7A8`/`-$7A6`; `Pad_Update` keeps
  per player held (`-$3A36`/`-$3A38`), pressed (`-$3A26`/`-$3A28`), released (`-$3A2A`/`-$3A2C`),
  press latch (`-$3A2E`/`-$3A30`, game code clears bits to consume), accumulated (`-$3A32`/
  `-$3A34`). Demo playback: byte `-$3A1A` active, stream `-$3A1E` of (frame, pad) byte pairs,
  `-$3A20` = demo pad for P1.
- **Timers (w140)**: 30 slots x $16 at `-$10E8`, list head `-$10EC`: `{+0 state, +2 period,
  +4 next, +8 prev, +$C func(arg, timer), +$10 arg, +$14 byte}`. State: >0 counting, 0 fire
  (then reload period), -2 stopped, -4 start pending, -1 free pending, -3 free.
  `Timer_Create` (returns stopped) / `Timer_Start` / `Timer_Stop` / `Timer_Free`; `Timer_RunAll`
  each frame from the scene loop `sub_1FA124`. Objects keep timer pointers in fields (+$24, +$62).
- **Draw list (w140)**: 30 nodes x $14 at `-$134C` `{next, prev, func, object, word key, word
  flags}` sorted by key (`$400` = behind, layer << 2, low bits 1 = P1, 2 = P2, 3 = other).
  `DrawList_Add(func, obj, ...)` returns a node index that actors store (e.g. +$88) for
  `DrawList_SetPriority`/`DrawList_Remove`; func is usually the actor's vtable Draw (+$1A).
  `DrawList_DrawAll` calls them in order.
- **Heap (w140)**: `Mem_StackAlloc(size, tag)`/`Mem_StackFree` - a mark/release stack from
  `$FF0000` upward, top in `-$348C`, 8-byte header `{next top, tag string}`; freeing a non-top
  block only retags it "FREE ME".
- **Compiler runtime (w140)**: `$15C1FC-$15C3xx`: `Math_LMul`, `Math_LDivS`, `Math_LModS`
  (register args d0 op d1; each has an embedded 68020 `divs.l` path skipped by
  `jmp -2(a0,a1)` with a1 = 2), `Math_DivModS`/`Math_DivModU` (d1 = quotient, d0 = remainder).
  `Math_MulFix8(a, b)` = (a*b) >> 8.
- **Scenes**: `Scene_Register(name, func)` fills `g_SceneTable`; `Scene_EndAfter(n)` sets the
  exit countdown `-$359A` that the scene loop decrements to 0.
- **Players**: two player objects at `$FFE9B8` and `$FFEAA8` (`Player_Nearest`). Which is P1
  is not yet confirmed.
- **Game object layout** (from `Player_Nearest`, `$1F4BA2`, `$1F6334`): +4 word flags (bits
  $C000 = $8000: present and alive), +8 long x and +$C long y (16.16; pixel = value >> 8 is
  used for boxes), +$2E byte flags (bit 4 = h-flip, bit 3 = v-flip, bits 0-1 from the
  sprite-def record), +$2F byte frame index ($FF = none), +$30 long sprite-definition
  pointer (frame records of $14 bytes from +$24, signed box offsets at +4..+7),
  +$4C/+$4E/+$50/+$52 word box top/left/bottom/right in pixels.
- **Actor classes (C++ vtables with names)** - `uv run tools/classes.py [NAME | --func ADDR]`.
  ~130 classes. Descriptor = `{word name_off; long parent_desc; long method[] (+6 .. name_off);
  char name[]}`; root `ACTOR` at `$1F49A6` (e.g. `DROPBOMB` `$082294`, `XPLAYER` `$1131A0`,
  `XNPC`/`BIONPC` `$113A88`/`$113B10` add slots $6E-$82). Object +0 = its descriptor. Code
  reaches a class's own descriptor as `lea jt(a5),a0 / movea.l 2(a0),a0` (a jt entry that
  points at DATA), so `movea.l 2(a0),a0 / movea.l $12(a0),a1 / jsr (a1)` = call the
  PARENT's Init. Slots, from ACTOR's own methods (`$15D92C`...): +$06 GetSize (returns
  sizeof; called on the descriptor by the spawner `sub_1197F2`), +$0A InitSpawnRec, +$0E New
  (alloc, Init, Activate if in window), +$12 Init(this, x, y, spawn param) (x/y longs with 8
  fraction bits; calls parent Init first), +$16 ContainsPoint, +$1A Draw (sprite to screen
  coords), +$22 Attack(target,...) -> target's +$26 TakeDamage (+$68 health -= dmg, +$6A
  hit-flash timer = 10, +$5C handler := +$60), +$2A/+$2E/+$32/+$36 spawn-record in view /
  spawn / out of view / despawn, +$3A/+$3E/+$42/+$46 in-window / Activate / out-of-window /
  Deactivate, +$4A Update (per frame; calls handler +$5C when timer +$6C < 1, Move...),
  +$4E Move (velocity +$16/+$18, accel +$1E/+$20, max +$22/+$24), +$52 Kill, +$56
  SetFrame(frame), +$5E ClassInit(0, class index) (per level: `sub_1FA7E8` calls it for
  every class in the class list `-$3900(a5)`; loads the class's resources). +$5A/+$62/+$6A
  are empty in ACTOR; +$66 is the same 6-instruction no-op (`this` in a4) in every class.
  Level class lists: `{word bytes; desc*[]}` then a Pascal-string name such as
  `CloneA2NGClassList` (`$081826`), `BroodBossHallFGClassList`, `Jungle1NGClassList`.
  Naming convention for overrides: `<Class>_<Slot>` in CamelCase (`DropBomb_Init`,
  `XClone_Update`); no-op overrides `<Class>_Nop66` / `_Nop6A`.
  Other root classes (no parent, own slot meanings): `CAMERA` `$1F4960` (object in
  `g_Camera`; +$0A New(desc, hook): the hook is called after every camera update with the
  camera, +$1C), `LITTLELEG`, `EVILBEAM`, `ELEVATOR`, `ICANDY`, `GAUSSBULLET`, `BBOARD`,
  `SYNCHRONIZER`.
- **Scene functions** (registered by name in `sub_0054C6`; prefix = scene id): `CloneA2_RunScene`
  ('CloneA2 Vertical_Corridor_1') shows the usual shape: empty stubs, `_LoadLevel`
  (`sub_1F98A8` with map data + `Tbl_<Scene>ClassList`, initial palettes into g_PalBase),
  `_InstallHooks` (per-frame scene hook into `-$388E(a5)`, resources via `sub_1F62C0`,
  `Players_PlaceAtStart`), camera creation, timers, then `sub_0C1478(track)` (music; writes
  g_MusicTrack), `sub_1FA6FE` (scene loop), `sub_0C14B4`. Scene-local globals in
  `$FFC6C4-$FFC706` (`-$3B3C..-$3AFA`) are reused with different meanings by each scene:
  don't give them global names. Per-frame helpers are `Timer_Create(fn, 1, arg, 0)` + `Timer_Start`,
  ended by `Timer_Free`. Camera limits: words
  `-$3A98/-$3A9C` min x/y, `-$3A96/-$3A9A` max x/y (`CloneA2_SetCameraZone`). Screen shake:
  `g_CamShake` script.
- **Scene ids in $080000-$0E0000**: CloneA2 ($081BBA-$082244), CloneA5 BroodBoss
  (`sub_088730`), SavageA2 Perimeter_1 (`sub_0AD91A`), SavageA3 Perimeter_2 (`sub_0B0538`),
  SavageA4 Chamber (`sub_0B65C6`), SavageC1 Jungle_1 (`sub_0C11CE`), SavageB1 Jungle_2
  (`sub_0C130A`), SentinelsD1 Exterior_1 (`sub_0DC4AA`).
- **Players are confirmed** (w000): `g_Player1` = `$FFEAA8` (+$9D = 0), `g_Player2` = `$FFE9B8`
  (+$9D = 1; vtable 0 until P2 joins at TAS frame 49140). Objects are $F0 bytes. Player
  vtable = character class: jt `$2B9A` Beast, `$2BA2` Nightcrawler, `$2BAA` Psylocke, `$2BB2`
  Wolverine, `$2BBA` Magneto, `$2BC2` Gambit, `$2BCA` Cyclops (`lea jt(a5),a0 / move.l 2(a0)`
  reads the jt target = class pointer). Character index (`Player_CharIndexOf`,
  `g_P1CharIndex`): 0 Beast, 1 Cyclops, 2 Gambit, 3 Nightcrawler, 4 Psylocke, 5 Wolverine,
  6 Magneto (TAS RAM vs screenshots). Player fields: +$68 word health ($700 on a new life,
  HUD bars = (h-1)>>8 + 1, max 9), +$9E word second HUD meter. Player code uses the ACTOR
  slots above: +$12 Init(x<<8, y<<8, 0) to place, +$3E Activate, +$52 Kill.
- **Game flow code** (w000): `Game_Main` -> `Game_SceneLoop` runs `g_SceneTable[g_SceneIndex]`
  (8-byte {name, fn}, filled by `Scene_RegisterAll` via `sub_1F9464`). Scene load
  (`sub_1F98A8`, called by every stage init) calls hook `-$38E8` first and `-$38EC` last
  (`Scene_PreLoadReset`, `Scene_PostLoadVram`). After a scene: health -> `g_P1Health`,
  0 = spend a life (`g_P1Lives`) or drop out. `g_SceneIndex = -1` -> attract demos
  (`Game_AttractDemo*`, demo input at `-$3A1E` read as (duration, buttons) pairs by
  `sub_1F9DE8`; `-$3A1A` = demo active; `-$18AC` = 1 mutes sound during demos).
- **VRAM**: word `-$3398` ($FFCC68) = next free VRAM tile; `sub_1FB026` sets up a sprite slot
  and returns base + tiles needed; `sub_1FE17A(src, vram addr, bytes)` = DMA to VRAM (immediate
  while word `-$1D48` = VDP reg 1 mirror has bit 6 (display) clear, else queued at `$FFFA5C`). Joypad bits: Up 1, Down 2, Left 4, Right 8, B $10, C $20, A $40,
  Start $80, Z $100, Y $200, X $400, Mode $800 (`Game_InitButtonMasks`).

- **Class slots, additions (w0E0)** to the `tools/classes.py` names above (`$0E0000-$140000` follows
  them; descriptors there are labelled `Tbl_<Class>_vtable`, 60 of them): +$1E `DrawIfActive` (ACTOR
  `$15E452`: Draw unless flag $4000) · +$5A `LevelLoad` (static, run by the scene loader `sub_1F98A8` ->
  `sub_1F9804` for each class in `-$3900(a5)`) · +$62 `LevelStart` (static, `sub_1FA878`, after the first
  spawn pass of `sub_1FA124`, the level main loop) · +$6A `Reset` when non-empty (DEATHBIRD Init calls
  it on `this`; HOLOGRAM/POP/FIREWALL ClassInit share its body), else `Nop6A`. XNPC slots: +$6E
  `OnHurt(this, dmg, type)` and +$72 `OnDeath` (both from `XNpc_TakeDamage`), +$76 `EndHurt` (restore
  the state saved in +$60), +$7A `Query7A` (base: `*arg3 = 2`, return 0; unknown), +$7E `Explode`
  (death effect by stats byte 2). Spawn records: 14 bytes each at `$FFC924` (count `$FFC928`), built
  from 16-byte placement entries (`$FFC92A`, word 0 = class index into `-$3900`) by `sub_15F95C`
  calling each class's InitSpawnRec.
- **ACTOR object fields** (ACTOR Init `sub_15DCC4`, Move `sub_1F4C56`, Update `sub_15E7FA`): +$10/+$12
  word x/y pixels, +$16/+$18 word velocity x/y, +$1E/+$20 word acceleration (gravity default 100),
  +$22/+$24 word max speed, +$26/+$28 word min speed to move, +$5C state function (run by Update when
  the +$6C word delay reaches 0), +$60 hurt state, +$64 default state, +$68 word health, +$6A word hit
  cooldown (10 after a hit), +$7C collision handle. XNPC (size $94): +$8C pointer to a stats record
  (byte 0 attack damage, 1 hurt sound, 2 health/death type, 7 hurt frame).
- **AI scripts**: many enemies keep a script pointer (e.g. BABYBIO `+$98`): word count, then 4-byte
  `jmp d(a5)` thunks (`loc_11B508`...). An action function sets `+$5C` to the next thunk and `+$6C`
  to a delay; when the script is null it falls back to `+$64`.
- **Non-actor classes**: ICANDY (`$1188AC`, size $42, light sprite: 0 SizeOf, 1 New, 2 Init, 3 Update,
  4 Draw, 5 Destroy), BBOARD (`$1197CA`: word array, one entry per switch/synchronizer; created with 100
  entries by `Switch_LevelInit` into `$FFE55A`), SYNCHRONIZER (`$119CFE`, pool of 4), ELEVATOR (`$10B532`).

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
