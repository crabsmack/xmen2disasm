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
- **Sprite instance at object+$2E (w140)**: +0 flags (bits 0-1 palette, 3 v-flip, 4 h-flip,
  5 = frame graphics already uploaded), +1 frame wanted, +2 sprite-def ptr (def+0 type byte
  $20 or $18/$19; frame records $14 bytes from def+$24: +0..+3 bbox, +4..+7 body box, +8..+$B
  second box, +$2B anchor y), +6 word, +$A uploaded frame, +$D first attached object.
  Draw methods: `Spr_SetFrame(obj+$2E, f)` then `Spr_Draw(obj+$2E, sx, sy)`.
  Object +$3B first child / +$3C next sibling (indexes into the object pointer table at
  `-$34A6`), `Obj_ForEachChild`; +$42 draw layer; +$54..+$5A second box (`Obj_UpdateBoxes`,
  used by `ObjList_ForEachAtPoint` hit tests); +$6A hit-flash timer.
- **Floor segments (w140)**: $14-byte records at `-$33D2` ($FFCE2E), +0 bit 7 in use, +1 type
  (handler table `g_SegTypeHooks` at `-$346A`), +2 layer, +8..+$E endpoints x1,y1,x2,y2, +$10/+$11 previous/next
  neighbour index, +$13 next segment of the same owner. Objects with flags +6 bit $200 own
  segments from +$7A (their box top becomes a walkable line); a walker keeps the segment it
  stands on in +$76 and its position along it in +$72 (`Seg_WouldLeaveEnd`).
  Lookup grid: word grid at `-$347C`, cell size shifts `-$347E`/`-$3480` (Level_Load args),
  size `-$3482`/`-$3484`; each cell = offset of a $FF-terminated segment-index list in the pool
  at `-$3478` (`Seg_GridCell`, `Seg_FindAt`, `Seg_FindBelow`; built by `sub_1F84BE`).
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
  ~~don't give them global names~~ (N3 still needs a name for each; the globals worker owns them:
  use a neutral scene-scratch name and list the per-scene uses in the ram.asm comment). Per-frame helpers are `Timer_Create(fn, 1, arg, 0)` + `Timer_Start`,
  ended by `Timer_Free`. Camera limits: words
  `-$3A98/-$3A9C` min x/y, `-$3A96/-$3A9A` max x/y (`CloneA2_SetCameraZone`). Screen shake:
  `g_CamShake` script.
- **Scene ids in $080000-$0E0000**: CloneA2 ($081BBA-$082244), CloneA5 BroodBoss
  (`sub_088730`), SavageA2 Perimeter_1 (`sub_0AD91A`), SavageA3 Perimeter_2 (`sub_0B0538`),
  SavageA4 Chamber (`sub_0B65C6`), SavageC1 Jungle_1 (`sub_0C11CE`), SavageB1 Jungle_2
  (`sub_0C130A`), SentinelsD1 Exterior_1 (`sub_0DC4AA`).
- **Hazard water / flood (w080)**: `Water_Init(variant, surface y, splash y)` + `Water_DrawHook` in
  `g_SceneDrawHook`: players below the surface (`-$3C10`) splash and take damage every 5 frames while
  `-$3C14` is set (Savage jungle swamp; SavageA2/A3 rising flood: `SavageA2_CamUpdateFlood` raises it).
- **Stage music (w080)**: `Music_PlayStage(track)` / `Music_StopStage`; `Music_SetPlayerParams` tells
  the driver the player count and each player's character (`Player_MusicVoice`, Snd_SetParam $A/$B/$C),
  refreshed every frame by some scene hooks, so the music follows who is playing.
- **Tile hooks (w080)**: 8 longs at `$FFC708` (byte `-$33C8` = installed); [2] = breakable tile hit
  (`SavageA2_TileHookCrack`), [3] = door/wall hit (`PerimeterDoor_TileHook`, `XClone_TileHookOpenWall`).
- **AI scripts (w080 range)**: SMALLBROOD, BROODBOSS, EVILMAKER, XCLONE... keep `{word count;
  jmp d(a5) thunks}` scripts; every action ends with the same "next step" idiom (index += 1, wrap,
  `+$5C` := script + 2 + 4*index, else `+$64`). Names: `<Class>_Act*` = script action (a jt entry),
  `<Class>_State*` = internal state put in `+$5C`, `<Class>_ScrStep*` = the jmp thunks.
- **Evil clones** (`XCLONE` and `EVIL*`, final Clone stages): `Clone_CharTypeOf` maps a player
  class or its clone to 1 Beast, 2 Cyclops, 3 Gambit, 4 Magneto, 5 Nightcrawler, 6 Psylocke,
  7 Wolverine (`XClone_SpawnByType` uses the same numbers). A clone waits for the players to
  enter its arena (`XClone_LockArena`: camera clamp, arena walls = segment type $19 solid),
  emerges from a pod (BIOBALLS object), runs its script; `+$AC` = the character's move-set record
  (word offsets to animations). Killing a clone with the same character sets bit (8+type) of
  `-$3B08`; `XClone_TileHookReward`/`XClone_TileHookOpenWall` then flash and blast open a wall
  (map columns $5A-$5B) unless a player is Magneto. 6 kills (`-$3C40`) end the wave
  (`XClone_EndWave`: collapse effects, `sub_1F944E(600)`).
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
- **VRAM**: word `-$3598` ($FFCC68) = next free VRAM tile; `sub_1FB026` sets up a sprite slot
  and returns base + tiles needed; `sub_1FE17A(src, vram addr, bytes)` = DMA to VRAM (immediate
  while word `-$1D48` = VDP reg 1 mirror has bit 6 (display) clear, else queued at `$FFFA5C`). Joypad bits: Up 1, Down 2, Left 4, Right 8, B $10, C $20, A $40,
  Start $80, Z $100, Y $200, X $400, Mode $800 (`Game_InitButtonMasks`).
- **Scene list** (w000, `Scene_RegisterAll` + `g_Scn*` byte globals = scene ids): Siberia B1,
  Cerebro Sentinels, Sentinels D1/B1/A1/B2, Cerebro Avalon, Avalon B1/B2/A2/A3 (Exodus)/A4
  (Throne Room), Cerebro BaniMaza, BaniMaza B2/A1/A2 (Apocalypse), Cerebro Savage, Savage
  C1/B1/A2/A3/A4, Cerebro Space, Space B1/A1, Cerebro Clone, Clone A1/A2/A5 (Brood boss),
  FinalText, Credits, Failure, LogoAndDemo, with a PlayerSelect scene between stages. Scene
  functions are `<Scene>_RunScene`. Played in registration order (`g_SceneIndex` += 1).
  Magneto is selectable once `g_SceneIndex` > `g_ScnCerebroBaniMaza` (`PlayerSelect_Run`).
- **Cerebro screens** (`$0644D4-$067200`, w000): `Cerebro_Run` loads the Cerebro level and runs,
  as flagged by its caller: `Cerebro_PlayIntro` (-$3B0C), the text script at -$3B14
  (`Cerebro_RunTextScript`: op 0/7+ print with style op-7, 1 cursor, 2 wait, 3 clear, 4 fade,
  5 Snd_Play, 6 Snd_Stop), `PlayerSelect_Run` (-$3B0A). Text window rows -$3C58..-$3C5C, cols
  -$3C56..-$3C5A, cursor -$3B04/-$3B06, plane at VRAM $E000. -$3C5E = progress flags (bit 1
  START pressed on the logo, bit $4000 game finished). PlayerSelect cursors are objects at
  -$3B28 (P1) / -$3B2C (P2): +$3C character index, +$3D saved index, +$40 confirmed.
  Per-character select-screen sprite getters (index order): Beast `sub_1841E4`, Cyclops
  `sub_1E3C5A`, Gambit `sub_1D0744`, Nightcrawler `sub_1A7CAC`, Psylocke `sub_1BA006`,
  Wolverine `sub_197C22`, Magneto `sub_1CEC28` (each +$10 = frame getter).
- **Scene hooks** (w000): `-$388E` = per-frame scene hook (e.g. `AvalonB1_FrameHook`), the
  CAMERA object's +4 = per-frame camera hook (AvalonB1 chains five `AvalonB1_CamHook*` for its
  intro), `-$3AF8..-$3ADC` = 8 map-tile hook pointers (`AvalonB1_InstallTileHooks`),
  `sub_15D7F8(x, y, tile, keep)` sets a map tile, `sub_159FD6` steps a palette cycle into
  `g_PalBase`. **Offset tip**: Ghidra shows RAM addresses; A5 offset = address - $10200
  (`$FFC6CE` -> `-$3B32`), not address - $10000.
- **Stage code layout** (w000, `$000000-$080000`): every stage has `<Stage>_RunScene` calling
  small setup functions (`_LoadLevel` = `sub_1F98A8`, `_PlacePlayers` = `Players_PlaceAtStart`,
  `_InitCamera` with a `_CamHook`, `_InstallHooks`/`_InstallTileHooks`/`_InstallEventHooks`,
  `_EmptyStub*`) then the level loop `sub_1FA6FE`. Tile hooks crack/toggle map tiles through
  stages (`AvalonA4_GlobCrack*` only react to MAGNETICGLOB, `BaniMazaB2_CrackFloorHook`,
  `BaniMazaA1_SwitchTileHook` reverses the rolling-disc bands). Event hooks at `-$321A..`
  answer event 3 (used by camera zones: `AvalonA4_EventZoneFree*`).
- **Bosses in this range**: BIGACOLYTE (renders and grows a scaled picture, bursts a wall,
  20-step fight script), EXODUS (attack patterns, swoops, floor-breaking blasts; horizontal
  blasts that hit a wall start the screen-wide psychic flash `AvalonA3_PsiFlashStep`, which
  hurts both players each step), MAGNETOBOSS (wall-crack intro, camera-zone chase with globes,
  captured by THRONEPHONE which ends the stage), APOCALYPSE (damped `Apocalypse_MoveTo`,
  bomb patterns; script phase by destroyed-bomb count `-$3B0C` = 3/7/12; defeat spawns the
  BEAMSCOOTER that lifts the players out), TUSK (boulder rain until the players reach its
  platform, then throws BOULDERs, charges, spawns TUSKETTEs). Enemy AI scripts: word count
  + `jmp` thunks (labels `<Class>_Script*`, counts `Tbl_<Class>*ScriptLen`). Many states end
  with `+$5C = next, +$6C = delay` and return `+4 & 8`.

- **Class slots, additions (w0E0)** to the `tools/classes.py` names above (`$0E0000-$140000` follows
  them; descriptors there are labelled `Tbl_<Class>_vtable`, 60 of them): +$1E `DrawIfActive` (ACTOR
  `$15E452`: Draw unless flag $4000) · +$5A `LevelLoad` (static, run by the scene loader `sub_1F98A8` ->
  `sub_1F9804` for each class in `-$3900(a5)`) · +$62 `LevelStart` (static, `sub_1FA878`, after the first
  spawn pass of `sub_1FA124`, the level main loop) · +$6A `Reset` when non-empty (DEATHBIRD Init calls
  it on `this`; HOLOGRAM/POP/FIREWALL ClassInit share its body), else `Nop6A`. XNPC slots: +$6E
  `OnHurt(this, dmg, type)` and +$72 `OnDeath` (both from `XNpc_TakeDamage`), +$76 `EndHurt` (restore
  the state saved in +$60), +$7A ~~`Query7A`~~ `GetMoveLimit(this, dir, *kind)` (limit coordinate toward dir 0 left/1 right/2-3 vertical; kind 0 wall, 1 open edge, 2 none = XNPC base; see `BabyBio_GetMoveLimit`; used to stop knockback), +$7E `Explode`
  (death effect by stats byte 2). Spawn records: 14 bytes each at `$FFC924` (count `$FFC928`), built
  from 16-byte placement entries (`$FFC92A`, word 0 = class index into `-$3900`) by `sub_15F95C`
  calling each class's InitSpawnRec.
- **ACTOR object fields** (ACTOR Init `sub_15DCC4`, Move `sub_1F4C56`, Update `sub_15E7FA`): +$10/+$12
  word x/y pixels, +$16/+$18 word velocity x/y, +$1E/+$20 word acceleration (gravity default 100),
  +$22/+$24 word max speed, +$26/+$28 word min speed to move, +$5C state function (run by Update when
  the +$6C word delay reaches 0), +$60 hurt state, +$64 default state, +$68 word health, +$6A word hit
  cooldown (10 after a hit), ~~+$7C collision handle~~ +$7C per-object Timer (`Timer_Create(class
  Update, 1, this, 1)` in ACTOR Init). XNPC (size $94): +$8C pointer to a stats record
  (byte 0 attack damage, 1 hurt sound, 2 health/death type, 7 hurt frame).
- **AI scripts**: many enemies keep a script `{word index; long table}` (HOLOGRAM `+$8C/+$8E`, BABYBIO
  `+$96/+$98`), set by `sub_15A6DE(&script, table)`. Table = word count, then 4-byte `jmp d(a5)`
  thunks (`Hologram_ScriptAttack`, `loc_11B508`...); the jump table exports the table start. An action
  function sets `+$5C` to the next thunk and `+$6C` to a delay; when the script is null it falls back to
  `+$64`. Caution: the count word's high byte is $00, so several tables are mislabelled
  `Str_Empty_XXXXXX` ("C string") right before such thunk files (e.g. `$0EAEFC`, `$0EAF02`, `$0EAF10`).
- **Scene entry functions** (from `Scene_RegisterAll`): SiberiaB1 `sub_0FD6A8`, SentinelsD1 `sub_0DC4AA`,
  SentinelsB1 `sub_0F4428`, SentinelsA1 CoolantCore `SentinelsA1_RunScene`, SentinelsB2 `sub_0F4CD8`,
  AvalonB1 `sub_00FDAA`, AvalonB2 `sub_0227E0`, AvalonA2 `sub_022BA2`, AvalonA3 `sub_02CD50`, AvalonA4
  `sub_035A9E`, BaniMazaB2 `sub_05ACEC`, BaniMazaA1 `sub_038BFA`, BaniMazaA2 `sub_04791A`, SavageC1
  `sub_0C11CE`, SavageB1 `sub_0C130A`, SavageA2 `sub_0AD91A`, SavageA3 `sub_0B0538`, SavageA4 `sub_0B65C6`,
  SpaceB1 `sub_10778C`, SpaceA1 `SpaceA1_RunScene`, CloneA1 `sub_0776E2`, CloneA2 `CloneA2_RunScene`,
  CloneA5 `sub_088730`; Cerebro screens `$066E80-$067020`. TAS order: SentinelsA1 at ~7450-9575,
  SpaceA1 (elevator shaft) 37205-45095. Stage helpers follow the CloneA2 pattern (`<Scene>_LoadLevel`,
  `_InstallHooks`, `_FrameHook` in `$FFC972`, ...).
- **Non-actor classes**: ICANDY (`$1188AC`, size $42, light sprite: 0 SizeOf, 1 New, 2 Init, 3 Update,
  4 Draw, 5 Destroy), BBOARD (`$1197CA`: word array, one entry per switch/synchronizer; created with 100
  entries by `Switch_LevelInit` into `$FFE55A`), SYNCHRONIZER (`$119CFE`, pool of 4), ELEVATOR (`$10B532`).
- **Shared effects/projectiles (w0E0)**: `Explosion_Spawn(x, y, flip)` (27 callers; 10 slots `g_Explosions`,
  optional damage via `ObjList_ForEachInBox`), GAUSSBULLET pool (`GaussBullet_InitPool` per scene,
  `GaussBullet_Fire`, 6 records in `g_GaussPool`), power-up `*_Collect` = player vtable +$6E (`sub_1F1D88`
  AddHealth: health += n*$100, clamp 1..$900; segment +1, XPower +3, Mondo = full). BIOBALLS (`$1203AC`) is
  a chain of balls (list +$92, {x, y, flags}) driven by a motion function in +$A2 (`BioBalls_Motion*`:
  Orbit, Ring, Helix, Path, Roll, Gather) that XCLONE/EVIL* actions plug in. XNPC hurt/death reactions:
  `XNpc_HurtReact`/`XNpc_DeathReact` (knockback limited by `GetMoveLimit`, stun, fling, explode).
- **Bosses in `$0E0000-$140000` (w0E0)**: HOLOGRAM (SentinelsA1 CoolantCore: poses via `Hologram_SetPose`,
  lifts = COREELEVATOR, CORESHIELDS fire COREZAPs), DEATHBIRD (SpaceA1 elevator: hornet waves, burst
  projectiles, can hit the lift switch), BIGBIO (SpaceB1 arena: 16 orbs at `$FFE774`, spit pool `$FFE770`).
- **Death effects `ExplodeFx_*` ($13D8F6-$13EFA0, w0E0b)**: a dying object's own memory becomes the effect
  (vtable +$52 Kill, then `Mem_Set(obj+4, 0, $BE)`, a Timer for the update and a DrawList entry for 32x32 puff
  sprites from `g_FxTileBase`, 7 frames x 6 ticks, sound $38). Four kinds, chosen by `XNpc_Explode` from stats
  byte 2 and by POP's type: Burst (10 puffs from `Tbl_ExplodeFxSmall/Medium/Large`; kind bits $100/$200 make puffs
  drop a segment power-up), Trail (head puff leaves explosions behind), Bounce (puffs reflect off the screen
  edges), Chain (path script `{dx, dy, ?, delay}` ended by a negative long, optional repeats, optionally hurts
  both sides via `ExplodeFx_ChainHit`). POP = invisible placed actor that waits then plays one of these.
  `Debris_*` ($13F474-$13F728): separate pools of bouncing 16x16 debris pieces (BroodBoss, XClone walls).
  MINE actors only seed a 20-record pool (`Mine_PoolAdd`), not real objects. `$1400DE` (labelled
  `Tbl_SparkCallSlot5A`) is the SPARK class descriptor (Spark_Init calls its parent Init through it).
- **Hit lists (w140b)**: 50 nodes x $C `{next, prev, owner}` at `$FFEBB2` (`HitList_Init`/`HitList_Add`), four
  heads: `$FFEBA2` player attackers, `$FFEBA6` player bodies, `$FFEBAA` enemy attackers, `$FFEBAE` enemy
  bodies. `Actor_Activate` adds an object's attacker node (+$80, unless +6 flag 1) and body node (+$84,
  unless +6 flag 2); +6 flag $10 = player side. `Collide_RunAll` tests EBA2 vs EBAE and EBAA vs EBA6
  (`Collide_ObjVsList` -> attacker's +$22 Attack). Projectiles hit-test the opposing body list with
  `ObjList_ForEachAtPoint`. `unk_Player_005F18` moves P2 onto the enemy lists (players can hit each other?).
- **CAMERA object (w140b)** (`Cam_*`, `$1607A0-$161816`, size $6C): +4 update fn (`Cam_DefaultUpdate`, scenes
  swap in their own), +8 tracking fn (`Cam_TrackPlayer`/`TrackBoth`/`TrackObject`/`PanStep`), +$C apply
  (`Cam_ApplyPos` -> `Cam_SetPos`), +$10 offset easing, +$14 `Cam_ShakeStep`, +$18 look up/down step, +$1C
  post-update hook, +$24 target object, +$28/+$2A target's last pixel pos, +$2C/+$2E transition offset,
  +$30/+$32 camera x/y, +$34/+$36 previous y/x, +$38/+$3A pan target, +$3C/+$40/+$3E/+$42 dead-zone box
  left/top/right/bottom, +$46 easing step, +$4A flags (1 lock x, 2 lock y, 4 looking up, 8 looking down),
  +$54/+$56 pan speed, +$5C look offset, +$68 wall margin. Vtable: +$16 Update, +$1A FollowBoth, +$1E
  FollowPlayer, +$22 FollowObject, +$26/+$2A LookUp/LookDown, +$2E/+$32 End..., +$36 PanTo, +$3A UnlockAxes.
  `Cam_SetPos` clamps to words `$FFC770/$FFC772` (x min/max) and `$FFC76C/$FFC76E` (y min/max).
  Byte `$FFC920` (-$38E0) = live players this frame; byte -$38DE = 1 when both are alive, and then
  `Actor_Update` steps objects by 2 (two-player mode runs the game logic at half rate).
- **Player classes (w140b)**: XPLAYER `$1131A0` (methods `$1F00E8-$1F39C4`, slots up to +$EE) < XCLIMBER
  `$11329A` (`$1F3CD6-$1F413E`) < BEAST (`$182AE6-$1840EC`), NIGHTCRAWLER (`$1A61DE-$1A7CA4`), PSYLOCKE
  (`$1B9060-$1B9FE8`), WOLVERINE (`$196552-$197C3C`); XPLAYER < MAGNETO (`$1CDA3A-$1CEC42`), GAMBIT
  (`$1CEF6E-$1D073C`), CYCLOPS (`$1E2AB0-$1E3C52`). Player +$C0 bits 0-1 = climb state, +$BC = climbed segment.
- **XPLAYER slots and state machine (w140b)**: +$A6 `StateControl` is the hub every state returns to. It
  dispatches by pad (A = special/power, B = attack, C = jump; masks `g_PadMask*`): air B -> +$BA up / +$BE
  down / +$C2 neutral attack; air A -> +$CA / +$CE / +$C6 special; air C -> +$B6 double jump if +$92; ground B
  -> +$D6 / +$DA / +$D2 attack (combo); ground A -> +$E6 up / +$E2 down / +$DE special; C -> +$82 Jump, Down+C
  -> +$86 DropThrough; Left/Right -> +$AE Walk; Down -> +$B2 Crouch; nothing -> +$EE Stand. Others: +$6E
  AddHealth, +$72 post-state hook, +$76 UpdateCharge (A held fills +$9E, the HUD 2nd bar, to $20), +$7A
  FreezeStanding, +$7E SetAirFrame (by vy), +$8A AirSteer, +$8E LeaveGround, +$96 CheckGrab -> +$AA climb
  state (XCLIMBER; +$F2 ClassifySeg: 1 ceiling, 2/3 wall), +$9A Land (fall speed +$1C > 1099 -> +$EA
  HardLanding), +$9E PlaceAtSafePos / +$A2 SaveSafePos (+$94 segment, +$98/+$9A pos). +$60 = `XPlayer_StateHurt`.
  Player +4 flag $1000 = airborne; +$90 flags: 4 double-jump used, 8 jumped, $10 special fires on release,
  $200 grounded latch, $800 meter full, $4000/$8000 tether-blocked left/right, $40000 looking up/down,
  $200000 crouch-attack, $1000000 on the enemy hit lists. +$70 attack strength, +$A0/+$A2/+$A4 hit spark.
  Only Nightcrawler and Wolverine can hang from ceilings (`XPlayer_CanRejoinAt`). **Character record**
  (player +$8C): +0..7 attack strength bytes, +8 hurt sound, +9 hard-landing sound, +$C/+$E gravity (jump
  released / normal), +$10 jump vy, +$12/+$14 air max speed/accel, +$18 max fall speed, +$1A stop speed,
  +$1C/+$1E walk max/accel, +$20 run threshold, +$22 combo window, +$23 hard-landing time, +$24 hurt time,
  +$26 idle-variant chance, +$28 hurt/death frame, +$2A hard-landing frame, +$2C attack sound, +$2D jump
  sound, +$2E landing sound, +$30.. animation offsets (+$30/+$32/+$34 air attack, +$36/+$38 combo, +$3A/+$3C
  up/down attack, +$3E run, +$42 stand, +$44 idle, +$46 crouch, +$48 look up, +$4A look down, +$4C double
  jump, +$5A/+$5C float fall), +$4E/+$50 double-jump vy window, +$52 boost, +$54/+$56 double-jump steer.
- **Character specials (w140b)**: Beast stomp + ground shockwaves (strong only above 7 health), down-air
  dive; Wolverine claw climb on walls/ceilings, healing factor in `Wolverine_Update` (every 900 frames
  below 3 units), lunge/leap slashes; Nightcrawler teleport (direction from the pad, distance from the
  meter +$9E, palette flash when strong); Psylocke psi dash/blade (damage types $D-$F only hurt targets
  with +6 flag $100), crouch slide; Magneto 8-way aimed bolts (`Magneto_SpawnShot` -> MAGNETICGLOB, single
  static object `$FFE8AE`; aim index +$BC: 0/9 down, 1/8 down-diagonal, 2/7 level, 3/6 up-diagonal, 4/5
  up, left/right) and the held FLUXBOMB (`$FFE7AC`, 16-particle implode/burst, area damage + map-tile
  hooks), A in the air toggles hover. The EVILMAGNETO clone reuses the same spawners. "Strong" versions
  of most specials need health > $700.
- **RNG (w140b)**: `Rand_Next` (`$1600AA`) XORs three lagged word tables (`Tbl_RandXor1-3`) with its history
  (-$7AA/-$7AC), indexes -$7B2/-$7B0/-$7AE; returns 0..$FFF. `Rand_Seed(word)`.

## Data formats

- ~~Graphics compression: Burt Sloane nibble Huffman (`huffsloane` in
  [sega2asm](https://github.com/hansbonini/sega2asm)). Unverified for this ROM.~~
  The decompressor loop at `$15F3F0-$15F5xx` has the shape of **Nemesis** (Sega's tile
  compression, Sonic 1/2 `NemDec`): 8-bit code lookup into a table at `a1`, codes `$FC`+ =
  inline-data escape (`cmpi.w #$FC,d1`), bit buffer d5/d6 refilled a byte at a time.
  Header/code-table format not yet checked against Nemesis. Other heavy ROM readers in
  the TAS: `$15F5FC`, `$15F6F0`, `$15F65C` (a second decoder family?), `$1FAD44`, `$1FBB5E`.
  **(w140)** Unlike Sonic's NemDec the code table is NOT in the stream: callers build it
  first with `Nem_BuildCodeTable(pairs, table)` from `{len, value}` byte pairs ending `$FF`,
  then `Nem_Decode(src, table, rows, mode, dest, mask)` (mode 0 RAM, 1 VRAM, 2 VRAM with a
  per-tile skip bitmap). `$15F5FC` is an **Enigma** tilemap decoder (`Eni_Decode(src, dst,
  add)`: header inline-bit-count, mask, incrementing word, common word; 7-bit commands;
  `Eni_Ops` = its branch table). `$1FAD44` = `Spr_UploadFrame` (sprite frame tiles).
- **Sprite definitions (w140)** (pointer at sprite instance +2 / object +$30; readers
  `Spr_UploadFrame`, `Spr_EmitStream*`, `Spr_PreloadTiles`, `Obj_UpdateBoxes`): $24-byte
  header {+0 byte type: $18 raw tiles, $19 Nemesis tiles (+2 word: offset of its code-table
  pairs), $14 raw (4-byte pieces), $20 = RAM copy made by `Spr_PreloadTiles`; +1 byte frame
  count; +5 byte max tiles} then frame records of $14 bytes: +0..+3 signed bbox (l,t,r,b),
  +4..+7 body box, +8..+$B second box, +$C word offset of a 0-terminated word list, +$10 byte
  piece count, +$11 byte tile count, +$12 word offset of the piece list. Type $18 pieces are
  8 bytes `{word x, word y, word attr (bits 0-3 hardware size code, $1800 flips), word
  tile-data offset}`; RAM ($20) pieces are 6 bytes `{byte x, byte y, word attr, word tile}`.
  Size code s: width ((s>>2)+1)*8, height ((s&3)+1)*8 (`Tbl_SprSizeTiles/Width/Height` at
  `$1FDE06`, and per-emitter copies `Tbl_SprWidth*`). Hardware sprites are written to
  `g_SpriteTable` following its link bytes (`Spr_BeginFrame`/`Spr_EndFrame`, 80 slots).
- **Level map / tileset blobs (w140)** (`Level_Load(fgMap, fgTiles, bgMap, bgTiles, fgSegs,
  bgSegs, ...)`, `Level_LoadMaps`): map +0 byte flags, +1 byte (high nibble != 0 =
  compressed), +2/+4 words width/height in 8-px cells (>>2 = 32-px blocks), +$A word offset
  of the Enigma block layout, +$10 offset of a 16-word palette line, +$12 offset of the spawn
  list `{word count; 16-byte entries {word class index into the class list, word x, word y,
  ...}}`, +$16 offset of the special-block list `{word count; {word slot 1-12, word x, word
  y}}`. Tileset (may be the same blob): +6 word tile count, +8 word block count, +$C offset of
  the Enigma block definitions (4x4 tile words per block), +$E offset of the tiles: raw words
  when uncompressed, else `{word rows; Nem code pairs ... $FF; Nemesis data}` decoded with a
  used-tile mask (`Level_LoadUsedTiles`). Readers: `Eni_Decode`, `Nem_*`, `Level_*`.
- **Floor-segment lists (w140)** (`Seg_LoadList`): records until a 0 byte, `{byte type (bits
  0-5; $40 = no neighbour links), byte extra, word x1, y1, x2, y2, word ?, [byte prev, byte
  next]}` = 12 bytes, 10 when $40 is set.
- **Palette cycle tables (w140)** (`Pal_CycleStep`): 6-byte sequences `{long offset of colour
  words ending -1, byte frames per colour, byte palette entry}`, list ends with offset -1.
- **Frame hit-point lists (w140)** (`Obj_FindHitPoint`, frame record +$C): signed (x, y) byte
  pairs ending (0, 0); `$7F,$7F,cond,value` opens a group skipped unless the object matches.
- **Fade tables (w140)**: `Tbl_FadeBlack` ($1FDD56), `Tbl_FadeInvertWhite` ($1FDD96): 8 levels
  x 8 bytes mapping a 3-bit colour component; passed to `Pal_StartFade`.
- **Control layouts (w140)**: `Tbl_ButtonConfigs` ($1FDDD6), 6 x 8 joypad masks per action.
- **Animation scripts (w140)**: object +$44 = script, +$48 = step. Script: byte flags (bits
  0-1 one-shot, 2 per-step flips, 3 face velocity), byte step count, ..., steps of 2 bytes
  from +6 `{flags, value}`: flag $20 = play sound `value`, else frame `value` (bits $80/$40
  toggle h/v flip). `Obj_SetAnim`/`Obj_ChangeAnim`, `Anim_ApplyStep`, `Anim_Advance`.

## Code read as data (R5)

_(for each `code_as_data` span: `$XXXXXX` - who reads it and why; or "fixed: ...")_

All nine are the same harmless read-ahead, not mis-disassembly: each is the first 1-2 bytes
of a function (a `link.w` opcode) that directly follows a **Nemesis-compressed blob**. The
decompressor's bit reader (`$15F3F0`, read at `$15F414`: `move.b (a0)+,d5` refills whenever
fewer than 9 bits remain) always fetches 1-2 bytes past the end of the stream. Evidence:
the emulator reader logs (`emu/coverage/*.readers.txt.gz`) show each span read only by
`$15F3F0`/`$15F37C`/`$15F540`, as the tail of a longer data span ending right there.
- `$017218` (blob `$0171E8`), `$0268FE` (blob `$026884`), `$027230` (blob `$0271D4`),
  `$0644D4` (blob `$063D7C`), `$0E99D6` (blob `$0E87E2`), `$133F3C` (blob `$133F28`),
  `$13FA88` (blob `$13F9F4`), `$1416C0` (blob `$140B12`), `$144774` (blob `$1446C8`).
  The jt entries for `$017218`, `$0268FE`, `$133F3C` are tiny `return constant` functions
  (never executed in the corpus) that happen to sit after compressed art.

## Unknown (S5)

_(remaining unlabelled, never-read spans: `$XXXXXX-$YYYYYY` - what was tried)_

<!-- unknowns.py: generated below, do not edit by hand -->

None of these was read or DMA'd anywhere in the 75-run corpus, and no jump-table entry or numeric code operand points into them (checked by tools/dataitems.py / autolabel.py). Most are a few bytes between functions: alignment padding or the tails of tables whose start is labelled. Regenerate with `uv run tools/unknowns.py`.

- `$0119FF-$011A00` (1 B) after BigAcolyte_IntroScript, before BigAcolyte_FightScript: `14`
- `$011A50-$011A52` (2 B) after BigAcolyte_FightScript, before CapedAcolyte_GetSize: `00 12`
- `$011A56-$011A76` (32 B) after BigAcolyte_FightScript, before CapedAcolyte_GetSize: `06 c6 00 00 02 20 06 02`
- `$0228E2-$022958` (118 B) after AvalonA2_DisabledFrameEffect, before AvalonA2_DisabledFrameEffect_exit: `3b 7c 06 64 c6 98 3b 7c`; decodes as code (`move.w #$664, -$3968(a5)` ...) but nothing references it: dead code?
- `$02CE92-$02CE94` (2 B) after Exodus_NextPattern, before Exodus_NextPattern_part1: `60 62`
- `$035AFF-$035B00` (1 B) after AvalonA4_RunScene, before MagnetoBoss_GetSize: `0c`
- `$03653A-$03653E` (4 B) after MagnetoBoss_Move, before loc_03653E: `60 00 01 aa`; decodes as code (`bra.w $366e6` ...) but nothing references it: dead code?
- `$03A582-$03A584` (2 B) after BanimazaDoor_Draw, before loc_03A584: `60 30`
- `$04B2CC-$04B2CE` (2 B) after loc_04B1C2, before Apocalypse_GetSize: `ff ff` all $FF
- `$04B2DC-$04B2DE` (2 B) after loc_04B1C2, before Apocalypse_GetSize: `ff ff` all $FF
- `$04B2F0-$04B2F2` (2 B) after loc_04B1C2, before Apocalypse_GetSize: `ff ff` all $FF
- `$04B304-$04B306` (2 B) after loc_04B1C2, before Apocalypse_GetSize: `ff ff` all $FF
- `$04B318-$04B31A` (2 B) after loc_04B1C2, before Apocalypse_GetSize: `ff ff` all $FF
- `$04B334-$04B336` (2 B) after loc_04B1C2, before Apocalypse_GetSize: `ff ff` all $FF
- `$063BFF-$063C06` (7 B) after loc_05E038, before Cerebro_BigSpriteDecode: `01 04 02 02 08 20 ff`
- `$063C11-$063C22` (17 B) after loc_05E038, before Cerebro_BigSpriteDecode: `04 01 01 08 08 10 ff 01`
- `$081BB9-$081BBA` (1 B) after sub_077CBC, before CloneA2_EmptyStub1: `64`
- `$088B96-$088B9A` (4 B) after BroodBoss_ScrStepScream, before EvilMaker_GetSize: `00 00 00 00` all $00
- `$096D30-$096D36` (6 B) after XClone_StateChildHome, before XClone_StateChildHome_Step: `02 6b fb ff 00 98`
- `$0AB3A2-$0AB3A4` (2 B) after BubbleManager_SetWaveParams, before BubbleManager_SetWaveParams_Case1: `60 72`
- `$0EAEFD-$0EAEFE` (1 B) after Hologram_VBlankFlicker, before Hologram_ScriptIntro: `01`
- `$0EB00A-$0EB00E` (4 B) after Hologram_ScriptAttack, before CoreShields_EmptyStub: `00 00 00 00` all $00
- `$0EC0A8-$0EC0AC` (4 B) after CoreZap_Update, before CoreElevator_EmptyStub: `00 00 00 00` all $00
- `$112182-$112186` (4 B) after Deathbird_Move, before Deathbird_Move_Polar: `60 00 01 ac`; decodes as code (`bra.w $112330` ...) but nothing references it: dead code?
- `$11E7A2-$11E7A6` (4 B) after BioBalls_ScriptIdle, before BioBalls_GetSize: `00 00 00 00` all $00
- `$1342BC-$1342C0` (4 B) after FireWall_EmptyStub, before FlyBrood_ScriptA: `00 00 00 00` all $00
- `$1342FC-$134300` (4 B) after FireWall_EmptyStub, before FlyBrood_ScriptA: `00 00 00 00` all $00
- `$13435C-$134360` (4 B) after FireWall_EmptyStub, before FlyBrood_ScriptA: `00 00 00 00` all $00
- `$1364AA-$1364AC` (2 B) after FlyBrood_StateHit, before Hornet_GetSize: `00 7f`
- `$13AF92-$13AFA1` (15 B) after sub_13ADA6, before Ninja_GetSize: `00 00 00 00 00 01 00 02`
- `$13AFA4-$13AFB3` (15 B) after sub_13ADA6, before Ninja_GetSize: `00 00 00 00 00 01 00 02`
- `$13AFB6-$13AFC5` (15 B) after sub_13ADA6, before Ninja_GetSize: `00 00 00 00 00 01 00 02`
- `$13AFC8-$13AFD6` (14 B) after sub_13ADA6, before Ninja_GetSize: `00 00 00 00 00 01 00 02`
- `$13D8BE-$13D8C2` (4 B) after sub_13D7F6, before loc_13D8C2: `4e ed 3a 62`; decodes as code (`jmp $3a62(a5)` ...) but nothing references it: dead code?
- `$13F300-$13F304` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F308-$13F30C` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F310-$13F314` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F318-$13F31C` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F320-$13F324` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F326-$13F32C` (6 B) after sub_13F282, before sub_13F474: `0f ff 0f ff 0f ff`
- `$13F330-$13F334` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F338-$13F33C` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F340-$13F344` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F348-$13F34C` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F350-$13F354` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F358-$13F35C` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F360-$13F364` (4 B) after sub_13F282, before sub_13F474: `00 ff 00 00`
- `$13F366-$13F368` (2 B) after sub_13F282, before sub_13F474: `0f ff`
- `$13F46C-$13F470` (4 B) after sub_13F282, before sub_13F474: `00 00 00 00` all $00
- `$1420DE-$1420E0` (2 B) after sub_14205E, before loc_14221E: `00 82`
- `$1420E4-$1420F0` (12 B) after sub_14205E, before loc_14221E: `00 14 16 c0 00 15 d9 3a`
- `$1420F4-$142124` (48 B) after sub_14205E, before loc_14221E: `00 15 e3 d4 00 15 e5 5a`
- `$142128-$142166` (62 B) after sub_14205E, before loc_14221E: `00 15 e7 fa 00 14 18 fa`
- `$144FEE-$144FF2` (4 B) after sub_144D88, before sub_157BA6: `00 00 00 00` all $00
- `$159AB4-$159AB6` (2 B) after sub_159A46, before sub_159ECC: `00 6e`
- `$159ABA-$159AC2` (8 B) after sub_159A46, before sub_159ECC: `00 15 7b a6 00 15 d9 3a`
- `$159ACA-$159ACE` (4 B) after sub_159A46, before sub_159ECC: `00 15 e3 d4`
- `$159AD2-$159AD6` (4 B) after sub_159A46, before sub_159ECC: `00 15 e4 52`
- `$159ADA-$159AF2` (24 B) after sub_159A46, before sub_159ECC: `00 15 e6 80 00 15 db 26`
- `$159B0E-$159B2E` (32 B) after sub_159A46, before sub_159ECC: `00 15 d9 70 00 15 d9 78`
- `$159B32-$159B3A` (8 B) after sub_159A46, before sub_159ECC: `00 15 7b b4 00 15 d9 3a`
- `$159B42-$159B46` (4 B) after sub_159A46, before sub_159ECC: `00 15 e3 d4`
- `$159B4A-$159B6A` (32 B) after sub_159A46, before sub_159ECC: `00 15 e4 52 00 15 e6 30`
- `$159B86-$159BA8` (34 B) after sub_159A46, before sub_159ECC: `00 15 d9 70 00 15 d9 78`
- `$159C85-$159C86` (1 B) after sub_159A46, before sub_159ECC: `ff` all $FF
- `$159CFB-$159CFC` (1 B) after sub_159A46, before sub_159ECC: `ff` all $FF
- `$159D83-$159D84` (1 B) after sub_159A46, before sub_159ECC: `ff` all $FF
- `$159EA5-$159ECC` (39 B) after sub_159A46, before sub_159ECC: `ff 0a 06 05 16 0b 06 08`
- `$15C23E-$15C246` (8 B) after Math_LDivS_68000, before Math_LModS: `22 2f 00 04 20 2f 00 08`
- `$15C254-$15C25C` (8 B) after Math_LModS_68000, before Math_DivModS: `4c 41 08 01 c3 40 4e 75`; decodes as code (`dc.w $4c41` ...) but nothing references it: dead code?
- `$15C28E-$15C2AC` (30 B) after Math_DivModS, before Math_DivModU: `22 2f 00 04 20 2f 00 08`; decodes as code (`move.l $4(a7), d1` ...) but nothing references it: dead code?
- `$15F720-$15F740` (32 B) after Eni_ReadInline, before Anim_Advance: `00 01 00 03 00 07 00 0f`
- `$182A17-$182A19` (2 B) after Cam_DefaultUpdate, before sub_182AE6: `04 04`
- `$182A1C-$182A1D` (1 B) after Cam_DefaultUpdate, before sub_182AE6: `08`
- `$182A20-$182A22` (2 B) after Cam_DefaultUpdate, before sub_182AE6: `00 00` all $00
- `$182A2C-$182A2E` (2 B) after Cam_DefaultUpdate, before sub_182AE6: `00 00` all $00
- `$182A3B-$182A3C` (1 B) after Cam_DefaultUpdate, before sub_182AE6: `00` all $00
- `$182A3F-$182A42` (3 B) after Cam_DefaultUpdate, before sub_182AE6: `0d 83 06`
- `$182A45-$182A46` (1 B) after Cam_DefaultUpdate, before sub_182AE6: `00` all $00
- `$182A4A-$182A4C` (2 B) after Cam_DefaultUpdate, before sub_182AE6: `ff 86`
- `$182A56-$182A58` (2 B) after Cam_DefaultUpdate, before sub_182AE6: `ff 0a`
- `$182A60-$182A74` (20 B) after Cam_DefaultUpdate, before sub_182AE6: `ff 36 00 00 00 00 00 00`
- `$1964F6-$1964F7` (1 B) after Beast_SelectFrame, before sub_196552: `02`
- `$1964FA-$1964FB` (1 B) after Beast_SelectFrame, before sub_196552: `02`
- `$1964FE-$196500` (2 B) after Beast_SelectFrame, before sub_196552: `00 00` all $00
- `$196519-$19651A` (1 B) after Beast_SelectFrame, before sub_196552: `00` all $00
- `$19651F-$196520` (1 B) after Beast_SelectFrame, before sub_196552: `06`
- `$196523-$196524` (1 B) after Beast_SelectFrame, before sub_196552: `00` all $00
- `$196528-$19652A` (2 B) after Beast_SelectFrame, before sub_196552: `ff a2`
- `$196534-$196536` (2 B) after Beast_SelectFrame, before sub_196552: `fe 9c`
- `$19653E-$196540` (2 B) after Beast_SelectFrame, before sub_196552: `fe c8`
- `$19654D-$196552` (5 B) after Beast_SelectFrame, before sub_196552: `00 ff ee ff f6`
- `$1A6182-$1A6183` (1 B) after sub_1A60B6, before sub_1A61DE: `01`
- `$1A6186-$1A6187` (1 B) after sub_1A60B6, before sub_1A61DE: `01`
- `$1A618A-$1A618C` (2 B) after sub_1A60B6, before sub_1A61DE: `00 00` all $00
- `$1A61A5-$1A61A6` (1 B) after sub_1A60B6, before sub_1A61DE: `00` all $00
- `$1A61AB-$1A61AC` (1 B) after sub_1A60B6, before sub_1A61DE: `06`
- `$1A61AF-$1A61B0` (1 B) after sub_1A60B6, before sub_1A61DE: `00` all $00
- `$1A61B4-$1A61B6` (2 B) after sub_1A60B6, before sub_1A61DE: `fe e0`
- `$1A61C0-$1A61C2` (2 B) after sub_1A60B6, before sub_1A61DE: `fd a2`
- `$1A61D9-$1A61DA` (1 B) after sub_1A60B6, before sub_1A61DE: `00` all $00
- `$1A6A40-$1A6A52` (18 B) after sub_1A65EC, before loc_1A6A52: `42 6c 00 6c 41 fa fb a6`
- `$1B9004-$1B9005` (1 B) after Nightcrawler_SelectFrame, before sub_1B9060: `00` all $00
- `$1B9008-$1B9009` (1 B) after Nightcrawler_SelectFrame, before sub_1B9060: `00` all $00
- `$1B900C-$1B900E` (2 B) after Nightcrawler_SelectFrame, before sub_1B9060: `00 00` all $00
- `$1B9018-$1B901A` (2 B) after Nightcrawler_SelectFrame, before sub_1B9060: `01 00`
- `$1B9027-$1B9028` (1 B) after Nightcrawler_SelectFrame, before sub_1B9060: `00` all $00
- `$1B902B-$1B902E` (3 B) after Nightcrawler_SelectFrame, before sub_1B9060: `13 09 00`
- `$1B9031-$1B9032` (1 B) after Nightcrawler_SelectFrame, before sub_1B9060: `00` all $00
- `$1B9034-$1B9036` (2 B) after Nightcrawler_SelectFrame, before sub_1B9060: `ff 7e`
- `$1B9042-$1B9044` (2 B) after Nightcrawler_SelectFrame, before sub_1B9060: `fe 66`
- `$1B904C-$1B9050` (4 B) after Nightcrawler_SelectFrame, before sub_1B9060: `fe 9e fe b4`
- `$1B9054-$1B9060` (12 B) after Nightcrawler_SelectFrame, before sub_1B9060: `04 52 02 42 00 80 c1 00`
- `$1CD99E-$1CD99F` (1 B) after Psylocke_SelectFrame, before sub_1CDA3A: `02`
- `$1CD9A2-$1CD9A3` (1 B) after Psylocke_SelectFrame, before sub_1CDA3A: `02`
- `$1CD9A6-$1CD9A8` (2 B) after Psylocke_SelectFrame, before sub_1CDA3A: `00 00` all $00
- `$1CD9BE-$1CD9BF` (1 B) after Psylocke_SelectFrame, before sub_1CDA3A: `0f`
- `$1CD9C1-$1CD9C2` (1 B) after Psylocke_SelectFrame, before sub_1CDA3A: `00` all $00
- `$1CD9C7-$1CD9C9` (2 B) after Psylocke_SelectFrame, before sub_1CDA3A: `00 7f`
- `$1CD9CB-$1CD9DA` (15 B) after Psylocke_SelectFrame, before sub_1CDA3A: `00 00 00 00 00 00 00 00` all $00
- `$1CD9DC-$1CD9DE` (2 B) after Psylocke_SelectFrame, before sub_1CDA3A: `fd 34`
- `$1CD9E4-$1CD9FA` (22 B) after Psylocke_SelectFrame, before sub_1CDA3A: `fe c2 fd 7e 00 00 00 00`
- `$1CEE66-$1CEE68` (2 B) after sub_1CEC42, before sub_1CEF6E: `02 02`
- `$1CEE6A-$1CEE6C` (2 B) after sub_1CEC42, before sub_1CEF6E: `02 02`
- `$1CEE6E-$1CEE70` (2 B) after sub_1CEC42, before sub_1CEF6E: `00 00` all $00
- `$1CEE7A-$1CEE7C` (2 B) after sub_1CEC42, before sub_1CEF6E: `00 00` all $00
- `$1CEE89-$1CEE90` (7 B) after sub_1CEC42, before sub_1CEF6E: `00 1b 58 16 1d 17 06`
- `$1CEE93-$1CEE94` (1 B) after sub_1CEC42, before sub_1CEF6E: `00` all $00
- `$1CEE98-$1CEE9A` (2 B) after sub_1CEC42, before sub_1CEF6E: `fe b6`
- `$1CEEA4-$1CEEA6` (2 B) after sub_1CEC42, before sub_1CEF6E: `fd e6`
- `$1CEEA8-$1CEEAA` (2 B) after sub_1CEC42, before sub_1CEF6E: `fe 0a`
- `$1CEEAC-$1CEEE2` (54 B) after sub_1CEC42, before sub_1CEF6E: `fe 0a fe 26 00 00 00 00`
- `$1CEEEE-$1CEF02` (20 B) after sub_1CEC42, before sub_1CEF6E: `00 00 00 00 00 01 00 03`
- `$1CEF0E-$1CEF32` (36 B) after sub_1CEC42, before sub_1CEF6E: `00 00 00 00 00 00 00 01`
- `$1CEF3E-$1CEF6E` (48 B) after sub_1CEC42, before sub_1CEF6E: `00 00 00 00 00 01 00 03`
- `$1E16CC-$1E16D4` (8 B) after loc_1E16BC, before loc_1E16D4: `70 00 72 14 74 14 60 0e`; decodes as code (`moveq #$0, d0` ...) but nothing references it: dead code?
- `$1E1768-$1E176E` (6 B) after loc_1E16D4, before loc_1E176E: `3c 04 7e ff 60 04`; decodes as code (`move.w d4, d6` ...) but nothing references it: dead code?
- `$1E1906-$1E1908` (2 B) after loc_1E177A, before loc_1E1916: `fd ca`
- `$1E190E-$1E1912` (4 B) after loc_1E177A, before loc_1E1916: `fe 5c fe 5c`
- `$1E1CFA-$1E1D04` (10 B) after sub_1E1928, before sub_1E2AB0: `00 02 00 01 00 00 00 3c`
- `$1E1D08-$1E1D0A` (2 B) after sub_1E1928, before sub_1E2AB0: `00 00` all $00
- `$1E1D10-$1E1D12` (2 B) after sub_1E1928, before sub_1E2AB0: `00 00` all $00
- `$1E1D16-$1E1D1E` (8 B) after sub_1E1928, before sub_1E2AB0: `02 01 00 06 00 00 00 24`
- `$1E1D3E-$1E1D46` (8 B) after sub_1E1928, before sub_1E2AB0: `ff ff ff ff ff ff ff ff` all $FF
- `$1E1D66-$1E1D6E` (8 B) after sub_1E1928, before sub_1E2AB0: `ff ff ff ff ff ff ff ff` all $FF
- `$1E1D9E-$1E1DA6` (8 B) after sub_1E1928, before sub_1E2AB0: `ff ff ff ff ff ff ff ff` all $FF
- `$1E1DDE-$1E1EA6` (200 B) after sub_1E1928, before sub_1E2AB0: `ff ff ff ff ff ff ff ff`
- `$1E1EEE-$1E20B6` (456 B) after sub_1E1928, before sub_1E2AB0: `ff ff ff ff ff ff ff ff`
- `$1E212E-$1E21E6` (184 B) after sub_1E1928, before sub_1E2AB0: `00 62 ff 8f 05 8a 00 11`
- `$1E221E-$1E22EE` (208 B) after sub_1E1928, before sub_1E2AB0: `00 51 00 4f 13 35 00 08`
- `$1E236E-$1E237E` (16 B) after sub_1E1928, before sub_1E2AB0: `ff ff ff ff ff ff ff ff` all $FF
- `$1E2386-$1E238A` (4 B) after sub_1E1928, before sub_1E2AB0: `29 09 f8 00`
- `$1E238C-$1E2398` (12 B) after sub_1E1928, before sub_1E2AB0: `00 00 ff fd 00 d7 00 03`
- `$1E23A0-$1E23A4` (4 B) after sub_1E1928, before sub_1E2AB0: `29 09 f8 00`
- `$1E23A6-$1E23D4` (46 B) after sub_1E1928, before sub_1E2AB0: `00 00 ff f8 00 dc 00 08`
- `$1E23D8-$1E23F4` (28 B) after sub_1E1928, before sub_1E2AB0: `ff de 09 ad fa 94 fa c4`
- `$1E23FC-$1E2400` (4 B) after sub_1E1928, before sub_1E2AB0: `2c 0c 00 08`
- `$1E2402-$1E2432` (48 B) after sub_1E1928, before sub_1E2AB0: `ff f8 ff 7e 00 08 00 00`
- `$1E2434-$1E2498` (100 B) after sub_1E1928, before sub_1E2AB0: `ff de 13 b1 fc 18 fc 78`
- `$1E24A0-$1E24A4` (4 B) after sub_1E1928, before sub_1E2AB0: `2f 09 f8 08`
- `$1E24A6-$1E255E` (184 B) after sub_1E1928, before sub_1E2AB0: `fe 00 fe 00 00 00 00 00`
- `$1E2560-$1E2562` (2 B) after sub_1E1928, before sub_1E2AB0: `ff 9e`
- `$1E256A-$1E256E` (4 B) after sub_1E1928, before sub_1E2AB0: `32 09 f8 f8`
- `$1E2570-$1E25E6` (118 B) after sub_1E1928, before sub_1E2AB0: `fe 00 fe 00 00 00 00 00`
- `$1E25EE-$1E25F2` (4 B) after sub_1E1928, before sub_1E2AB0: `32 09 f8 f8`
- `$1E25F4-$1E2628` (52 B) after sub_1E1928, before sub_1E2AB0: `fe 00 fe 00 00 00 00 00`
- `$1E262A-$1E262C` (2 B) after sub_1E1928, before sub_1E2AB0: `ff 7c`
- `$1E262E-$1E2684` (86 B) after sub_1E1928, before sub_1E2AB0: `09 ca f9 30 f9 60 05 00`
- `$1E26E0-$1E26E6` (6 B) after sub_1E1928, before sub_1E2AB0: `ff aa ff c4 ff de`
- `$1E26EE-$1E26F2` (4 B) after sub_1E1928, before sub_1E2AB0: `38 09 f8 00`
- `$1E26F4-$1E2734` (64 B) after sub_1E1928, before sub_1E2AB0: `00 00 ff fd 00 d2 00 03`
- `$1E2736-$1E2788` (82 B) after sub_1E1928, before sub_1E2AB0: `ff cc ff e6 06 a8 f7 34`
- `$1E2A54-$1E2A56` (2 B) after sub_1E1928, before sub_1E2AB0: `02 02`
- `$1E2A58-$1E2A59` (1 B) after sub_1E1928, before sub_1E2AB0: `02`
- `$1E2A5C-$1E2A5E` (2 B) after sub_1E1928, before sub_1E2AB0: `00 00` all $00
- `$1E2A68-$1E2A6A` (2 B) after sub_1E1928, before sub_1E2AB0: `00 00` all $00
- `$1E2A77-$1E2A7E` (7 B) after sub_1E1928, before sub_1E2AB0: `00 03 e8 0e 10 1f 08`
- `$1E2A81-$1E2A82` (1 B) after sub_1E1928, before sub_1E2AB0: `00` all $00
- `$1E2A86-$1E2A88` (2 B) after sub_1E1928, before sub_1E2AB0: `f2 c4`
- `$1E2A92-$1E2A94` (2 B) after sub_1E1928, before sub_1E2AB0: `ef 66`
- `$1E2A96-$1E2A98` (2 B) after sub_1E1928, before sub_1E2AB0: `f1 e2`
- `$1E2A9C-$1E2AAC` (16 B) after sub_1E1928, before sub_1E2AB0: `f1 da 00 00 00 00 00 00`
- `$1E2AAE-$1E2AB0` (2 B) after sub_1E1928, before sub_1E2AB0: `ff f4`
- `$1F4880-$1F4890` (16 B) after Irq_HBlankVector, before unk_Sys_1F4890: `48 e7 e0 c0 20 78 02 18`
- `$1F48F6-$1F4900` (10 B) after Mem_Copy, before Mem_Set: `86 6d 65 6d 63 70 79 00`
- `$1F4956-$1F4960` (10 B) after Mem_Set, before sub_1F4A1A: `86 6d 65 6d 73 65 74 00`
- `$1F49A6-$1F49B0` (10 B) after Mem_Set, before sub_1F4A1A: `00 6e 00 00 00 00 00 15`
- `$1F49BC-$1F49C0` (4 B) after Mem_Set, before sub_1F4A1A: `00 15 e3 d4`
- `$1F49C4-$1F49C8` (4 B) after Mem_Set, before sub_1F4A1A: `00 15 e4 52`
- `$1F49D0-$1F49D8` (8 B) after Mem_Set, before sub_1F4A1A: `00 15 db 26 00 15 db 8e`
- `$1F49FC-$1F4A1A` (30 B) after Mem_Set, before sub_1F4A1A: `00 15 e4 10 00 15 d9 70`
- `$1F6E40-$1F6E42` (2 B) after sub_1F6D76, before loc_1F6E42: `60 78`
- `$1F70A0-$1F70A4` (4 B) after Seg_ComputeObjPos, before loc_1F70A4: `60 00 01 46`; decodes as code (`bra.w $1f71e8` ...) but nothing references it: dead code?
- `$1F729E-$1F72A0` (2 B) after sub_1F71F2, before loc_1F72A0: `60 56`
- `$1F7682-$1F7686` (4 B) after sub_1F7628, before loc_1F7686: `60 00 02 b2`; decodes as code (`bra.w $1f7936` ...) but nothing references it: dead code?
- `$1F7844-$1F7848` (4 B) after loc_1F76D6, before loc_1F7848: `60 00 00 84`; decodes as code (`bra.w $1f78ca` ...) but nothing references it: dead code?
- `$1F895C-$1F89A4` (72 B) after loc_1F883A, before loc_1F89A4: `0c 2c 00 02 00 15 6c 00`; decodes as code (`cmpi.b #$2, $15(a4)` ...) but nothing references it: dead code?
- `$1F8AF8-$1F8AFA` (2 B) after loc_1F8AEE, before sub_1F8B42: `fd 3e`
- `$1F8B02-$1F8B1C` (26 B) after loc_1F8AEE, before sub_1F8B42: `ff d2 ff d2 ff d2 ff d2`
- `$1F8B24-$1F8B26` (2 B) after loc_1F8AEE, before sub_1F8B42: `fe 52`
- `$1F8B28-$1F8B2A` (2 B) after loc_1F8AEE, before sub_1F8B42: `fe 52`
- `$1F8B32-$1F8B3A` (8 B) after loc_1F8AEE, before sub_1F8B42: `fe 64 ff d2 fd b4 fd 42`
- `$1FE5B2-$1FE5B4` (2 B) after Snd_Stop, before unk_Snd_1FE5B4: `4e 71`
- `$1FE5C4-$1FE5C6` (2 B) after unk_Snd_1FE5B4, before Snd_Pause: `4e 71`
- `$1FE608-$1FE618` (16 B) after Snd_StopAll, before Snd_SendCmd2: `4e 71 4e ba fe aa 4a 2d`
- `$1FE642-$1FE644` (2 B) after Snd_SetParam, before Snd_ReadDriverByte: `4e 71`

## Open questions

- Exact compiler/version (matters for an optional C decomp phase).
- ~~Playable character list for scenario R4 (assumed: Cyclops, Wolverine, Gambit,
  Psylocke, Nightcrawler, Beast, Magneto). Verify and fix `REQUIRED_SCENARIOS`.~~
  Verified on the select screen: exactly those seven. `options-menu` and `continue` name
  features the game does not have; their scenario files cover the nearest real paths
  (title/pause input; game over -> restart) and say so in their headers.
