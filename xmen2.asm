; ===========================================================================
; X-Men 2: Clone Wars (USA, Europe) - Sega Genesis / Mega Drive
; Byte-matching disassembly. Build ONLY with: uv run tools/build.py
; ROM SHA-1 61409e6cf6065ab67d8952b891d8edcf47777193 (supply your own dump)
; ===========================================================================
	cpu 68000
	padding off		; don't pad dc.b
	supmode on		; no privileged-instruction warnings
	listing purecode
	page 0
	include "src/macros.asm"
	include "src/ram.asm"

	org 0
	include "src/header.asm"
	include "src/jumptable.asm"
	include "src/f/005458.asm"
	include "src/f/005466.asm"
	include "src/f/0054C6.asm"
Str_CerebroScreenLogoAndDemo:	; C string "CerebroScreen LogoAndDemo" (used by Scene_RegisterAll)
	incrom	$0057DE,$1A
Str_CerebroScreenPlayerSelect_0057F8:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$0057F8,$1C
Str_CerebroScreenFailure:	; C string "CerebroScreen Failure" (used by Scene_RegisterAll)
	incrom	$005814,$16
Str_CerebroScreenCredits:	; C string "CerebroScreen Credits" (used by Scene_RegisterAll)
	incrom	$00582A,$16
Str_CerebroScreenFinalText:	; C string "CerebroScreen FinalText" (used by Scene_RegisterAll)
	incrom	$005840,$18
Str_CloneA5BroodBoss:	; C string "CloneA5 BroodBoss" (used by Scene_RegisterAll)
	incrom	$005858,$12
Str_CerebroScreenPlayerSelect_00586A:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$00586A,$1C
Str_CloneA2VerticalCorridor1:	; C string "CloneA2 Vertical_Corridor_1" (used by Scene_RegisterAll)
	incrom	$005886,$1C
Str_CerebroScreenPlayerSelect_0058A2:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$0058A2,$1C
Str_CloneA1FactoryFloor1:	; C string "CloneA1 Factory_Floor_1" (used by Scene_RegisterAll)
	incrom	$0058BE,$18
Str_CerebroScreenClone:	; C string "CerebroScreen Clone" (used by Scene_RegisterAll)
	incrom	$0058D6,$14
Str_SpaceA1SpaceElevator:	; C string "SpaceA1 Space_Elevator" (used by Scene_RegisterAll)
	incrom	$0058EA,$18
Str_CerebroScreenPlayerSelect_005902:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005902,$1C
Str_SpaceB1MaintenanceShaft:	; C string "SpaceB1 Maintenance_Shaft" (used by Scene_RegisterAll)
	incrom	$00591E,$1A
Str_CerebroScreenSpace:	; C string "CerebroScreen Space" (used by Scene_RegisterAll)
	incrom	$005938,$14
Str_SavageA4Chamber:	; C string "SavageA4 Chamber" (used by Scene_RegisterAll)
	incrom	$00594C,$12
Str_CerebroScreenPlayerSelect_00595E:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$00595E,$1C
Str_SavageA3Perimeter2:	; C string "SavageA3 Perimeter_2" (used by Scene_RegisterAll)
	incrom	$00597A,$16
Str_CerebroScreenPlayerSelect_005990:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005990,$1C
Str_SavageA2Perimeter1:	; C string "SavageA2 Perimeter_1" (used by Scene_RegisterAll)
	incrom	$0059AC,$16
Str_CerebroScreenPlayerSelect_0059C2:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$0059C2,$1C
Str_SavageB1Jungle2:	; C string "SavageB1 Jungle_2" (used by Scene_RegisterAll)
	incrom	$0059DE,$12
Str_CerebroScreenPlayerSelect_0059F0:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$0059F0,$1C
Str_SavageC1Jungle1:	; C string "SavageC1 Jungle_1" (used by Scene_RegisterAll)
	incrom	$005A0C,$12
Str_CerebroScreenSavage:	; C string "CerebroScreen Savage" (used by Scene_RegisterAll)
	incrom	$005A1E,$16
Str_BaniMazaA2ApocalypseBoss:	; C string "BaniMazaA2 ApocalypseBoss" (used by Scene_RegisterAll)
	incrom	$005A34,$1A
Str_CerebroScreenPlayerSelect_005A4E:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005A4E,$1C
Str_BaniMazaA1MovingBlocks:	; C string "BaniMazaA1 Moving_Blocks" (used by Scene_RegisterAll)
	incrom	$005A6A,$1A
Str_CerebroScreenPlayerSelect_005A84:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005A84,$1C
Str_BaniMazaB2Exterior:	; C string "BaniMazaB2 Exterior" (used by Scene_RegisterAll)
	incrom	$005AA0,$14
Str_CerebroScreenBaniMaza:	; C string "CerebroScreen BaniMaza" (used by Scene_RegisterAll)
	incrom	$005AB4,$18
Str_AvalonA4ThroneRoom:	; C string "AvalonA4 Throne_Room" (used by Scene_RegisterAll)
	incrom	$005ACC,$16
Str_CerebroScreenPlayerSelect_005AE2:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005AE2,$1C
Str_AvalonA3Exodus:	; C string "AvalonA3 Exodus" (used by Scene_RegisterAll)
	incrom	$005AFE,$10
Str_CerebroScreenPlayerSelect_005B0E:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005B0E,$1C
Str_AvalonA2FallingRoom:	; C string "AvalonA2 Falling_Room" (used by Scene_RegisterAll)
	incrom	$005B2A,$16
Str_CerebroScreenPlayerSelect_005B40:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005B40,$1C
Str_AvalonB2InnerShell:	; C string "AvalonB2 InnerShell" (used by Scene_RegisterAll)
	incrom	$005B5C,$14
Str_CerebroScreenPlayerSelect_005B70:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005B70,$1C
Str_AvalonB1Exterior:	; C string "AvalonB1 Exterior" (used by Scene_RegisterAll)
	incrom	$005B8C,$12
Str_CerebroScreenAvalon:	; C string "CerebroScreen Avalon" (used by Scene_RegisterAll)
	incrom	$005B9E,$16
Str_SentinelsB2ExteriorEscape:	; C string "SentinelsB2 Exterior_Escape" (used by Scene_RegisterAll)
	incrom	$005BB4,$1C
Str_SentinelsA1CoolantCore:	; C string "SentinelsA1 CoolantCore" (used by Scene_RegisterAll)
	incrom	$005BD0,$18
Str_CerebroScreenPlayerSelect_005BE8:	; C string "CerebroScreen PlayerSelect" (used by Scene_RegisterAll)
	incrom	$005BE8,$1C
Str_SentinelsB1Exterior3:	; C string "SentinelsB1 Exterior_3" (used by Scene_RegisterAll)
	incrom	$005C04,$18
Str_CerebroScreenPlayerSelect:	; C string, resource name looked up by Scene_RegisterAll
	incrom	$005C1C,$1C
Str_SentinelsD1Exterior1:	; C string, resource name looked up by Scene_RegisterAll
	incrom	$005C38,$18
Str_CerebroScreenSentinels:	; C string, resource name looked up by Scene_RegisterAll
	incrom	$005C50,$18
Str_SiberiaB1Blizzard:	; C string, resource name looked up by Scene_RegisterAll
	incrom	$005C68,$14
	include "src/f/005C7C.asm"
	include "src/f/005CC6.asm"
Sw_005CC6:	; switch table of sub at $005CC6: 4 word offsets from Sw_005CC6-2
	dc.w	loc_005E52-(Sw_005CC6-2), Game_AttractDemoCyclops-(Sw_005CC6-2), Game_AttractDemoPsylocke-(Sw_005CC6-2), Game_AttractDemoBeast-(Sw_005CC6-2)
	include "src/f/005E4E.asm"
	include "src/f/005E6C.asm"
	include "src/f/005EB8.asm"
	include "src/f/005F18.asm"
	include "src/f/005FA2.asm"
	include "src/f/0060B0.asm"
	include "src/f/0060C8.asm"
	include "src/f/0060E0.asm"
	include "src/f/0060F8.asm"
	include "src/f/006110.asm"
	include "src/f/006128.asm"
	include "src/f/006140.asm"
	include "src/f/006158.asm"
	include "src/f/006170.asm"
	include "src/f/006188.asm"
	include "src/f/0061A0.asm"
	include "src/f/0061B8.asm"
	include "src/f/0061D0.asm"
	include "src/f/006242.asm"
Sw_006242:	; switch table of sub at $006242: 6 word offsets from Sw_006242-2
	dc.w	Player1_StartLife_Beast-(Sw_006242-2), Player1_StartLife_Cyclops-(Sw_006242-2), loc_0062BA-(Sw_006242-2), Player1_StartLife_Nightcrawler-(Sw_006242-2)
	dc.w	Player1_StartLife_Psylocke-(Sw_006242-2), Player1_StartLife_Wolverine-(Sw_006242-2)
	include "src/f/0062AE.asm"
	include "src/f/0062BA.asm"
	include "src/f/0062C0.asm"
	include "src/f/0062C6.asm"
	include "src/f/0062CC.asm"
	include "src/f/0062E4.asm"
Sw_0062E4:	; switch table of sub at $0062E4: 6 word offsets from Sw_0062E4-2
	dc.w	loc_006350-(Sw_0062E4-2), loc_006356-(Sw_0062E4-2), loc_00635C-(Sw_0062E4-2), loc_006362-(Sw_0062E4-2)
	dc.w	Player2_StartLife_Psylocke-(Sw_0062E4-2), Player2_StartLife_Wolverine-(Sw_0062E4-2)
	include "src/f/006350.asm"
	include "src/f/006368.asm"
	include "src/f/00636E.asm"
	include "src/f/006386.asm"
	include "src/f/006584.asm"
	include "src/f/006636.asm"
	include "src/f/006672.asm"
	include "src/f/006A20.asm"
	include "src/f/006ABA.asm"
	include "src/f/006B2C.asm"
	include "src/f/006B64.asm"
	include "src/f/006BD0.asm"
Art_AvalonB1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 3082 of 308C bytes used at runtime; read by Nem_DecodeLoop; jt[14] used by AvalonB1_InitIntroPalette, AvalonB1_RunScene, AvalonB2_RunScene
	incrom	$006D22,$308C
Art_AvalonB1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 259 of 25A bytes used at runtime; read by Nem_DecodeLoop; jt[15] used by AvalonB1_RunScene
	incrom	$009DAE,$25A
Art_AvalonA2Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 5344 of 5540 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[16] used by AvalonA2_LoadLevel, AvalonB1_RunScene, AvalonB2_RunScene
	incrom	$00A008,$5540
Art_AvalonB1Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 3A of 52 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[17] used by AvalonB1_RunScene
	incrom	$00F548,$52
	include "src/f/00F59A.asm"
	include "src/f/00F60E.asm"
	include "src/f/00F648.asm"
	include "src/f/00F778.asm"
	include "src/f/00F80A.asm"
	include "src/f/00F896.asm"
	include "src/f/00F942.asm"
	include "src/f/00FA24.asm"
	include "src/f/00FB54.asm"
	include "src/f/00FC12.asm"
	include "src/f/00FCA2.asm"
	include "src/f/00FCE2.asm"
	include "src/f/00FD44.asm"
	include "src/f/00FD78.asm"
	include "src/f/00FDAA.asm"
Tbl_AvalonB1ComputeParallax:	; table read by Scroll_ComputeParallax; 11 of 1A bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax; jt[20] used by AvalonB1_CamHookFinish
	incrom	$00FE78,$1A
Tbl_AvalonB1PalFadeStep:	; table read by AvalonB1_PalFadeStep; 2B of 32 bytes used at runtime; read by AvalonB1_PalFadeStep, AvalonB1_CamHookFadeIn; jt[21] used by AvalonB1_CamHookFadeIn
	incrom	$00FE92,$32
Pal_AvalonB1Cycle:	; palette data read by Pal_CycleStep; 16 of 16 bytes used at runtime; read by Pal_CycleStep; jt[22] used by AvalonB1_CyclePalettes
	incrom	$00FEC4,$16
Pal_AvalonB1Cycle2:	; palette data read by Pal_CycleStep; 1C of 1C bytes used at runtime; read by Pal_CycleStep; jt[23] used by AvalonB1_CyclePalettes
	incrom	$00FEDA,$1C
	include "src/f/00FEF6.asm"
Str_Empty_00FFAC:	; C string "" (used by BigAcolyte_RenderScaled)
	incrom	$00FFAC,$2
	include "src/f/00FFAE.asm"
	include "src/f/00FFBC.asm"
	include "src/f/010050.asm"
	include "src/f/010098.asm"
	include "src/f/0100D4.asm"
	include "src/f/01014C.asm"
	include "src/f/0101CE.asm"
	include "src/f/0101DC.asm"
	include "src/f/0101E8.asm"
	include "src/f/0101F4.asm"
	include "src/f/01033E.asm"
	include "src/f/01038A.asm"
	include "src/f/0103B6.asm"
	include "src/f/0103F0.asm"
	include "src/f/01042C.asm"
	include "src/f/0106B8.asm"
	include "src/f/0107EA.asm"
	include "src/f/0108CE.asm"
	include "src/f/01091E.asm"
	include "src/f/01096E.asm"
	include "src/f/01098E.asm"
	include "src/f/010B00.asm"
	include "src/f/010B3C.asm"
	include "src/f/010D76.asm"
	include "src/f/010DB2.asm"
	include "src/f/010E26.asm"
	include "src/f/010EE6.asm"
	include "src/f/011238.asm"
	include "src/f/0112E8.asm"
	include "src/f/01134E.asm"
	include "src/f/0113A6.asm"
	include "src/f/0113E6.asm"
	include "src/f/011452.asm"
	include "src/f/011488.asm"
	include "src/f/011598.asm"
	include "src/f/0115EA.asm"
	include "src/f/01163C.asm"
	include "src/f/011702.asm"
	include "src/f/011736.asm"
	include "src/f/01176C.asm"
	include "src/f/0117A2.asm"
	include "src/f/0117D8.asm"
	include "src/f/01180E.asm"
	include "src/f/011862.asm"
	include "src/f/0118B6.asm"
Tbl_BigAcBullet_vtable:	; class descriptor of BIGACBULLET: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0118BE,$7A
Tbl_BigAcolyte_vtable:	; class descriptor of BIGACOLYTE: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$011938,$8D
Pad_BigAcolyte:	; $00 fill; never read in the corpus; between BigAcolyte_NopStatic and BigAcolyte_IntroScript
	incrom	$0119C5,$1
Tbl_BigAcolyteAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[54] used by BigAcolyte_StateBecomeSprite, BigAcolyte_StateShoot
	incrom	$0119C6,$A
Tbl_BigAcolyteAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[55] used by BigAcolyte_StateShootAnim
	incrom	$0119D0,$A
Tbl_BigAcBulletAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[56] used by BigAcBullet_StateLaunch
	incrom	$0119DA,$A
Tbl_BigAcolyteIntroScriptLen:	; word 6: entry count of the BIGACOLYTE intro AI script (6 jmp thunks follow at BigAcolyte_IntroScript)
	incrom	$0119E4,$2
	include "src/f/0119E6.asm"
Tbl_BigAcolyteFightScriptLen:	; word $14: entry count of the BIGACOLYTE fight AI script (jt[58]); 20 jmp thunks follow at BigAcolyte_FightScript
	incrom	$0119FE,$1
	incrom	$0119FF,$1
	include "src/f/011A00.asm"
	incrom	$011A50,$626
Art_BigAcolyteSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; F00 of 1024 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $ACE0-B600; jt[60] used by BigAcolyte_Init
	incrom	$012076,$1024
Art_BigAcBulletSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 240 of 2A8 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BFE0-C100; jt[61] used by BigAcBullet_Init
	incrom	$01309A,$2A8
	include "src/f/013342.asm"
	include "src/f/013350.asm"
	include "src/f/013358.asm"
	include "src/f/013360.asm"
	include "src/f/013596.asm"
	include "src/f/013698.asm"
	include "src/f/0136F0.asm"
	include "src/f/013722.asm"
Sw_013722:	; switch table of sub at $013722: 4 word offsets from Sw_013722-2
	dc.w	loc_01377A-(Sw_013722-2), CapedAcolyte_OnHurt_KnockRight-(Sw_013722-2), loc_013772-(Sw_013722-2), CapedAcolyte_OnHurt_KnockY-(Sw_013722-2)
	include "src/f/01376A.asm"
	include "src/f/013782.asm"
	include "src/f/013788.asm"
	include "src/f/0137C4.asm"
	include "src/f/0137EE.asm"
	include "src/f/0138D4.asm"
	include "src/f/01396E.asm"
	include "src/f/0139BE.asm"
	include "src/f/013A5C.asm"
	include "src/f/013A86.asm"
	include "src/f/013BAE.asm"
	include "src/f/013D26.asm"
	include "src/f/013D50.asm"
	include "src/f/013DB0.asm"
Tbl_CapedAcolyte_vtable:	; class descriptor of CAPEDACOLYTE: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$013E10,$8F
Pad_CapedAcolyte:	; $00 fill; never read in the corpus; between CapedAcolyte_ActAnimLow and CapedAcolyte_IntroScript
	incrom	$013E9F,$1
Tbl_CapedAcolyteAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 5 of 8 bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[77] used by CapedAcolyte_Init
	incrom	$013EA0,$8
Tbl_CapedAcolyteAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[78] used by CapedAcolyte_ActAnimHigh, CapedAcolyte_StateShoot
	incrom	$013EA8,$E
Tbl_CapedAcolyteAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, CapedAcolyte_ActAnimHigh; jt[79] used by CapedAcolyte_ActAnimLow, CapedAcolyte_StateShoot
	incrom	$013EB6,$E
Tbl_CapedAcolyteIntroScriptLen:	; word 3: entry count of the CAPEDACOLYTE intro AI script (3 jmp thunks follow at CapedAcolyte_IntroScript)
	incrom	$013EC4,$2
	include "src/f/013EC6.asm"
Tbl_CapedAcolyteMainScriptLen:	; word 5: entry count of the CAPEDACOLYTE main AI script (jt[81]); 5 jmp thunks follow at CapedAcolyte_MainScript
	incrom	$013ED2,$1
Tbl_CapedAcolyteActAnimLow:	; table read by CapedAcolyte_ActAnimLow; 1 of 1 bytes used at runtime; read by CapedAcolyte_ActAnimLow
	incrom	$013ED3,$1
	include "src/f/013ED4.asm"
	include "src/f/013EE4.asm"
Tbl_CapedAcolyteTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 3 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, CapedAcolyte_Init, Spr_Init; jt[82] used by CapedAcolyte_Init
	incrom	$013EE8,$8
Art_CapedAcolyteSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 25C0 of 2B18 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BC20-C780; jt[83] used by CapedAcolyte_Init
	incrom	$013EF0,$2B18
Art_FarAcolyteSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 480 of 53C bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BC20-C260; jt[84] used by FarAcolyte_Init
	incrom	$016A08,$53C
Art_FarAcolyteSpr2:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 24D of 24E bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop, Nem_BuildCodeTable; jt[85] used by FarAcolyte_ClassInit
	incrom	$016F44,$24E
Art_FarAcolyteSpr3:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 85 of 86 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_DecodeLoop_Inline; jt[86] used by FarAcolyte_ClassInit
	incrom	$017192,$86
	include "src/f/017218.asm"
	include "src/f/017226.asm"
	include "src/f/01723C.asm"
	include "src/f/017244.asm"
	include "src/f/017274.asm"
	include "src/f/01738E.asm"
	include "src/f/017506.asm"
	include "src/f/017706.asm"
	include "src/f/0178C6.asm"
	include "src/f/01790E.asm"
	include "src/f/0179F8.asm"
	include "src/f/017A72.asm"
	include "src/f/017AF4.asm"
	include "src/f/017BB6.asm"
	include "src/f/017BEC.asm"
	include "src/f/017C60.asm"
	include "src/f/017CEA.asm"
	include "src/f/017D2C.asm"
	include "src/f/017D60.asm"
	include "src/f/017DDC.asm"
Tbl_FarAcolyte_vtable:	; class descriptor of FARACOLYTE: word name offset $7E, parent ACTOR, 30 method slots from +6, then the name (tools/classes.py)
	incrom	$017E28,$89
Pad_FarAcolyte:	; $00 fill; never read in the corpus; between FarAcolyte_StateDie and ShootAcolyte_GetSize
	incrom	$017EB1,$1
Tbl_CapedAcolyteMove:	; table read by CapedAcolyte_Move; 122 of 124 bytes used at runtime; read by CapedAcolyte_Move, FarAcolyte_Move; jt[100] used by CapedAcolyte_Init, CapedAcolyte_Move, FarAcolyte_Init
	incrom	$017EB2,$124
	include "src/f/017FD6.asm"
	include "src/f/017FE4.asm"
	include "src/f/017FFA.asm"
	include "src/f/018002.asm"
	include "src/f/01800A.asm"
	include "src/f/01818A.asm"
	include "src/f/0181F8.asm"
	include "src/f/01823C.asm"
	include "src/f/018290.asm"
	include "src/f/01830A.asm"
	include "src/f/018344.asm"
	include "src/f/0184A4.asm"
	include "src/f/0184CE.asm"
	include "src/f/018504.asm"
	include "src/f/0185BE.asm"
Tbl_ShootAcolyte_vtable:	; class descriptor of SHOOTACOLYTE: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$018644,$8F
Pad_ShootAcolyte:	; $00 fill; never read in the corpus; between ShootAcolyte_StateNextShot and ShootAcolyte_Script
	incrom	$0186D3,$1
Tbl_ShootAcolyteAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[112] used by ShootAcolyte_StateWalkToPlayer
	incrom	$0186D4,$12
Tbl_ShootAcolyteAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[113] used by ShootAcolyte_StateAim
	incrom	$0186E6,$A
Tbl_ShootAcolyteAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[114] used by ShootAcolyte_StateFire
	incrom	$0186F0,$8
Tbl_ShootAcolyteScriptLen:	; word 4: entry count of the SHOOTACOLYTE AI script (jmp thunks follow at ShootAcolyte_Script)
	incrom	$0186F8,$2
	include "src/f/0186FA.asm"
	include "src/f/018706.asm"
Tbl_ShootAcolyteTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 6 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, XNpc_KnockbackDist, ShootAcolyte_Init; jt[116] used by ShootAcolyte_Init
	incrom	$01870A,$8
Art_ShootAcolyteSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1C60 of 2390 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BA60-C920; jt[117] used by ShootAcolyte_Init
	incrom	$018712,$2390
	include "src/f/01AAA2.asm"
	include "src/f/01AAB0.asm"
	include "src/f/01AABC.asm"
	include "src/f/01AB96.asm"
	include "src/f/01ABBC.asm"
Tbl_Tower_vtable:	; class descriptor of TOWER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$01ABC4,$74
Tbl_TowerAnim3:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[122] used by Tower_Init -> Obj_SetAnim
	incrom	$01AC38,$8
Tbl_TowerAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 7E of 80 bytes used at runtime; read by Anim_ApplyStep; jt[123] used by Tower_Init
	incrom	$01AC40,$80
Tbl_TowerAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 2C of 60 bytes used at runtime; read by Anim_ApplyStep; jt[124] used by Tower_Init
	incrom	$01ACC0,$60
Art_TowerSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; EE0 of 12D8 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BA60-BF20; jt[125] used by Tower_Init
	incrom	$01AD20,$12D8
	include "src/f/01BFF8.asm"
	include "src/f/01C006.asm"
	include "src/f/01C01C.asm"
	include "src/f/01C024.asm"
	include "src/f/01C042.asm"
Sw_01C042:	; switch table of sub at $01C042: 5 word offsets from Sw_01C042-2
	dc.w	YoyoAcolyte_Init_Script0-(Sw_01C042-2), YoyoAcolyte_Init_Script1to4-(Sw_01C042-2), loc_01C18E-(Sw_01C042-2), loc_01C19A-(Sw_01C042-2)
	dc.w	loc_01C1A6-(Sw_01C042-2)
	include "src/f/01C176.asm"
	include "src/f/01C182.asm"
	include "src/f/01C1B0.asm"
	include "src/f/01C1DA.asm"
	include "src/f/01C24C.asm"
	include "src/f/01C282.asm"
	include "src/f/01C552.asm"
	include "src/f/01C612.asm"
	include "src/f/01C64C.asm"
	include "src/f/01C6BE.asm"
	include "src/f/01C6E8.asm"
	include "src/f/01C77C.asm"
	include "src/f/01C7B2.asm"
	include "src/f/01C7E6.asm"
	include "src/f/01C81C.asm"
	include "src/f/01C850.asm"
	include "src/f/01C886.asm"
	include "src/f/01C8BA.asm"
	include "src/f/01C94A.asm"
Tbl_YoyoAcolyte_vtable:	; class descriptor of YOYOACOLYTE: word name offset $86, parent BIONPC, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$01C9A2,$92
Tbl_YoyoAcolyteAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[140] used by YoyoAcolyte_ActIdle100, YoyoAcolyte_StateIdleNext
	incrom	$01CA34,$12
Tbl_YoyoAcolyteAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[141] used by YoyoAcolyte_ActThrowHigh, YoyoAcolyte_ActThrowLevel, YoyoAcolyte_ActThrowLow
	incrom	$01CA46,$8
Tbl_YoyoAcolyteScriptLevelLen:	; word 2: entry count of a YOYOACOLYTE AI script (jt[142]): ThrowLevel, Idle (YoyoAcolyte_ScriptLevel)
	incrom	$01CA4E,$2
	include "src/f/01CA50.asm"
Tbl_YoyoAcolyteScriptHighLen:	; word 2: entry count of a YOYOACOLYTE AI script (jt[143]): ThrowHigh, Idle (YoyoAcolyte_ScriptHigh)
	incrom	$01CA58,$1
Tbl_YoyoAcolyteStateYoyoOut:	; table read by YoyoAcolyte_StateYoyoOut; 1 of 1 bytes used at runtime; read by YoyoAcolyte_StateYoyoOut
	incrom	$01CA59,$1
	include "src/f/01CA5A.asm"
Tbl_YoyoAcolyteScriptLowLen:	; word 2: entry count of a YOYOACOLYTE AI script (jt[144]): ThrowLow, Idle (YoyoAcolyte_ScriptLow)
	incrom	$01CA62,$1
Tbl_YoyoAcolyteStateYoyoOut2:	; table read by YoyoAcolyte_StateYoyoOut; 1 of 1 bytes used at runtime; read by YoyoAcolyte_StateYoyoOut
	incrom	$01CA63,$1
	include "src/f/01CA64.asm"
Tbl_YoyoAcolyteScriptMixALen:	; word 6: entry count of a YOYOACOLYTE AI script (jt[145]): Level, Idle, High, Idle, Low, Idle (YoyoAcolyte_ScriptMixA)
	incrom	$01CA6C,$1
Tbl_YoyoAcolyteStateYoyoOut3:	; table read by YoyoAcolyte_StateYoyoOut; 1 of 1 bytes used at runtime; read by YoyoAcolyte_StateYoyoOut
	incrom	$01CA6D,$1
	include "src/f/01CA6E.asm"
Tbl_YoyoAcolyteStateYoyoOut4:	; table read by YoyoAcolyte_StateYoyoOut; 2 of 2 bytes used at runtime; read by YoyoAcolyte_StateYoyoOut; jt[146] used by YoyoAcolyte_Init_Script1to4
	incrom	$01CA86,$2
	include "src/f/01CA88.asm"
Tbl_YoyoAcolyteInit:	; table read by YoyoAcolyte_Init; 5 of 8 bytes used at runtime; read by YoyoAcolyte_Init, XNpc_TakeDamage_Hurt; jt[147] used by YoyoAcolyte_Init
	incrom	$01CAA0,$8
Art_YoyoAcolyteSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2180 of 2774 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BA60-C760; jt[148] used by YoyoAcolyte_Init
	incrom	$01CAA8,$2774
Lvl_YoyoAcolyteSegs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 381 of 382 bytes used at runtime; read by Seg_LoadList, Nem_DecodeLoop, VDP_FlushDmaQueue; jt[149] used by YoyoAcolyte_ClassInit
	incrom	$01F21C,$382
Lvl_AvalonB2Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 29F of 2A0 bytes used at runtime; read by Seg_LoadList, Nem_DecodeLoop; jt[150] used by AvalonB2_RunScene
	incrom	$01F59E,$2A0
Map_AvalonB2Eni:	; Enigma-compressed tilemap (Eni_Decode); 2002 of 224E bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Eni_Ops; jt[151] used by AvalonB2_RunScene
	incrom	$01F83E,$224E
Map_AvalonB2Eni2:	; Enigma-compressed tilemap (Eni_Decode); 3E of 56 bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Eni_Ops; jt[152] used by AvalonB2_RunScene
	incrom	$021A8C,$56
Art_AvalonB2Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 40F of 45C bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; jt[153] used by AvalonB2_InitSprite
	incrom	$021AE2,$45C
Art_BigAcolyteSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 774 of 774 bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; jt[154] used by BigAcolyte_LoadSprite
	incrom	$021F3E,$774
	include "src/f/0226B2.asm"
	include "src/f/0226D0.asm"
	include "src/f/0226F4.asm"
	include "src/f/022716.asm"
	include "src/f/022742.asm"
	include "src/f/0227A4.asm"
	include "src/f/0227D8.asm"
	include "src/f/0227E0.asm"
	include "src/f/0228C2.asm"
	include "src/f/0228CA.asm"
	include "src/f/0228DC.asm"
	incrom	$0228E2,$76
	include "src/f/022958.asm"
	include "src/f/02295C.asm"
	include "src/f/0229E8.asm"
	include "src/f/022A1C.asm"
	include "src/f/022A4E.asm"
	include "src/f/022ADA.asm"
	include "src/f/022AE2.asm"
	include "src/f/022AF6.asm"
	include "src/f/022B18.asm"
	include "src/f/022B2E.asm"
	include "src/f/022B4E.asm"
	include "src/f/022B66.asm"
	include "src/f/022B76.asm"
	include "src/f/022B7E.asm"
	include "src/f/022BA2.asm"
Tbl_AvalonA2LoadLevel:	; table read by AvalonA2_LoadLevel; 20 of 20 bytes used at runtime; read by AvalonA2_LoadLevel, Scroll_SetParallax; jt[157] used by AvalonA2_LoadLevel, AvalonA3_LoadLevel
	incrom	$022BCA,$20
Tbl_AvalonA2ComputeParallax:	; table read by Scroll_ComputeParallax; 25 of 3A bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax, AvalonA2_LoadLevel; jt[158] used by AvalonA2_InstallHooks
	incrom	$022BEA,$3A
Art_AvalonA2Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2664 of 266E bytes used at runtime; read by Nem_DecodeLoop; jt[159] used by AvalonA2_LoadLevel, AvalonA3_LoadLevel
	incrom	$022C24,$266E
Art_AvalonA2Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); D3 of D4 bytes used at runtime; read by Nem_DecodeLoop; jt[160] used by AvalonA2_LoadLevel
	incrom	$025292,$D4
Map_AvalonA2Eni:	; Enigma-compressed tilemap (Eni_Decode); 104A of 143A bytes used at runtime; read by Eni_Decode, Eni_ReadInline, Eni_Ops; jt[161] used by AvalonA2_LoadLevel
	incrom	$025366,$143A
Map_AvalonA2Eni2:	; Enigma-compressed tilemap (Eni_Decode); 36 of 4E bytes used at runtime; read by Eni_Decode, Eni_ReadInline, Eni_Ops; jt[162] used by AvalonA2_LoadLevel
	incrom	$0267A0,$4E
Art_RetractFloorSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 10F of 110 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[163] used by RetractFloor_ClassInit
	incrom	$0267EE,$110
	include "src/f/0268FE.asm"
	include "src/f/02690C.asm"
	include "src/f/0269CE.asm"
	include "src/f/0269E4.asm"
	include "src/f/0269EC.asm"
	include "src/f/026A0A.asm"
	include "src/f/026AA0.asm"
	include "src/f/026CFA.asm"
	include "src/f/026D8E.asm"
	include "src/f/026DB2.asm"
	include "src/f/026E10.asm"
	include "src/f/026ED8.asm"
	include "src/f/026F2E.asm"
Tbl_RetractFloor_vtable:	; class descriptor of RETRACTFLOOR: word name offset $72, parent ACTOR, 27 method slots from +6, then the name (tools/classes.py)
	incrom	$026F4A,$7F
Pad_Zapper:	; $00 fill; never read in the corpus; between RetractFloor_StateKill and Zapper_GetSize
	incrom	$026FC9,$1
Art_ZapperSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 265 of 266 bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop; jt[173] used by Zapper_ClassInit
	incrom	$026FCA,$266
	include "src/f/027230.asm"
	include "src/f/02723E.asm"
	include "src/f/027254.asm"
	include "src/f/02725C.asm"
	include "src/f/02727A.asm"
	include "src/f/027352.asm"
	include "src/f/027388.asm"
	include "src/f/0273BE.asm"
Tbl_Zapper_vtable:	; class descriptor of ZAPPER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0273F4,$75
Pad_AvalonA3:	; $00 fill; never read in the corpus; between Zapper_StateLoopAnim2 and AvalonA3_EmptyStub2
	incrom	$027469,$1
Tbl_AvalonA3Anim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[180] used by Zapper_StateLoopAnim0
	incrom	$02746A,$A
Tbl_AvalonA3Anim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[181] used by Zapper_StateLoopAnim1
	incrom	$027474,$A
Lvl_AvalonA3Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 8 of A bytes used at runtime; read by Seg_LoadList, Anim_ApplyStep, Anim_AdvanceByDistance; jt[182] used by Zapper_StateLoopAnim2
	incrom	$02747E,$A
Lvl_AvalonA3Segs2:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 9B of 9C bytes used at runtime; read by Seg_LoadList; jt[183] used by AvalonA3_LoadLevel
	incrom	$027488,$9C
Lvl_AvalonA3Map:	; level map blob, Enigma-compressed layout (NOTES: Level map / tileset blobs); 1E8 of 1FC bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Level_Load; jt[184] used by AvalonA3_LoadLevel
	incrom	$027524,$1FC
Lvl_AvalonA3Map2:	; level map blob, Enigma-compressed layout (NOTES: Level map / tileset blobs); E of 26 bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Eni_Ops; jt[185] used by AvalonA3_LoadLevel
	incrom	$027720,$26
Art_ExodusSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3291 of 3292 bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop; jt[186] used by Exodus_ClassInit
	incrom	$027746,$3292
Art_ExodusBlastNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 9ED of 9EE bytes used at runtime; read by Nem_DecodeLoop; jt[187] used by ExodusBlast_ClassInit
	incrom	$02A9D8,$9EE
Art_AvalonA3Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; C00 of 153C bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $22A0-26A0; jt[188] used by AvalonA3_InitSprites
	incrom	$02B3C6,$153C
	include "src/f/02C902.asm"
	include "src/f/02C90A.asm"
	include "src/f/02C9AA.asm"
	include "src/f/02CAF0.asm"
	include "src/f/02CBA8.asm"
	include "src/f/02CBBE.asm"
	include "src/f/02CBD0.asm"
	include "src/f/02CBF6.asm"
	include "src/f/02CC5C.asm"
	include "src/f/02CD30.asm"
	include "src/f/02CD38.asm"
	include "src/f/02CD48.asm"
	include "src/f/02CD50.asm"
	include "src/f/02CD96.asm"
	include "src/f/02CDA4.asm"
	include "src/f/02CDCA.asm"
	include "src/f/02CE1A.asm"
	include "src/f/02CE52.asm"
Sw_02CE52:	; switch table of sub at $02CE52: 6 word offsets from Sw_02CE52-2
	dc.w	Exodus_NextPattern_part3-(Sw_02CE52-2), Exodus_NextPattern_part1-(Sw_02CE52-2), loc_02CEA8-(Sw_02CE52-2), Exodus_NextPattern_part2-(Sw_02CE52-2)
	dc.w	loc_02CED0-(Sw_02CE52-2), loc_02CEE4-(Sw_02CE52-2)
	incrom	$02CE92,$2
	include "src/f/02CE94.asm"
	include "src/f/02CEBC.asm"
	include "src/f/02CEF6.asm"
	include "src/f/02CF04.asm"
Sw_02CF04:	; switch table of sub at $02CF04: 6 word offsets from Sw_02CF04-2
	dc.w	Exodus_StateNextAttack_part1-(Sw_02CF04-2), Exodus_StateNextAttack_part4-(Sw_02CF04-2), loc_02D024-(Sw_02CF04-2), loc_02D06E-(Sw_02CF04-2)
	dc.w	Exodus_StateNextAttack_part5-(Sw_02CF04-2), loc_02D0FC-(Sw_02CF04-2)
	include "src/f/02CF34.asm"
Sw_02CF34:	; switch table of sub at $02CF34: 6 word offsets from Sw_02CF34-2
	dc.w	Exodus_StateNextAttack_part2-(Sw_02CF34-2), loc_02CF7A-(Sw_02CF34-2), loc_02CF90-(Sw_02CF34-2), loc_02CFA6-(Sw_02CF34-2)
	dc.w	loc_02CFBC-(Sw_02CF34-2), loc_02CFD2-(Sw_02CF34-2)
	include "src/f/02CF64.asm"
	include "src/f/02CFE8.asm"
	include "src/f/02CFF4.asm"
	include "src/f/02D0B8.asm"
	include "src/f/02D13E.asm"
	include "src/f/02D146.asm"
	include "src/f/02D1A6.asm"
	include "src/f/02D21C.asm"
	include "src/f/02D27A.asm"
	include "src/f/02D2D8.asm"
	include "src/f/02D336.asm"
	include "src/f/02D372.asm"
	include "src/f/02D3AE.asm"
	include "src/f/02D456.asm"
	include "src/f/02D4BA.asm"
	include "src/f/02D522.asm"
	include "src/f/02D552.asm"
	include "src/f/02D5EA.asm"
	include "src/f/02D61C.asm"
	include "src/f/02D658.asm"
	include "src/f/02D6D8.asm"
	include "src/f/02D720.asm"
	include "src/f/02D756.asm"
	include "src/f/02D75E.asm"
	include "src/f/02D78E.asm"
	include "src/f/02D7B2.asm"
	include "src/f/02D7C8.asm"
	include "src/f/02D91C.asm"
	include "src/f/02D96C.asm"
	include "src/f/02DA16.asm"
	include "src/f/02DADE.asm"
Sw_02DADE:	; switch table of sub at $02DADE: 5 word offsets from Sw_02DADE-2
	dc.w	Exodus_TakeDamage_part1-(Sw_02DADE-2), Exodus_TakeDamage_part2-(Sw_02DADE-2), loc_02DB7A-(Sw_02DADE-2), Exodus_TakeDamage_part3-(Sw_02DADE-2)
	dc.w	Exodus_TakeDamage_part4-(Sw_02DADE-2)
	include "src/f/02DB62.asm"
	include "src/f/02DB70.asm"
	include "src/f/02DB84.asm"
	include "src/f/02DB8E.asm"
	include "src/f/02DB98.asm"
	include "src/f/02DBCE.asm"
	include "src/f/02DC80.asm"
	include "src/f/02DC9E.asm"
	include "src/f/02DCE4.asm"
	include "src/f/02DDDC.asm"
Tbl_Exodus_vtable:	; class descriptor of EXODUS: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$02DEB4,$75
Pad_ExodusBlast:	; $00 fill; never read in the corpus; between Exodus_CheckFloorHit and ExodusBlast_GetSize
	incrom	$02DF29,$1
Tbl_ExodusBlastAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 24 of 26 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[204] used by Exodus_StateDescend, Exodus_StateEndVulnerable
	incrom	$02DF2A,$26
Tbl_ExodusBlastAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[205] used by Exodus_AtkBlast17
	incrom	$02DF50,$E
Tbl_ExodusBlastAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep; jt[206] used by Exodus_AtkBlast2
	incrom	$02DF5E,$E
Tbl_ExodusBlastAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[207] used by Exodus_AtkBlast3
	incrom	$02DF6C,$E
Tbl_ExodusBlastAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[208] used by Exodus_AtkBlast4
	incrom	$02DF7A,$E
Tbl_ExodusBlastAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep; jt[209] used by Exodus_StateSwoopBlast
	incrom	$02DF88,$E
	include "src/f/02DF96.asm"
	include "src/f/02DFA4.asm"
	include "src/f/02DFD8.asm"
Sw_02DFD8:	; switch table of sub at $02DFD8: 7 word offsets from Sw_02DFD8-2
	dc.w	ExodusBlast_StateLaunch_part1-(Sw_02DFD8-2), loc_02E03A-(Sw_02DFD8-2), ExodusBlast_StateLaunch_part2-(Sw_02DFD8-2), ExodusBlast_StateLaunch_part3-(Sw_02DFD8-2)
	dc.w	loc_02E076-(Sw_02DFD8-2), loc_02E08A-(Sw_02DFD8-2), loc_02E09E-(Sw_02DFD8-2)
	include "src/f/02E026.asm"
	include "src/f/02E04E.asm"
	include "src/f/02E062.asm"
	include "src/f/02E0B0.asm"
	include "src/f/02E0B8.asm"
	include "src/f/02E0F0.asm"
	include "src/f/02E128.asm"
	include "src/f/02E168.asm"
	include "src/f/02E1A8.asm"
	include "src/f/02E1E0.asm"
	include "src/f/02E218.asm"
	include "src/f/02E250.asm"
	include "src/f/02E282.asm"
	include "src/f/02E2B4.asm"
	include "src/f/02E2E6.asm"
	include "src/f/02E306.asm"
	include "src/f/02E30E.asm"
	include "src/f/02E332.asm"
	include "src/f/02E492.asm"
	include "src/f/02E4A8.asm"
	include "src/f/02E526.asm"
Tbl_ExodusBlast_vtable:	; class descriptor of EXODUSBLAST: word name offset $82, parent XNPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$02E566,$8E
Tbl_AvalonA4Anim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[218] used by ExodusBlast_StateLaunch
	incrom	$02E5F4,$E
Art_AvalonA4Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 14E0 of 14EA bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[219] used by AvalonA4_LoadLevel
	incrom	$02E602,$14EA
Art_AvalonA4Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); FB of FC bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[220] used by AvalonA4_LoadLevel
	incrom	$02FAEC,$FC
Art_AvalonA3Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 50C4 of 5128 bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[221] used by AvalonA3_LoadLevel, AvalonA4_LoadLevel
	incrom	$02FBE8,$5128
Art_AvalonA4Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 1A of 32 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[222] used by AvalonA4_LoadLevel
	incrom	$034D10,$32
	incrom	$034D42,$C
	include "src/f/034D4E.asm"
	include "src/f/034D56.asm"
	include "src/f/034D7A.asm"
Sw_034D7A:	; switch table of sub at $034D7A: 6 word offsets from Sw_034D7A-2
	dc.w	AvalonA4_AnimatePalettes_part1-(Sw_034D7A-2), loc_034E14-(Sw_034D7A-2), loc_034E30-(Sw_034D7A-2), loc_034E4C-(Sw_034D7A-2)
	dc.w	loc_034E68-(Sw_034D7A-2), loc_034E84-(Sw_034D7A-2)
	include "src/f/034DF8.asm"
	include "src/f/034EA0.asm"
Sw_034EA0:	; switch table of sub at $034EA0: 6 word offsets from Sw_034EA0-2
	dc.w	AvalonA4_AnimatePalettes_part3-(Sw_034EA0-2), loc_034EE2-(Sw_034EA0-2), loc_034EFC-(Sw_034EA0-2), loc_034F16-(Sw_034EA0-2)
	dc.w	loc_034F30-(Sw_034EA0-2), loc_034F4A-(Sw_034EA0-2)
	include "src/f/034EC6.asm"
	include "src/f/034F62.asm"
Sw_034F62:	; switch table of sub at $034F62: 15 word offsets from Sw_034F62-2
	dc.w	AvalonA4_AnimatePalettes_part5-(Sw_034F62-2), loc_034FF8-(Sw_034F62-2), loc_035014-(Sw_034F62-2), loc_035030-(Sw_034F62-2)
	dc.w	loc_03504C-(Sw_034F62-2), loc_035068-(Sw_034F62-2), loc_035084-(Sw_034F62-2), loc_0350A0-(Sw_034F62-2)
	dc.w	loc_0350BC-(Sw_034F62-2), loc_0350D8-(Sw_034F62-2), loc_0350F4-(Sw_034F62-2), loc_03510E-(Sw_034F62-2)
	dc.w	loc_035128-(Sw_034F62-2), loc_035142-(Sw_034F62-2), loc_03515C-(Sw_034F62-2)
	include "src/f/034FDC.asm"
	include "src/f/035174.asm"
	include "src/f/03518C.asm"
	include "src/f/0351F8.asm"
	include "src/f/035322.asm"
	include "src/f/0355A6.asm"
	include "src/f/035710.asm"
	include "src/f/035750.asm"
	include "src/f/035782.asm"
	include "src/f/035802.asm"
	include "src/f/03582E.asm"
	include "src/f/03585C.asm"
	include "src/f/035872.asm"
Sw_035872:	; switch table of sub at $035872: 6 word offsets from Sw_035872-2
	dc.w	AvalonA4_ClearCameraZone_case0-(Sw_035872-2), loc_0358A0-(Sw_035872-2), loc_0358A4-(Sw_035872-2), AvalonA4_ClearCameraZone_case3-(Sw_035872-2)
	dc.w	AvalonA4_ClearCameraZone_case4-(Sw_035872-2), AvalonA4_ClearCameraZone_case5-(Sw_035872-2)
	include "src/f/03589C.asm"
	include "src/f/0358A8.asm"
	include "src/f/0358AC.asm"
	include "src/f/0358B0.asm"
	include "src/f/0358B2.asm"
	include "src/f/0358D8.asm"
Sw_0358D8:	; switch table of sub at $0358D8: 6 word offsets from Sw_0358D8-2
	dc.w	AvalonA4_SetCameraZone_case0-(Sw_0358D8-2), loc_03595A-(Sw_0358D8-2), loc_03595E-(Sw_0358D8-2), AvalonA4_SetCameraZone_case3-(Sw_0358D8-2)
	dc.w	AvalonA4_SetCameraZone_case4-(Sw_0358D8-2), loc_03596A-(Sw_0358D8-2)
	include "src/f/035956.asm"
	include "src/f/035962.asm"
	include "src/f/035966.asm"
	include "src/f/03596C.asm"
	include "src/f/03597A.asm"
	include "src/f/03599A.asm"
	include "src/f/0359BA.asm"
	include "src/f/0359DA.asm"
	include "src/f/0359FA.asm"
	include "src/f/035A1A.asm"
	include "src/f/035A3A.asm"
	include "src/f/035A76.asm"
	include "src/f/035A7E.asm"
	include "src/f/035A86.asm"
	include "src/f/035A9E.asm"
Tbl_MagnetoBossAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[227] used by MagnetoBoss_TakeDamage
	incrom	$035AC6,$A
Tbl_AvalonA4Anim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, MagnetoBoss_RubbleTimer, Cam_ShakeStep; jt[228] used by MagnetoBoss_EnterSpinState, MagnetoBoss_StateSpin
	incrom	$035AD0,$10
	incrom	$035AE0,$20
Tbl_AvalonA4ShakeStep:	; table read by Cam_ShakeStep; D of E bytes used at runtime; read by Cam_ShakeStep; jt[231] used by MagnetoBoss_StateIntroShake2
	incrom	$035B00,$E
Tbl_AvalonA4ShakeStep2:	; table read by Cam_ShakeStep; D of E bytes used at runtime; read by Cam_ShakeStep; jt[232] used by MagnetoBoss_StateIntroShake3
	incrom	$035B0E,$E
Tbl_MagnetoBossMove:	; table read by MagnetoBoss_Move; 40 of 40 bytes used at runtime; read by MagnetoBoss_Move; jt[233] used by MagnetoBoss_Init
	incrom	$035B1C,$40
Tbl_MagnetoBoss_vtable:	; class descriptor of MAGNETOBOSS: word name offset $72, parent ACTOR, 27 method slots from +6, then the name (tools/classes.py)
	incrom	$035B5C,$7E
	include "src/f/035BDA.asm"
	include "src/f/035BE8.asm"
	include "src/f/035DC2.asm"
	include "src/f/03603E.asm"
	include "src/f/036054.asm"
	include "src/f/03605C.asm"
Str_Empty_0360A4:	; C string "" (used by MagnetoBoss_ClassInit)
	incrom	$0360A4,$2
	include "src/f/0360A6.asm"
	include "src/f/03628E.asm"
	include "src/f/0363A2.asm"
	include "src/f/03645C.asm"
Sw_03645C:	; switch table of sub at $03645C: 4 word offsets from Sw_03645C-2
	dc.w	loc_0365FA-(Sw_03645C-2), loc_036544-(Sw_03645C-2), MagnetoBoss_Move_part1-(Sw_03645C-2), loc_0366B2-(Sw_03645C-2)
	incrom	$03653A,$4
	include "src/f/03653E.asm"
	include "src/f/0366E6.asm"
	include "src/f/036730.asm"
	include "src/f/0367B6.asm"
	include "src/f/0367C0.asm"
	include "src/f/0368D0.asm"
	include "src/f/0369F0.asm"
	include "src/f/036AC6.asm"
	include "src/f/036B10.asm"
	include "src/f/036B34.asm"
	include "src/f/036C0A.asm"
	include "src/f/036C58.asm"
	include "src/f/036C9E.asm"
	include "src/f/036CCA.asm"
	include "src/f/036D10.asm"
	include "src/f/036D3C.asm"
	include "src/f/036DC4.asm"
	include "src/f/036DF0.asm"
	include "src/f/036E82.asm"
	include "src/f/036EC0.asm"
	include "src/f/036F50.asm"
	include "src/f/036F9A.asm"
	include "src/f/0370CC.asm"
	include "src/f/0370FE.asm"
	include "src/f/03713C.asm"
	include "src/f/037180.asm"
	include "src/f/037210.asm"
	include "src/f/03725A.asm"
	include "src/f/03738C.asm"
	include "src/f/0373BE.asm"
	include "src/f/0373FE.asm"
	include "src/f/03742E.asm"
	include "src/f/037472.asm"
	include "src/f/03750A.asm"
	include "src/f/03755A.asm"
	include "src/f/0375A4.asm"
	include "src/f/0376C2.asm"
	include "src/f/037700.asm"
	include "src/f/037772.asm"
	include "src/f/0377D6.asm"
	include "src/f/03781C.asm"
	include "src/f/03784E.asm"
	include "src/f/0378A8.asm"
	include "src/f/037924.asm"
	include "src/f/03795E.asm"
	include "src/f/03799C.asm"
	include "src/f/0379CA.asm"
	include "src/f/037A00.asm"
Tbl_ThronePhone_vtable:	; class descriptor of THRONEPHONE: word name offset $72, parent ACTOR, 27 method slots from +6, then the name (tools/classes.py)
	incrom	$037A18,$7E
	include "src/f/037A96.asm"
	include "src/f/037AA4.asm"
	include "src/f/037ABA.asm"
	include "src/f/037AC2.asm"
	include "src/f/037AE0.asm"
	include "src/f/037B74.asm"
	include "src/f/037BFE.asm"
	include "src/f/037E58.asm"
	include "src/f/037E82.asm"
	include "src/f/037F26.asm"
	include "src/f/037F7E.asm"
	include "src/f/038036.asm"
Art_ThronePhoneSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 103 of 104 bytes used at runtime; read by Spr_PreloadTiles, Nem_BuildCodeTable; jt[255] used by ThronePhone_ClassInit
	incrom	$03803E,$104
Art_MagnetoBossSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 291 of 292 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[256] used by MagnetoBoss_ClassInit
	incrom	$038142,$292
	include "src/f/0383D4.asm"
	include "src/f/0383DC.asm"
	include "src/f/03845C.asm"
	include "src/f/038742.asm"
	include "src/f/0387D0.asm"
	include "src/f/038808.asm"
	include "src/f/038838.asm"
	include "src/f/0388D4.asm"
	include "src/f/0389B6.asm"
Sw_0389B6:	; switch table of sub at $0389B6: 8 word offsets from Sw_0389B6-2
	dc.w	BaniMazaA1_FrameHook_PulseColor-(Sw_0389B6-2), loc_038A16-(Sw_0389B6-2), loc_038A1E-(Sw_0389B6-2), loc_038A26-(Sw_0389B6-2)
	dc.w	loc_038A2E-(Sw_0389B6-2), loc_038A36-(Sw_0389B6-2), loc_038A3E-(Sw_0389B6-2), loc_038A46-(Sw_0389B6-2)
	include "src/f/038A0E.asm"
	include "src/f/038A58.asm"
	include "src/f/038A6C.asm"
	include "src/f/038A7E.asm"
	include "src/f/038AA4.asm"
	include "src/f/038AEE.asm"
	include "src/f/038AFE.asm"
	include "src/f/038BAC.asm"
	include "src/f/038BFA.asm"
Tbl_BaniMazaA1InitTablePtrs:	; format not established; never read in the corpus; jt[258] used by BaniMazaA1_InitTablePtrs
	incrom	$038C38,$40
Tbl_BaniMazaA1InitTablePtrs2:	; format not established; never read in the corpus; jt[259] used by BaniMazaA1_InitTablePtrs
	incrom	$038C78,$40
Tbl_BaniMazaA1InitTablePtrs3:	; format not established; never read in the corpus; jt[260] used by BaniMazaA1_InitTablePtrs
	incrom	$038CB8,$20
Tbl_BaniMazaA1InitTablePtrs4:	; format not established; never read in the corpus; jt[261] used by BaniMazaA1_InitTablePtrs
	incrom	$038CD8,$20
Art_BaniMazaA1Tiles:	; uncompressed 4bpp tiles DMA'd to VRAM; 1E of 1E bytes used at runtime; read by VDP_FlushDmaQueue; jt[262] used by BaniMazaA1_InitSprites
	incrom	$038CF8,$1E
Art_BaniMazaA1Tiles2:	; uncompressed 4bpp tiles DMA'd to VRAM; 1000 of 1000 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $5CC0-6460; jt[263] used by BaniMazaA1_UploadBlockTiles
	incrom	$038D16,$1000
	include "src/f/039D16.asm"
	include "src/f/039D24.asm"
	include "src/f/039DBA.asm"
	include "src/f/039E94.asm"
	include "src/f/039F80.asm"
	include "src/f/03A01C.asm"
	include "src/f/03A05A.asm"
	include "src/f/03A0AA.asm"
	include "src/f/03A11A.asm"
	include "src/f/03A156.asm"
	include "src/f/03A172.asm"
	include "src/f/03A210.asm"
	include "src/f/03A246.asm"
	include "src/f/03A29E.asm"
	include "src/f/03A2A6.asm"
Str_Empty_03A2F2:	; C string "" (used by BanimazaDoor_ClassInit)
	incrom	$03A2F2,$2
	include "src/f/03A2F4.asm"
	include "src/f/03A4EE.asm"
Sw_03A4EE:	; switch table of sub at $03A4EE: 4 word offsets from Sw_03A4EE-2
	dc.w	BanimazaDoor_Draw_part2-(Sw_03A4EE-2), BanimazaDoor_Draw_part1-(Sw_03A4EE-2), loc_03A58E-(Sw_03A4EE-2), loc_03A598-(Sw_03A4EE-2)
	incrom	$03A582,$2
	include "src/f/03A584.asm"
	include "src/f/03A5B4.asm"
	include "src/f/03A5BE.asm"
	include "src/f/03A632.asm"
	include "src/f/03A69A.asm"
	include "src/f/03A714.asm"
	include "src/f/03A72A.asm"
Tbl_BanimazaDoor_vtable:	; class descriptor of BANIMAZADOOR: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$03A7F0,$7B
Pad_BanimazaDoor:	; $00 fill; never read in the corpus; between BanimazaDoor_Init and RollingDiscs_GetSize
	incrom	$03A86B,$1
	include "src/f/03A86C.asm"
	include "src/f/03A87A.asm"
	include "src/f/03A882.asm"
	include "src/f/03ABCE.asm"
	include "src/f/03AC36.asm"
	include "src/f/03AC3E.asm"
Str_Empty_03AD12:	; C string "" (used by RollingDiscs_ClassInit)
	incrom	$03AD12,$2
	include "src/f/03AD14.asm"
	include "src/f/03ADC2.asm"
	include "src/f/03ADEE.asm"
	include "src/f/03AE14.asm"
	include "src/f/03AE1C.asm"
Tbl_RollingDiscs_vtable:	; class descriptor of ROLLINGDISCS: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$03AE32,$7B
Pad_RollingDiscs:	; $00 fill; never read in the corpus; between RollingDiscs_Nop66 and BaniMazaA2_InitDebrisBuf
	incrom	$03AEAD,$1
Art_BanimazaDoorSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 839 of 83A bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[285] used by BanimazaDoor_ClassInit, BanimazaDoor_Init
	incrom	$03AEAE,$83A
Tbl_BaniMazaA1Vdp:	; words copied to the VDP data port by VDP_WriteWords; 211 of 11C4 bytes used at runtime; read by VDP_WriteWords; jt[286] used by BaniMazaA1_InitSprites
	incrom	$03B6E8,$11C4
Lvl_BaniMazaA1Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 3AD of 3AE bytes used at runtime; read by Seg_LoadList; jt[287] used by BaniMazaA1_LoadLevel
	incrom	$03C8AC,$3AE
Art_BaniMazaA1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 6970 of 6BE0 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[288] used by BaniMazaA1_LoadLevel
	incrom	$03CC5A,$6BE0
Art_BaniMazaA1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2A of 44 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[289] used by BaniMazaA1_LoadLevel
	incrom	$04383A,$44
Lvl_BaniMazaA1Data:	; level data read by Level_AssignBlockSlots; 3D1 of 3FA bytes used at runtime; read by Level_AssignBlockSlots, Eni_Decode, RollingDiscs_ClassInit; jt[290] used by BaniMazaA1_LoadLevel
	incrom	$04387E,$3FA
Lvl_BaniMazaA2Data:	; level data read by Level_AssignBlockSlots; 5B of 5C bytes used at runtime; read by Level_AssignBlockSlots, Eni_Decode, Seg_LoadList; jt[291] used by BaniMazaA2_LoadLevel
	incrom	$043C78,$5C
Art_BaniMazaA2Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); D8E of DA4 bytes used at runtime; read by Nem_DecodeLoop; jt[292] used by BaniMazaA2_LoadLevel
	incrom	$043CD4,$DA4
Art_BaniMazaA2Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 12 of 2C bytes used at runtime; read by Nem_DecodeLoop; jt[293] used by BaniMazaA2_LoadLevel
	incrom	$044A78,$2C
Art_BaniMazaA2Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 221C of 2226 bytes used at runtime; read by Nem_DecodeLoop; jt[294] used by BaniMazaA2_LoadLevel
	incrom	$044AA4,$2226
Tbl_BaniMazaA2Vdp:	; words copied to the VDP data port by VDP_WriteWords; 40F of 45C bytes used at runtime; read by VDP_WriteWords; jt[295] used by BaniMazaA2_InitSprite
	incrom	$046CCA,$45C
Tbl_BaniMazaA2Vdp2:	; words copied to the VDP data port by VDP_WriteWords; 16 of 16 bytes used at runtime; read by VDP_WriteWords; jt[296] used by BaniMazaA2_AnimatePalettes_cases
	incrom	$047126,$16
Tbl_BaniMazaA2Vdp3:	; words copied to the VDP data port by VDP_WriteWords; 16 of 16 bytes used at runtime; read by VDP_WriteWords; jt[297] used by BaniMazaA2_AnimatePalettes_cases
	incrom	$04713C,$16
Tbl_BaniMazaA2Vdp4:	; words copied to the VDP data port by VDP_WriteWords; 16 of 16 bytes used at runtime; read by VDP_WriteWords; jt[298] used by BaniMazaA2_AnimatePalettes_case3
	incrom	$047152,$16
Tbl_BaniMazaA2AnimatePalettes_case4:	; format not established; never read in the corpus; jt[299] used by BaniMazaA2_AnimatePalettes_case4
	incrom	$047168,$16
Tbl_BaniMazaA2AnimatePalettes_copy:	; format not established; never read in the corpus; jt[300] used by BaniMazaA2_AnimatePalettes_copy -> Mem_Copy
	incrom	$04717E,$16
Tbl_BaniMazaA2SetPaletteStep:	; table read by BaniMazaA2_SetPaletteStep; 48 of F0 bytes used at runtime; read by BaniMazaA2_SetPaletteStep; jt[301] used by BaniMazaA2_SetPaletteStep
	incrom	$047194,$F0
Tbl_RollingDiscsBaniMazaA2_04766A:	; format not established; never read in the corpus; jt[302] used by unk_BaniMazaA2_04766A
	incrom	$047284,$1C
Tbl_BaniMazaA2AnimatePalettes:	; table read by BaniMazaA2_AnimatePalettes; 2C of 2C bytes used at runtime; read by BaniMazaA2_AnimatePalettes; jt[303] used by BaniMazaA2_AnimatePalettes
	incrom	$0472A0,$2C
	include "src/f/0472CC.asm"
	include "src/f/0472E0.asm"
	include "src/f/0473D4.asm"
	include "src/f/047402.asm"
	include "src/f/04740A.asm"
	include "src/f/04744E.asm"
Sw_04744E:	; switch table of sub at $04744E: 5 word offsets from Sw_04744E-2
	dc.w	BaniMazaA2_AnimatePalettes_cases-(Sw_04744E-2), loc_047568-(Sw_04744E-2), BaniMazaA2_AnimatePalettes_case3-(Sw_04744E-2), BaniMazaA2_AnimatePalettes_case4-(Sw_04744E-2)
	dc.w	BaniMazaA2_AnimatePalettes_copy-(Sw_04744E-2)
	include "src/f/04755E.asm"
	include "src/f/047572.asm"
	include "src/f/04757C.asm"
	include "src/f/047586.asm"
	include "src/f/0475B4.asm"
	include "src/f/0475E0.asm"
	include "src/f/04760A.asm"
	include "src/f/04766A.asm"
	include "src/f/047712.asm"
	include "src/f/0477B4.asm"
	include "src/f/0477E4.asm"
	include "src/f/047834.asm"
	include "src/f/047858.asm"
	include "src/f/047886.asm"
	include "src/f/047892.asm"
	include "src/f/04791A.asm"
Art_ApocalypseSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 210D of 210E bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[307] used by Apocalypse_ClassInit
	incrom	$04797A,$210E
Art_ApocalypseSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 10A0 of 1674 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $D140-D960; jt[308] used by Apocalypse_Init, BeamScooter_Init
	incrom	$049A88,$1674
Tbl_BaniMazaA2Anim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[309] used by Apocalypse_StateDefeated
	incrom	$04B0FC,$C
Tbl_BaniMazaA2Anim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 16 of 18 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[310] used by Apocalypse_StateLunge
	incrom	$04B108,$18
Tbl_BaniMazaA2Anim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 18 of 1A bytes used at runtime; read by Anim_ApplyStep; jt[311] used by Apocalypse_StateDrop
	incrom	$04B120,$1A
Tbl_BaniMazaA2Anim4:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[312] used by Apocalypse_StateHurt -> Obj_SetAnim
	incrom	$04B13A,$A
Tbl_ApocalypseInit:	; format not established; never read in the corpus; jt[313] used by Apocalypse_Init
	incrom	$04B144,$40
	incrom	$04B184,$2
	include "src/f/04B186.asm"
Tbl_AiScript_04B19E:	; word $0000 (2 bytes), not a string: reached only via jt[315] used by Apocalypse_ActStartMainScript -> AiScript_Set (e.g. an empty list/script count)
	incrom	$04B19E,$1
	incrom	$04B19F,$1
	include "src/f/04B1A0.asm"
Tbl_AiScript_04B1A4:	; word $0000 (2 bytes), not a string: reached only via jt[316] used by Apocalypse_StateBombsDone -> AiScript_Set (e.g. an empty list/script count)
	incrom	$04B1A4,$1
	incrom	$04B1A5,$1
	include "src/f/04B1A6.asm"
	include "src/f/04B1C2.asm"
Tbl_ApocalypseAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[317] used by Apocalypse_StateBombsDone -> AiScript_Set
	incrom	$04B1CE,$3A
Tbl_ApocalypseAiScript2:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[318] used by Apocalypse_StateBombsDone -> AiScript_Set
	incrom	$04B208,$12
Tbl_ApocalypseAiScript3:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[319] used by Apocalypse_ActPickScript_part1 -> AiScript_Set
	incrom	$04B21A,$26
Tbl_ApocalypseAiScript4:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[320] used by Apocalypse_ActPickScript_part2 -> AiScript_Set
	incrom	$04B240,$1E
Tbl_ApocalypseAiScript5:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[321] used by Apocalypse_ActPickScript_part2 -> AiScript_Set
	incrom	$04B25E,$32
Tbl_ApocalypseAiScript6:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[322] used by Apocalypse_ActPickScript_part2 -> AiScript_Set
	incrom	$04B290,$32
	incrom	$04B2C2,$74
	include "src/f/04B336.asm"
	include "src/f/04B344.asm"
Sw_04B344:	; switch table of sub at $04B344: 6 word offsets from Sw_04B344-2
	dc.w	Apocalypse_SelectBombPattern_part1-(Sw_04B344-2), loc_04B37E-(Sw_04B344-2), loc_04B388-(Sw_04B344-2), loc_04B392-(Sw_04B344-2)
	dc.w	loc_04B39C-(Sw_04B344-2), Apocalypse_SelectBombPattern_part2-(Sw_04B344-2)
	include "src/f/04B374.asm"
	include "src/f/04B3A6.asm"
	include "src/f/04B3B0.asm"
	include "src/f/04B3C6.asm"
	include "src/f/04B3CE.asm"
	include "src/f/04B462.asm"
	include "src/f/04B52E.asm"
	include "src/f/04B59E.asm"
	include "src/f/04B616.asm"
	include "src/f/04B654.asm"
	include "src/f/04B6E2.asm"
	include "src/f/04B6EA.asm"
	include "src/f/04B73A.asm"
	include "src/f/04B790.asm"
	include "src/f/04B848.asm"
	include "src/f/04B996.asm"
	include "src/f/04B9D0.asm"
	include "src/f/04BA08.asm"
	include "src/f/04BA9C.asm"
	include "src/f/04BAF8.asm"
	include "src/f/04BB22.asm"
	include "src/f/04BB98.asm"
	include "src/f/04BC10.asm"
	include "src/f/04BC18.asm"
	include "src/f/04BC74.asm"
Sw_04BC74:	; switch table of sub at $04BC74: 4 word offsets from Sw_04BC74-2
	dc.w	Apocalypse_ActPickScript_part1-(Sw_04BC74-2), Apocalypse_ActPickScript_part2-(Sw_04BC74-2), loc_04BCC6-(Sw_04BC74-2), loc_04BCDA-(Sw_04BC74-2)
	include "src/f/04BC9E.asm"
	include "src/f/04BCB2.asm"
	include "src/f/04BCEC.asm"
	include "src/f/04BD22.asm"
	include "src/f/04BD5A.asm"
	include "src/f/04BDB4.asm"
	include "src/f/04BE1C.asm"
	include "src/f/04BE76.asm"
	include "src/f/04BEFA.asm"
	include "src/f/04BF52.asm"
	include "src/f/04C030.asm"
	include "src/f/04C0B2.asm"
	include "src/f/04C114.asm"
	include "src/f/04C168.asm"
	include "src/f/04C1D0.asm"
	include "src/f/04C240.asm"
	include "src/f/04C2AE.asm"
	include "src/f/04C306.asm"
	include "src/f/04C332.asm"
	include "src/f/04C36C.asm"
	include "src/f/04C432.asm"
	include "src/f/04C4C6.asm"
	include "src/f/04C4F0.asm"
	include "src/f/04C504.asm"
	include "src/f/04C510.asm"
	include "src/f/04C526.asm"
Str_Empty_04C582:	; C string "" (used by Apocalypse_ClassInit)
	incrom	$04C582,$2
	include "src/f/04C584.asm"
	include "src/f/04C76C.asm"
	include "src/f/04C832.asm"
	include "src/f/04C9D8.asm"
	include "src/f/04CC42.asm"
	include "src/f/04CCA0.asm"
	include "src/f/04CD3A.asm"
Tbl_Apocalypse_vtable:	; class descriptor of APOCALYPSE: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$04CDA4,$79
Pad_Apocalypse:	; $00 fill; never read in the corpus; between Apocalypse_TakeDamage and ApocBomb_GetSize
	incrom	$04CE1D,$1
Art_ApocBombSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; F0D of F0E bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[356] used by ApocBomb_ClassInit
	incrom	$04CE1E,$F0E
Art_ApocBombNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 28 of 28 bytes used at runtime; read by Nem_DecodeLoop; jt[357] used by ApocBomb_Init
	incrom	$04DD2C,$28
Art_ApocalypseNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 14 of 14 bytes used at runtime; read by Nem_DecodeLoop; jt[358] used by ApocBomb_DrawShadow
	incrom	$04DD54,$14
Art_ApocBombNem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 84 of 88 bytes used at runtime; read by Nem_DecodeLoop; jt[359] used by ApocBomb_TakeDamage
	incrom	$04DD68,$88
Tbl_ApocalypseBaniMazaA2_04766A:	; format not established; never read in the corpus; jt[360] used by unk_BaniMazaA2_04766A
	incrom	$04DDF0,$E0
Tbl_ApocalypseShakeStep:	; table read by Cam_ShakeStep; 49 of 4A bytes used at runtime; read by Cam_ShakeStep; jt[361] used by ApocBomb_Explode
	incrom	$04DED0,$4A
	include "src/f/04DF1A.asm"
	include "src/f/04DF28.asm"
	include "src/f/04DF30.asm"
	include "src/f/04DF3C.asm"
	include "src/f/04DF52.asm"
	include "src/f/04DF7A.asm"
	include "src/f/04DF92.asm"
	include "src/f/04DFDC.asm"
	include "src/f/04E000.asm"
	include "src/f/04E0AC.asm"
	include "src/f/04E238.asm"
	include "src/f/04E3F6.asm"
	include "src/f/04E644.asm"
	include "src/f/04E81A.asm"
	include "src/f/04E87C.asm"
	include "src/f/04E8F2.asm"
	include "src/f/04E94A.asm"
Sw_04E94A:	; switch table of sub at $04E94A: 4 word offsets from Sw_04E94A-2
	dc.w	ApocBomb_Spawn_part1-(Sw_04E94A-2), ApocBomb_Spawn_part2-(Sw_04E94A-2), ApocBomb_Spawn_part3-(Sw_04E94A-2), loc_04E9DE-(Sw_04E94A-2)
	include "src/f/04E9C2.asm"
	include "src/f/04E9C8.asm"
	include "src/f/04E9D0.asm"
	include "src/f/04E9EA.asm"
Tbl_ApocBomb_vtable:	; class descriptor of APOCBOMB: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$04EA42,$77
Pad_BeamScooter:	; $00 fill; never read in the corpus; between ApocBomb_Spawn_part4 and BeamScooter_GetSize
	incrom	$04EAB9,$1
	include "src/f/04EABA.asm"
	include "src/f/04EAC8.asm"
	include "src/f/04EAF4.asm"
	include "src/f/04EAFC.asm"
	include "src/f/04EB3C.asm"
	include "src/f/04EB8A.asm"
	include "src/f/04EC64.asm"
	include "src/f/04EC70.asm"
	include "src/f/04EC7C.asm"
Tbl_BeamScooter_vtable:	; class descriptor of BEAMSCOOTER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$04ECEC,$7A
Art_BoulderSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 749 of 74A bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[382] used by Boulder_ClassInit
	incrom	$04ED66,$74A
Art_BoulderSpr2:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 219 of 21A bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[383] used by Boulder_ClassInit
	incrom	$04F4B0,$21A
Art_BoulderSpr3:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 36D of 36E bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[384] used by Boulder_ClassInit
	incrom	$04F6CA,$36E
Art_TuskSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2520 of 2B96 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $BA20-C380; jt[385] used by Tusk_Init
	incrom	$04FA38,$2B96
Art_BaniMazaA1Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 7D7 of 7D8 bytes used at runtime; read by Nem_DecodeLoop, Seg_LoadList, VDP_FlushDmaQueue; jt[386] used by BaniMazaA1_InitPalette, BaniMazaB2_InitPalette, Tuskette_ClassInit
	incrom	$0525CE,$7D8
Art_BaniMazaB2Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 37B of 37C bytes used at runtime; read by Nem_DecodeLoop, Seg_LoadList; jt[387] used by BaniMazaB2_LoadLevel
	incrom	$052DA6,$37C
Art_BaniMazaB2Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 6366 of 646C bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[388] used by BaniMazaB2_LoadLevel
	incrom	$053122,$646C
Art_BaniMazaB2Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 16 of 2E bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[389] used by BaniMazaB2_LoadLevel
	incrom	$05958E,$2E
Art_BaniMazaB2Nem4:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 1248 of 1252 bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode; jt[390] used by BaniMazaB2_LoadLevel
	incrom	$0595BC,$1252
Tbl_BeamScooterAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Nem_DecodeLoop, Anim_AdvanceByDistance; jt[391] used by Tuskette_Init_part5, Tuskette_StatePatrolStart, Tuskette_StateWalk
	incrom	$05A80E,$C
Tbl_BeamScooterAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[392] used by Tuskette_StateWalkStart, Tuskette_StateChaseStart, Tuskette_StateRunRight
	incrom	$05A81A,$E
Tbl_BeamScooterAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[393] used by Tuskette_StateHopOut, Tuskette_StateHopBack
	incrom	$05A828,$E
Tbl_BeamScooterAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Boulder_Update, Anim_AdvanceByDistance; jt[394] used by Boulder_StateStartRoll, Boulder_StateBounce
	incrom	$05A836,$C
Tbl_BeamScooterUpdate:	; table read by Boulder_Update; 9 of 10 bytes used at runtime; read by Boulder_Update, Anim_ApplyStep, Boulder_StateBounce; jt[395] used by Boulder_StateBounce
	incrom	$05A842,$10
Tbl_BeamScooterShakeStep:	; table read by Cam_ShakeStep; 11 of 12 bytes used at runtime; read by Cam_ShakeStep; jt[396] used by Boulder_StateBounce
	incrom	$05A852,$12
Tbl_BeamScooterShakeStep2:	; table read by Cam_ShakeStep; 13 of 14 bytes used at runtime; read by Cam_ShakeStep; jt[397] used by Boulder_StateBounce
	incrom	$05A864,$14
Tbl_BeamScooterNextWrap:	; table read by Seq_NextWrap; A of A bytes used at runtime; read by Seq_NextWrap; jt[398] used by Boulder_SpawnerTick
	incrom	$05A878,$A
Tbl_BaniMazaB2ComputeParallax:	; table read by Scroll_ComputeParallax; 42 of 62 bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax; jt[399] used by BaniMazaB2_SetParallax
	incrom	$05A882,$62
	include "src/f/05A8E4.asm"
	include "src/f/05A8F8.asm"
	include "src/f/05A938.asm"
	include "src/f/05A940.asm"
	include "src/f/05AB58.asm"
	include "src/f/05AB8C.asm"
	include "src/f/05ABAA.asm"
	include "src/f/05AC24.asm"
	include "src/f/05AC76.asm"
	include "src/f/05AC88.asm"
	include "src/f/05ACAE.asm"
	include "src/f/05ACDC.asm"
	include "src/f/05ACEC.asm"
	include "src/f/05AD20.asm"
	include "src/f/05AD2E.asm"
	include "src/f/05AE10.asm"
	include "src/f/05AED2.asm"
	include "src/f/05B016.asm"
	include "src/f/05B058.asm"
	include "src/f/05B08E.asm"
	include "src/f/05B0C8.asm"
	include "src/f/05B322.asm"
	include "src/f/05B58E.asm"
	include "src/f/05B5D4.asm"
	include "src/f/05B614.asm"
	include "src/f/05B65A.asm"
	include "src/f/05B98C.asm"
	include "src/f/05BAAC.asm"
	include "src/f/05BB06.asm"
	include "src/f/05BB0E.asm"
Str_Empty_05BB84:	; C string "" (used by Boulder_ClassInit)
	incrom	$05BB84,$2
	include "src/f/05BB86.asm"
	include "src/f/05BBA4.asm"
	include "src/f/05BBC2.asm"
	include "src/f/05BC9C.asm"
	include "src/f/05BD34.asm"
	include "src/f/05BD92.asm"
	include "src/f/05BF4A.asm"
	include "src/f/05C07C.asm"
Tbl_Boulder_vtable:	; class descriptor of BOULDER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$05C0DE,$76
Tbl_TuskAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[417] used by Tusk_StateIntro, Tusk_StateThrow, Tusk_StateChargeStop
	incrom	$05C154,$C
Tbl_TuskAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep; jt[418] used by Tusk_AtkThrowBoulder
	incrom	$05C160,$10
	include "src/f/05C170.asm"
	include "src/f/05C17E.asm"
	include "src/f/05C19C.asm"
	include "src/f/05C1B2.asm"
	include "src/f/05C1F4.asm"
	include "src/f/05C204.asm"
	include "src/f/05C22E.asm"
	include "src/f/05C286.asm"
	include "src/f/05C302.asm"
	include "src/f/05C324.asm"
	include "src/f/05C3C2.asm"
	include "src/f/05C3EE.asm"
	include "src/f/05C41A.asm"
	include "src/f/05C4A0.asm"
Sw_05C4A0:	; switch table of sub at $05C4A0: 10 word offsets from Sw_05C4A0-2
	dc.w	loc_05C53C-(Sw_05C4A0-2), Tusk_StateChooseAttack_part2-(Sw_05C4A0-2), loc_05C554-(Sw_05C4A0-2), loc_05C566-(Sw_05C4A0-2)
	dc.w	loc_05C572-(Sw_05C4A0-2), loc_05C57E-(Sw_05C4A0-2), loc_05C590-(Sw_05C4A0-2), loc_05C59C-(Sw_05C4A0-2)
	dc.w	loc_05C5AE-(Sw_05C4A0-2), loc_05C5BA-(Sw_05C4A0-2)
	include "src/f/05C538.asm"
	include "src/f/05C548.asm"
	include "src/f/05C5C4.asm"
	include "src/f/05C5CE.asm"
	include "src/f/05C604.asm"
	include "src/f/05C626.asm"
	include "src/f/05C6AA.asm"
	include "src/f/05C8F4.asm"
	include "src/f/05C92A.asm"
	include "src/f/05C9A2.asm"
	include "src/f/05CA12.asm"
	include "src/f/05CA4A.asm"
	include "src/f/05CAA0.asm"
	include "src/f/05CB04.asm"
	include "src/f/05CB32.asm"
	include "src/f/05CB72.asm"
	include "src/f/05CBB2.asm"
	include "src/f/05CBF2.asm"
	include "src/f/05CC3A.asm"
	include "src/f/05CC92.asm"
	include "src/f/05CCDA.asm"
Sw_05CCDA:	; switch table of sub at $05CCDA: 5 word offsets from Sw_05CCDA-2
	dc.w	Tusk_Defeated_part1-(Sw_05CCDA-2), Tusk_Defeated_part2-(Sw_05CCDA-2), loc_05CD22-(Sw_05CCDA-2), Tusk_Defeated_part3-(Sw_05CCDA-2)
	dc.w	Tusk_Defeated_part4-(Sw_05CCDA-2)
	include "src/f/05CD0A.asm"
	include "src/f/05CD18.asm"
	include "src/f/05CD2C.asm"
	include "src/f/05CD36.asm"
	include "src/f/05CD3E.asm"
	include "src/f/05CD46.asm"
	include "src/f/05CD4E.asm"
	include "src/f/05CD7E.asm"
	include "src/f/05CD86.asm"
	include "src/f/05CE28.asm"
	include "src/f/05CE3A.asm"
	include "src/f/05CF68.asm"
Tbl_Tusk_vtable:	; class descriptor of TUSK: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$05D03A,$73
Pad_Tusk:	; $00 fill; never read in the corpus; between Tusk_Init and Tuskette_GetSize
	incrom	$05D0AD,$1
	include "src/f/05D0AE.asm"
	include "src/f/05D0BC.asm"
	include "src/f/05D11C.asm"
	include "src/f/05D150.asm"
	include "src/f/05D1DA.asm"
	include "src/f/05D26E.asm"
	include "src/f/05D2F6.asm"
	include "src/f/05D31A.asm"
	include "src/f/05D34E.asm"
	include "src/f/05D3C8.asm"
	include "src/f/05D430.asm"
	include "src/f/05D45A.asm"
	include "src/f/05D49C.asm"
	include "src/f/05D4D2.asm"
	include "src/f/05D556.asm"
	include "src/f/05D580.asm"
	include "src/f/05D5C2.asm"
	include "src/f/05D5FC.asm"
	include "src/f/05D63A.asm"
	include "src/f/05D67C.asm"
	include "src/f/05D704.asm"
	include "src/f/05D714.asm"
	include "src/f/05D738.asm"
	include "src/f/05D786.asm"
	include "src/f/05D7C2.asm"
	include "src/f/05D7F6.asm"
	include "src/f/05D898.asm"
	include "src/f/05D8E8.asm"
	include "src/f/05D91A.asm"
	include "src/f/05D956.asm"
	include "src/f/05D9AA.asm"
	include "src/f/05D9DC.asm"
	include "src/f/05DA18.asm"
	include "src/f/05DA58.asm"
	include "src/f/05DA98.asm"
	include "src/f/05DAEE.asm"
	include "src/f/05DB4C.asm"
	include "src/f/05DBA2.asm"
	include "src/f/05DBE6.asm"
	include "src/f/05DC4A.asm"
	include "src/f/05DCA0.asm"
	include "src/f/05DCD0.asm"
	include "src/f/05DD0E.asm"
	include "src/f/05DD40.asm"
	include "src/f/05DD48.asm"
	include "src/f/05DD66.asm"
	include "src/f/05DD7C.asm"
	include "src/f/05DDBE.asm"
Sw_05DDBE:	; switch table of sub at $05DDBE: 8 word offsets from Sw_05DDBE-2
	dc.w	Tuskette_Init_part1-(Sw_05DDBE-2), Tuskette_Init_part2-(Sw_05DDBE-2), Tuskette_Init_part3-(Sw_05DDBE-2), loc_05DF4A-(Sw_05DDBE-2)
	dc.w	Tuskette_Init_part4-(Sw_05DDBE-2), Tuskette_Init_part5-(Sw_05DDBE-2), loc_05DF94-(Sw_05DDBE-2), loc_05DFF4-(Sw_05DDBE-2)
	include "src/f/05DF06.asm"
	include "src/f/05DF16.asm"
	include "src/f/05DF26.asm"
	include "src/f/05DF6E.asm"
	include "src/f/05DF84.asm"
	include "src/f/05E038.asm"
Tbl_Tuskette_vtable:	; class descriptor of TUSKETTE: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$05E04E,$8B
Pad_Cerebro:	; $00 fill; never read in the corpus; between Tuskette_Init_part6 and Cerebro_BigSpriteDecode
	incrom	$05E0D9,$1
Art_CerebroNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 1410 of 141A bytes used at runtime; read by Nem_DecodeLoop; jt[436] used by Cerebro_Run
	incrom	$05E0DA,$141A
Art_CerebroNem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 13D0 of 13D4 bytes used at runtime; read by Nem_DecodeLoop; jt[437] used by Cerebro_Run
	incrom	$05F4F4,$13D4
Art_CerebroNem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2 of 1A bytes used at runtime; read by Nem_DecodeLoop, Nem_BuildCodeTable, Eni_Decode; jt[438] used by Cerebro_Run
	incrom	$0608C8,$1A
Tbl_CerebroVdp:	; words copied to the VDP data port by VDP_WriteWords; FFC of FFC bytes used at runtime; read by VDP_WriteWords; jt[439] used by Cerebro_LoadSpriteTiles
	incrom	$0608E2,$FFC
Art_CerebroSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1460 of 149C bytes used at runtime; read by Spr_RenderToBitmap_Loop, Nem_DecodeLoop, Mem_Copy; DMA to VRAM $A620-B4E0; jt[440] used by Cerebro_PlayIntro
	incrom	$0618DE,$149C
Art_CerebroSpr2:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 134 of 134 bytes used at runtime; read by Spr_RenderToBitmap_Loop, Nem_DecodeLoop, Mem_Copy; jt[441] used by Cerebro_PlayIntro
	incrom	$062D7A,$134
Art_CerebroSpr3:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 79C of 79C bytes used at runtime; read by Spr_RenderToBitmap_Loop, Nem_DecodeLoop, Mem_Copy; jt[442] used by Cerebro_PlayIntro
	incrom	$062EAE,$79C
Art_CerebroSpr4:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 180 of 180 bytes used at runtime; read by Spr_RenderToBitmap_Loop, Nem_DecodeLoop, Mem_Copy; jt[443] used by Cerebro_PlayIntro
	incrom	$06364A,$180
Art_CerebroSpr5:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 40C of 40C bytes used at runtime; read by Spr_RenderToBitmap_Loop, Nem_DecodeLoop, Mem_Copy; jt[444] used by Cerebro_PlayIntro
	incrom	$0637CA,$40C
Tbl_Cerebro:	; format not established; never read in the corpus; jt[445] used by loc_15C5D6
	incrom	$063BD6,$4
Tbl_Cerebro2:	; format not established; never read in the corpus; jt[446] used by loc_15C5D6
	incrom	$063BDA,$4
Tbl_Cerebro3:	; format not established; never read in the corpus; jt[447] used by loc_15C5D6
	incrom	$063BDE,$4
Tbl_Cerebro4:	; format not established; never read in the corpus; jt[448] used by loc_15C5D6
	incrom	$063BE2,$4
Tbl_Cerebro5:	; format not established; never read in the corpus; jt[449] used by loc_15C5D6
	incrom	$063BE6,$4
Tbl_Cerebro6:	; format not established; never read in the corpus; jt[450] used by loc_15C5D6
	incrom	$063BEA,$4
Tbl_Cerebro7:	; format not established; never read in the corpus; jt[451] used by loc_15C5D6
	incrom	$063BEE,$8
Tbl_Cerebro8:	; format not established; never read in the corpus; jt[452] used by loc_15C5D6
	incrom	$063BF6,$8
	incrom	$063BFE,$8
Tbl_Cerebro9:	; format not established; never read in the corpus; jt[454] used by loc_15C5D6
	incrom	$063C06,$A
	incrom	$063C10,$12
Art_FailureNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 38 of 38 bytes used at runtime; read by Nem_DecodeLoop, Nem_BuildCodeTable; jt[457] used by Failure_RunScene
	incrom	$063C22,$38
Art_FailureNem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 122 of 122 bytes used at runtime; read by Nem_DecodeLoop, Nem_BuildCodeTable; jt[458] used by Failure_RunScene
	incrom	$063C5A,$122
Art_CerebroNem4:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2FA of 2FA bytes used at runtime; read by Nem_DecodeLoop; jt[459] used by Cerebro_SetupPalCycles
	incrom	$063D7C,$2FA
Art_CerebroNem5:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 60 of 60 bytes used at runtime; read by Nem_DecodeLoop; jt[460] used by Cerebro_PlayIntro
	incrom	$064076,$60
Art_CerebroNem6:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 3FE of 3FE bytes used at runtime; read by Nem_DecodeLoop; jt[461] used by Cerebro_PlayIntro
	incrom	$0640D6,$3FE
	include "src/f/0644D4.asm"
	include "src/f/06451E.asm"
	include "src/f/064588.asm"
	include "src/f/064638.asm"
Sw_064638:	; switch table of sub at $064638: 7 word offsets from Sw_064638-2
	dc.w	PlayerSelect_AllocCharBuffers_Cases-(Sw_064638-2), loc_064682-(Sw_064638-2), loc_064690-(Sw_064638-2), loc_06469E-(Sw_064638-2)
	dc.w	loc_0646AC-(Sw_064638-2), loc_0646BA-(Sw_064638-2), loc_0646C8-(Sw_064638-2)
	include "src/f/064674.asm"
	include "src/f/0646D6.asm"
Tbl_PlayerSelect:	; format not established; never read in the corpus; referenced by PlayerSelect_AllocCharBuffers_Measure
	incrom	$0647CC,$2
Tbl_PlayerSelect2:	; format not established; never read in the corpus; referenced by PlayerSelect_AllocCharBuffers_Measure
	incrom	$0647CE,$2
	include "src/f/0647D0.asm"
Sw_0647D0:	; switch table of sub at $0647D0: 7 word offsets from Sw_0647D0-2
	dc.w	PlayerSelect_LoadCharFrame_Beast-(Sw_0647D0-2), PlayerSelect_LoadCharFrame_Cyclops-(Sw_0647D0-2), loc_064822-(Sw_0647D0-2), PlayerSelect_LoadCharFrame_Nightcrawler-(Sw_0647D0-2)
	dc.w	PlayerSelect_LoadCharFrame_Psylocke-(Sw_0647D0-2), PlayerSelect_LoadCharFrame_Wolverine-(Sw_0647D0-2), PlayerSelect_LoadCharFrame_Magneto-(Sw_0647D0-2)
	include "src/f/064806.asm"
	include "src/f/064814.asm"
	include "src/f/064830.asm"
	include "src/f/06483E.asm"
	include "src/f/06484C.asm"
	include "src/f/06485A.asm"
	include "src/f/064868.asm"
	include "src/f/06489A.asm"
Sw_06489A:	; switch table of sub at $06489A: 7 word offsets from Sw_06489A-2
	dc.w	PlayerSelect_CharSpriteDef_Beast-(Sw_06489A-2), PlayerSelect_CharSpriteDef_Cyclops-(Sw_06489A-2), loc_0648DC-(Sw_06489A-2), PlayerSelect_CharSpriteDef_Nightcrawler-(Sw_06489A-2)
	dc.w	PlayerSelect_CharSpriteDef_Psylocke-(Sw_06489A-2), PlayerSelect_CharSpriteDef_Wolverine-(Sw_06489A-2), PlayerSelect_CharSpriteDef_Magneto-(Sw_06489A-2)
	include "src/f/0648CC.asm"
	include "src/f/0648D4.asm"
	include "src/f/0648E4.asm"
	include "src/f/0648EC.asm"
	include "src/f/0648F4.asm"
	include "src/f/0648FC.asm"
	include "src/f/064904.asm"
	include "src/f/064912.asm"
Sw_064912:	; switch table of sub at $064912: 7 word offsets from Sw_064912-2
	dc.w	PlayerSelect_CharFrameNum_Beast-(Sw_064912-2), PlayerSelect_CharFrameNum_Cyclops-(Sw_064912-2), loc_064954-(Sw_064912-2), PlayerSelect_CharFrameNum_Nightcrawler-(Sw_064912-2)
	dc.w	PlayerSelect_CharFrameNum_Psylocke-(Sw_064912-2), PlayerSelect_CharFrameNum_Wolverine-(Sw_064912-2), PlayerSelect_CharFrameNum_Magneto-(Sw_064912-2)
	include "src/f/064944.asm"
	include "src/f/06494C.asm"
	include "src/f/06495C.asm"
	include "src/f/064964.asm"
	include "src/f/06496C.asm"
	include "src/f/064974.asm"
	include "src/f/06497C.asm"
	include "src/f/06498A.asm"
	include "src/f/064AA2.asm"
	include "src/f/064AEC.asm"
	include "src/f/064B54.asm"
	include "src/f/064B76.asm"
	include "src/f/064BF0.asm"
	include "src/f/064C66.asm"
	include "src/f/064CA2.asm"
Sw_064CA2:	; switch table of sub at $064CA2: 8 word offsets from Sw_064CA2-2
	dc.w	Cerebro_AnimatePalettes_CasesA-(Sw_064CA2-2), loc_064D14-(Sw_064CA2-2), loc_064D30-(Sw_064CA2-2), loc_064D4C-(Sw_064CA2-2)
	dc.w	loc_064D66-(Sw_064CA2-2), loc_064D80-(Sw_064CA2-2), loc_064D9A-(Sw_064CA2-2), loc_064DB4-(Sw_064CA2-2)
	include "src/f/064CF2.asm"
	include "src/f/064DD2.asm"
Sw_064DD2:	; switch table of sub at $064DD2: 8 word offsets from Sw_064DD2-2
	dc.w	Cerebro_AnimatePalettes_CasesB-(Sw_064DD2-2), loc_064E22-(Sw_064DD2-2), loc_064E30-(Sw_064DD2-2), loc_064E3E-(Sw_064DD2-2)
	dc.w	loc_064E4C-(Sw_064DD2-2), loc_064E5A-(Sw_064DD2-2), loc_064E68-(Sw_064DD2-2), loc_064E76-(Sw_064DD2-2)
	include "src/f/064E14.asm"
	include "src/f/064E82.asm"
	include "src/f/064E9C.asm"
	include "src/f/064EDE.asm"
	include "src/f/064F70.asm"
Sw_064F70:	; switch table of sub at $064F70: 4 word offsets from Sw_064F70-2
	dc.w	loc_065326-(Sw_064F70-2), loc_06533A-(Sw_064F70-2), loc_06534E-(Sw_064F70-2), loc_065362-(Sw_064F70-2)
	include "src/f/065326.asm"
	include "src/f/065374.asm"
	include "src/f/06539C.asm"
	include "src/f/065400.asm"
	include "src/f/065494.asm"
	include "src/f/0654F4.asm"
	include "src/f/065532.asm"
Sw_065532:	; switch table of sub at $065532: 6 word offsets from Sw_065532-2
	dc.w	Cerebro_TextOpSetCursor-(Sw_065532-2), loc_0655E4-(Sw_065532-2), loc_065612-(Sw_065532-2), Cerebro_TextOpFadeOut-(Sw_065532-2)
	dc.w	Cerebro_TextOpPlaySound-(Sw_065532-2), Cerebro_TextOpStopSound-(Sw_065532-2)
	include "src/f/0655C4.asm"
	include "src/f/06563A.asm"
	include "src/f/065662.asm"
	include "src/f/065682.asm"
	include "src/f/0656B0.asm"
Sw_0656B0:	; switch table of sub at $0656B0: 7 word offsets from Sw_0656B0-2
	dc.w	PlayerSelect_Run_P1Beast-(Sw_0656B0-2), PlayerSelect_Run_P1Cyclops-(Sw_0656B0-2), loc_065C80-(Sw_0656B0-2), PlayerSelect_Run_P1Nightcrawler-(Sw_0656B0-2)
	dc.w	PlayerSelect_Run_P1Psylocke-(Sw_0656B0-2), PlayerSelect_Run_P1Wolverine-(Sw_0656B0-2), PlayerSelect_Run_P1Magneto-(Sw_0656B0-2)
	include "src/f/065C68.asm"
	include "src/f/065C74.asm"
	include "src/f/065C8C.asm"
	include "src/f/065C98.asm"
	include "src/f/065CA4.asm"
	include "src/f/065CB0.asm"
	include "src/f/065CBC.asm"
Sw_065CBC:	; switch table of sub at $065CBC: 7 word offsets from Sw_065CBC-2
	dc.w	PlayerSelect_Run_P2Beast-(Sw_065CBC-2), PlayerSelect_Run_P2Cyclops-(Sw_065CBC-2), PlayerSelect_Run_P2Gambit-(Sw_065CBC-2), loc_065D44-(Sw_065CBC-2)
	dc.w	loc_065D50-(Sw_065CBC-2), loc_065D5C-(Sw_065CBC-2), loc_065D68-(Sw_065CBC-2)
	include "src/f/065D20.asm"
	include "src/f/065D2C.asm"
	include "src/f/065D38.asm"
	include "src/f/065D74.asm"
Str_Lives:	; C string "LIVES " (used by PlayerSelect_Run)
	incrom	$065D8E,$8
Str_Lives_065D96:	; C string "LIVES " (used by PlayerSelect_Run)
	incrom	$065D96,$8
Str_PressStart:	; C string "PRESS START" (used by PlayerSelect_Run)
	incrom	$065D9E,$C
Str_PressStart_065DAA:	; C string "PRESS START" (used by PlayerSelect_Run)
	incrom	$065DAA,$C
	include "src/f/065DB6.asm"
	include "src/f/065E6C.asm"
Str_Start:	; C string "START" (used by Cerebro_PlayIntro)
	incrom	$066AF8,$6
Str_Press:	; C string "PRESS" (used by Cerebro_PlayIntro)
	incrom	$066AFE,$6
Str_DevelopedByHeadgamesInc:	; C string "DEVELOPED BY  HEADGAMES, INC." (used by Cerebro_PlayIntro)
	incrom	$066B04,$1E
Tbl_Cerebro10:	; format not established; never read in the corpus; referenced by Cerebro_PlayIntro
	incrom	$066B22,$2
Tbl_Cerebro11:	; format not established; never read in the corpus; referenced by Cerebro_PlayIntro
	incrom	$066B24,$2
	include "src/f/066B26.asm"
	include "src/f/066E80.asm"
	include "src/f/066EA8.asm"
	include "src/f/066EC8.asm"
	include "src/f/066EE8.asm"
	include "src/f/066F08.asm"
	include "src/f/066F28.asm"
	include "src/f/066F44.asm"
	include "src/f/066F7E.asm"
	include "src/f/066FBA.asm"
	include "src/f/066FDE.asm"
	include "src/f/067020.asm"
	include "src/f/06717E.asm"
	include "src/f/06718C.asm"
	include "src/f/067202.asm"
	include "src/f/067244.asm"
	include "src/f/06724E.asm"
	include "src/f/06726C.asm"
	include "src/f/0672CE.asm"
Sw_0672CE:	; switch table of sub at $0672CE: 7 word offsets from Sw_0672CE-2
	dc.w	loc_06730C-(Sw_0672CE-2), loc_06731A-(Sw_0672CE-2), loc_067328-(Sw_0672CE-2), loc_067336-(Sw_0672CE-2)
	dc.w	loc_067344-(Sw_0672CE-2), loc_067352-(Sw_0672CE-2), loc_067360-(Sw_0672CE-2)
	include "src/f/06730C.asm"
	include "src/f/067360.asm"
	include "src/f/06736C.asm"
	include "src/f/067376.asm"
	include "src/f/067420.asm"
Sw_067420:	; switch table of sub at $067420: 7 word offsets from Sw_067420-2
	dc.w	loc_06745C-(Sw_067420-2), loc_067478-(Sw_067420-2), loc_067492-(Sw_067420-2), loc_0674AC-(Sw_067420-2)
	dc.w	loc_0674C6-(Sw_067420-2), loc_0674E0-(Sw_067420-2), loc_0674FA-(Sw_067420-2)
	include "src/f/06745C.asm"
	include "src/f/067478.asm"
	include "src/f/06750E.asm"
	include "src/f/067542.asm"
Sw_067542:	; switch table of sub at $067542: 7 word offsets from Sw_067542-2
	dc.w	loc_06757C-(Sw_067542-2), loc_06758E-(Sw_067542-2), loc_0675A0-(Sw_067542-2), loc_0675B2-(Sw_067542-2)
	dc.w	loc_0675C4-(Sw_067542-2), loc_0675D6-(Sw_067542-2), loc_0675E8-(Sw_067542-2)
	include "src/f/06757C.asm"
	include "src/f/06758E.asm"
	include "src/f/0675B2.asm"
	include "src/f/0675C4.asm"
	include "src/f/0675D6.asm"
	include "src/f/0675E8.asm"
	include "src/f/0675F8.asm"
	include "src/f/067600.asm"
	include "src/f/0676F0.asm"
	include "src/f/06777A.asm"
	include "src/f/06789C.asm"
	include "src/f/067936.asm"
	include "src/f/067984.asm"
	include "src/f/067A56.asm"
	include "src/f/067AE0.asm"
	include "src/f/067C32.asm"
	include "src/f/067CC4.asm"
	include "src/f/067D6C.asm"
	include "src/f/067D7A.asm"
	include "src/f/067DF0.asm"
	include "src/f/067DFA.asm"
	include "src/f/067E18.asm"
	include "src/f/067E5E.asm"
	include "src/f/067FCA.asm"
	include "src/f/068078.asm"
	include "src/f/068126.asm"
Str_Selected:	; C string "   SELECTED" (used by sub_068126)
	incrom	$068242,$C
Str_Selected_06824E:	; C string "SELECTED   " (used by sub_068126)
	incrom	$06824E,$C
Tbl_PlayerSelectDrawFrames:	; table read by PlayerSelect_DrawFrames; F of 10 bytes used at runtime; read by PlayerSelect_DrawFrames, PlayerSelect_Run, PlayerSelect_PlaceCursor; jt[485] used by PlayerSelect_Run
	incrom	$06825A,$10
Tbl_PlayerSelectIntroPalHook:	; table read by Cerebro_IntroPalHook; D of E bytes used at runtime; read by Cerebro_IntroPalHook, Cerebro_PlayIntro, PlayerSelect_DrawFrames; jt[486] used by PlayerSelect_Run
	incrom	$06826A,$E
Tbl_CerebroIntroPalHook:	; table read by Cerebro_IntroPalHook; 20 of 20 bytes used at runtime; read by Cerebro_IntroPalHook, Cerebro_PlayIntro; jt[487] used by Cerebro_IntroPalHook
	incrom	$068278,$20
Tbl_CerebroIntroPalHook2:	; table read by Cerebro_IntroPalHook; 20 of 20 bytes used at runtime; read by Cerebro_IntroPalHook, Cerebro_PlayIntro; jt[488] used by Cerebro_PlayIntro
	incrom	$068298,$20
Tbl_CerebroIntroPalHook3:	; table read by Cerebro_IntroPalHook; C0 of C0 bytes used at runtime; read by Cerebro_IntroPalHook, Cerebro_PlayIntro; jt[489] used by Cerebro_IntroPalHook
	incrom	$0682B8,$C0
Tbl_CerebroIntroPalHook4:	; table read by Cerebro_IntroPalHook; 20 of 20 bytes used at runtime; read by Cerebro_IntroPalHook, Cerebro_PlayIntro; jt[490] used by Cerebro_PlayIntro
	incrom	$068378,$20
Tbl_CerebroIntroPalHook5:	; table read by Cerebro_IntroPalHook; 2A of 2C bytes used at runtime; read by Cerebro_IntroPalHook, Cerebro_PlayIntro, loc_065374; jt[491] used by Cerebro_PlayIntro
	incrom	$068398,$2C
Str_CerebroSentinelsText:	; Cerebro briefing text (Cerebro_PrintText); 27E of 29E bytes used at runtime; read by Cerebro_PrintText; jt[492] used by CerebroSentinels_RunScene
	incrom	$0683C4,$29E
Str_CerebroAvalonText:	; Cerebro briefing text (Cerebro_PrintText); 1AC of 1C6 bytes used at runtime; read by Cerebro_PrintText, Cerebro_TextOpPrint; jt[493] used by CerebroAvalon_RunScene
	incrom	$068662,$1C6
Str_CerebroBaniMazaText:	; Cerebro briefing text (Cerebro_PrintText); 1F1 of 1FE bytes used at runtime; read by Cerebro_PrintText; jt[494] used by CerebroBaniMaza_RunScene
	incrom	$068828,$1FE
Str_CerebroSavageText:	; Cerebro briefing text (Cerebro_PrintText); 159 of 162 bytes used at runtime; read by Cerebro_PrintText; jt[495] used by CerebroSavage_RunScene
	incrom	$068A26,$162
Str_CerebroSpaceText:	; Cerebro briefing text (Cerebro_PrintText); 235 of 252 bytes used at runtime; read by Cerebro_PrintText, Cerebro_TextOpPrint; jt[496] used by CerebroSpace_RunScene
	incrom	$068B88,$252
Tbl_FinalTextCerebro:	; data handed to Cerebro_Run (format not established); never read in the corpus; jt[497] used by FinalText_RunScene -> Cerebro_Run
	incrom	$068DDA,$83A
Str_FailureText:	; Cerebro briefing text (Cerebro_PrintText); 226 of 252 bytes used at runtime; read by Cerebro_PrintText, Cerebro_TextOpPrint, Cerebro_TextOpSetCursor; jt[498] used by Failure_RunScene
	incrom	$069614,$252
Str_XMenAndAllRelated:	; C string "@@@@X-MEN, AND ALL RELATED@@@@" (used by jt[499])
	incrom	$069866,$20
Str_Text_069886:	; Cerebro briefing text (Cerebro_PrintText); 9B of A0 bytes used at runtime; read by Cerebro_PrintText
	incrom	$069886,$A0
Snd_Credits:	; sound data; never read in the corpus; jt[500] used by Credits_RunScene -> Snd_Stop
	incrom	$069926,$736
Tbl_ScalingActor_vtable:	; class descriptor of SCALINGACTOR: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$06A05C,$7B
Pad_06A0D7:	; $00 fill; never read in the corpus; between sub_068126 and loc_06D126
	incrom	$06A0D7,$1
Tbl_BoxInputActor_vtable:	; class descriptor of BOXINPUTACTOR: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$06A0D8,$7C
Art_BroodSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 28A0 of 2F84 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $A1A0-C040; jt[503] used by Brood_Init
	incrom	$06A154,$2F84
Tbl_Anim_06D0D8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, VDP_FlushDmaQueue, Anim_AdvanceByDistance; jt[504] used by sub_06D69E, sub_06D9DE, sub_06DA42
	incrom	$06D0D8,$A
Tbl_Anim_06D0E2:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[505] used by sub_06DDA0 -> Obj_ChangeAnim
	incrom	$06D0E2,$E
Tbl_Anim_06D0F0:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[506] used by sub_06D70E, sub_06DB86, sub_06DCDC
	incrom	$06D0F0,$E
Tbl_Anim_06D0FE:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[507] used by sub_06D92C
	incrom	$06D0FE,$10
Tbl_Anim_06D10E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[508] used by sub_06D990
	incrom	$06D10E,$8
Tbl_BroodAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[509] used by Brood_Init -> AiScript_Set
	incrom	$06D116,$E
	incrom	$06D124,$2
	include "src/f/06D126.asm"
Tbl_BroodTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 4 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, Brood_Init, XNpc_KnockbackDist; jt[511] used by Brood_Init
	incrom	$06D12E,$8
Tbl_Brood_vtable:	; class descriptor of BROOD: word name offset $86, parent SMALLBROOD, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$06D136,$8C
	include "src/f/06D1C2.asm"
	include "src/f/06D1D0.asm"
	include "src/f/06D1E6.asm"
	include "src/f/06D1EE.asm"
	include "src/f/06D1F6.asm"
	include "src/f/06D472.asm"
	include "src/f/06D4F6.asm"
	include "src/f/06D51A.asm"
	include "src/f/06D69E.asm"
	include "src/f/06D70E.asm"
	include "src/f/06D848.asm"
	include "src/f/06D92C.asm"
	include "src/f/06D990.asm"
	include "src/f/06D9DE.asm"
	include "src/f/06DA42.asm"
	include "src/f/06DB86.asm"
	include "src/f/06DCB2.asm"
	include "src/f/06DCDC.asm"
	include "src/f/06DD32.asm"
	include "src/f/06DDA0.asm"
	include "src/f/06DDE0.asm"
	include "src/f/06DE3A.asm"
	include "src/f/06DE90.asm"
Lvl_CloneA1Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 3B1 of 3B2 bytes used at runtime; read by Seg_LoadList; jt[523] used by CloneA1_LoadLevel
	incrom	$06DF42,$3B2
Art_CloneA1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 6504 of 66A0 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[524] used by CloneA1_LoadLevel
	incrom	$06E2F4,$66A0
Art_CloneA1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 42 of 5A bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[525] used by CloneA1_LoadLevel
	incrom	$074994,$5A
Art_CloneA1Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 16A2 of 16AC bytes used at runtime; read by Nem_DecodeLoop, VDP_WriteWords, Eni_Decode; jt[526] used by CloneA1_LoadLevel
	incrom	$0749EE,$16AC
Art_LightBeamNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 4F0 of 4F0 bytes used at runtime; read by Nem_DecodeLoop, VDP_WriteWords, Eni_Decode; DMA to VRAM $B140-B5A0; jt[527] used by LightBeam_ClassInit, sub_077256
	incrom	$07609A,$4F0
Tbl_CloneA1Vdp:	; words copied to the VDP data port by VDP_WriteWords; C00 of CCC bytes used at runtime; read by VDP_WriteWords, VDP_DmaToVram; DMA to VRAM $53E0-59E0; jt[528] used by CloneA1_InitSprites, sub_077256
	incrom	$07658A,$CCC
	include "src/f/077256.asm"
Tbl_CloneA1ComputeParallax:	; table read by Scroll_ComputeParallax; 2A of 42 bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax; jt[530] used by CloneA1_RunScene, LightBeam_Init
	incrom	$07737C,$42
Pal_CloneA1Cycle:	; palette data read by Pal_CycleStep; 22 of 22 bytes used at runtime; read by Pal_CycleStep; jt[531] used by CloneA1_CyclePalettes
	incrom	$0773BE,$22
Pal_CloneA1Cycle2:	; palette data read by Pal_CycleStep; 22 of 22 bytes used at runtime; read by Pal_CycleStep; jt[532] used by CloneA1_CyclePalettes
	incrom	$0773E0,$22
	include "src/f/077402.asm"
	include "src/f/077422.asm"
	include "src/f/077462.asm"
	include "src/f/07746A.asm"
	include "src/f/07754A.asm"
	include "src/f/07757C.asm"
	include "src/f/0775AC.asm"
	include "src/f/077624.asm"
	include "src/f/0776DA.asm"
	include "src/f/0776E2.asm"
Tbl_LightBeam_vtable:	; class descriptor of LIGHTBEAM: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$07773C,$78
	include "src/f/0777B4.asm"
	include "src/f/0777C2.asm"
	include "src/f/0777CA.asm"
	include "src/f/0777E0.asm"
	include "src/f/077814.asm"
	include "src/f/077848.asm"
	include "src/f/077988.asm"
	include "src/f/077CBC.asm"
Lvl_CloneA2Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 919 of 91A bytes used at runtime; read by Seg_LoadList; jt[541] used by CloneA2_LoadLevel
	incrom	$077CE0,$91A
Art_CloneA2Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 8A66 of 922C bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[542] used by CloneA2_LoadLevel, CloneA5_RunScene
	incrom	$0785FA,$922C
Tbl_CloneA2ClassList:	; {word $52 bytes; 20 actor class descriptor ptrs} then Pascal name "CloneA2NGClassList"; passed to Level_Load by CloneA2_LoadLevel (classes.py)
	incrom	$081826,$6A
Pal_CloneA2Line0:	; 16 CRAM words: initial palette line 0 (CloneA2_LoadLevel -> g_PalBase)
	incrom	$081890,$20
Pal_CloneA2Line2:	; 16 CRAM words: initial palette line 2 (CloneA2_LoadLevel -> g_PalBase+$40)
	incrom	$0818B0,$20
Pal_CloneA2Bg3:	; 16 CRAM words: background palette for (g_CameraY>>4)&3 = 3 (CloneA2_BgPalTimer)
	incrom	$0818D0,$20
Pal_CloneA2Bg2:	; 16 CRAM words: background palette for (g_CameraY>>4)&3 = 2 (CloneA2_BgPalTimer)
	incrom	$0818F0,$20
Pal_CloneA2Bg1:	; 16 CRAM words: background palette for (g_CameraY>>4)&3 = 1 (CloneA2_BgPalTimer)
	incrom	$081910,$20
Pal_CloneA2Bg0:	; 16 CRAM words: background palette for (g_CameraY>>4)&3 = 0 (CloneA2_BgPalTimer)
	incrom	$081930,$20
Tbl_CloneA2CameraZones:	; 12 records of 6 words {min x, min y, max x + 320, max y + 224, quake trigger x, trigger y} (CloneA2_SetCameraZone, CloneA2_FrameHook)
	incrom	$081950,$90
Tbl_CloneA2QuakeScript:	; camera shake script: byte pairs (dx, dy) added to the camera, $64 = end (g_CamShake; started by CloneA2_StartQuake, run by CloneA5_CamApply)
	incrom	$0819E0,$1D9
	incrom	$081BB9,$1
	include "src/f/081BBA.asm"
	include "src/f/081BC2.asm"
	include "src/f/081BE6.asm"
Sw_081BE6:	; switch table of sub at $081BE6: 6 word offsets from Sw_081BE6-2
	dc.w	CloneA2_FlickerUpdate_Color15Case0-(Sw_081BE6-2), loc_081C86-(Sw_081BE6-2), loc_081C8E-(Sw_081BE6-2), loc_081C96-(Sw_081BE6-2)
	dc.w	loc_081C9E-(Sw_081BE6-2), loc_081CA6-(Sw_081BE6-2)
	include "src/f/081C7E.asm"
	include "src/f/081CAC.asm"
Tbl_CloneA2FlickerPattern:	; 26 bytes, 1 or 2: colour choice per flicker step, read backwards (CloneA2_FlickerUpdate)
	incrom	$081CC4,$1A
Pad_CloneA2:	; $00 fill; never read in the corpus; between CloneA2_FlickerUpdate_SetColor15 and CloneA2_StartQuake
	incrom	$081CDE,$2
	include "src/f/081CE0.asm"
	include "src/f/081D08.asm"
	include "src/f/081DD2.asm"
	include "src/f/081E02.asm"
	include "src/f/081EA6.asm"
	include "src/f/081ED4.asm"
	include "src/f/081EDC.asm"
	include "src/f/081F02.asm"
	include "src/f/081F28.asm"
	include "src/f/081F5A.asm"
	include "src/f/081F62.asm"
Sw_081F62:	; switch table of sub at $081F62: 4 word offsets from Sw_081F62-2
	dc.w	CloneA2_BgPalTimer_Case0-(Sw_081F62-2), loc_081FBE-(Sw_081F62-2), loc_081FC8-(Sw_081F62-2), loc_081FD2-(Sw_081F62-2)
	include "src/f/081FB4.asm"
	include "src/f/081FDA.asm"
	include "src/f/081FFE.asm"
	include "src/f/082038.asm"
	include "src/f/08206A.asm"
	include "src/f/0820AE.asm"
	include "src/f/082176.asm"
	include "src/f/0821D4.asm"
	include "src/f/0821E8.asm"
	include "src/f/082244.asm"
Tbl_DropBombAnimWait:	; animation record passed to Obj_ChangeAnim (stored in obj+$44) by DropBomb_StateStart
	incrom	$082278,$E
Tbl_DropBombAnimFall:	; animation record passed to Obj_ChangeAnim by DropBomb_StateDrop
	incrom	$082286,$E
Tbl_DropBomb_vtable:	; class descriptor of DROPBOMB: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$082294,$77
Pad_CloneA22:	; $00 fill; never read in the corpus; between CloneA2_RunScene and DropBomb_GetSize
	incrom	$08230B,$1
	include "src/f/08230C.asm"
	include "src/f/08231A.asm"
	include "src/f/082330.asm"
	include "src/f/082338.asm"
	include "src/f/082340.asm"
	include "src/f/08243E.asm"
	include "src/f/082472.asm"
	include "src/f/082508.asm"
	include "src/f/082542.asm"
	include "src/f/0825CC.asm"
	include "src/f/08270E.asm"
Art_SmallBroodSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1580 of 192C bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $C080-C6C0; jt[567] used by SmallBrood_Init
	incrom	$082746,$192C
Art_SmallBroodSpr2:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 5 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, VDP_FlushDmaQueue; jt[568] used by SmallBrood_StateWaitCooldown, SmallBrood_StateWaitForPlayer
	incrom	$084072,$A
Tbl_SmallBroodAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[569] used by SmallBrood_ActApproach, SmallBrood_ActChase, SmallBrood_ActKamikaze
	incrom	$08407C,$E
Tbl_SmallBroodAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[570] used by SmallBrood_ActShoot
	incrom	$08408A,$A
Tbl_SmallBroodAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[571] used by SmallBrood_StateFire
	incrom	$084094,$8
Tbl_SmallBroodAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[572] used by SmallBrood_ActJump
	incrom	$08409C,$C
Tbl_SmallBroodAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[573] used by SmallBrood_StateJumpFlip
	incrom	$0840A8,$A
Tbl_SmallBroodAnim6:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[574] used by SmallBrood_StateJumpUntilSurface -> Obj_ChangeAnim
	incrom	$0840B2,$8
Tbl_SmallBroodInit:	; table read by SmallBrood_Init; 5 of 8 bytes used at runtime; read by SmallBrood_Init, XNpc_TakeDamage_Hurt, XNpc_KnockbackDist; jt[575] used by SmallBrood_Init
	incrom	$0840BA,$8
Tbl_SmallBroodAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[576] used by SmallBrood_Init_CaseDefault -> AiScript_Set
	incrom	$0840C2,$A
Tbl_SmallBroodAiScript2:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[577] used by SmallBrood_Init_Case1 -> AiScript_Set
	incrom	$0840CC,$2
	include "src/f/0840CE.asm"
Tbl_SmallBroodStateLand:	; table read by SmallBrood_StateLand; 2 of 2 bytes used at runtime; read by SmallBrood_StateLand; jt[578] used by SmallBrood_Init_Case1
	incrom	$0840D6,$2
	include "src/f/0840D8.asm"
Tbl_SmallBroodStateLand2:	; table read by SmallBrood_StateLand; 2 of 6 bytes used at runtime; read by SmallBrood_StateLand; jt[579] used by SmallBrood_Init_Case1
	incrom	$0840E0,$6
	include "src/f/0840E6.asm"
Tbl_SmallBrood_vtable:	; class descriptor of SMALLBROOD: word name offset $86, parent BIONPC, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$0840FE,$91
Pad_SmallBrood:	; $00 fill; never read in the corpus; between SmallBrood_ScrStepWalk and SmallBrood_GetSize
	incrom	$08418F,$1
	include "src/f/084190.asm"
	include "src/f/08419E.asm"
	include "src/f/0841B4.asm"
	include "src/f/0841BC.asm"
	include "src/f/0841C4.asm"
Sw_0841C4:	; switch table of sub at $0841C4: 4 word offsets from Sw_0841C4-2
	dc.w	SmallBrood_Init_CaseDefault-(Sw_0841C4-2), SmallBrood_Init_Case1-(Sw_0841C4-2), loc_0843FA-(Sw_0841C4-2), loc_08440E-(Sw_0841C4-2)
	include "src/f/0843B8.asm"
	include "src/f/0843CC.asm"
	include "src/f/084420.asm"
	include "src/f/084500.asm"
	include "src/f/084544.asm"
	include "src/f/0845EE.asm"
	include "src/f/08468E.asm"
	include "src/f/0846B2.asm"
	include "src/f/084854.asm"
	include "src/f/0848CA.asm"
	include "src/f/084988.asm"
	include "src/f/0849F4.asm"
	include "src/f/084A44.asm"
	include "src/f/084B28.asm"
	include "src/f/084B94.asm"
	include "src/f/084C62.asm"
	include "src/f/084CC6.asm"
	include "src/f/084D14.asm"
	include "src/f/084D64.asm"
	include "src/f/084DCC.asm"
	include "src/f/084E2A.asm"
	include "src/f/084E8A.asm"
	include "src/f/084EEA.asm"
	include "src/f/084F5A.asm"
	include "src/f/08503E.asm"
	include "src/f/085130.asm"
	include "src/f/08515A.asm"
	include "src/f/0851BE.asm"
Tbl_TeleportReceiver_vtable:	; class descriptor of TELEPORTRECEIVER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$085300,$7F
Pad_SmallBrood2:	; $00 fill; never read in the corpus; between SmallBrood_StateExplode and Teleporter_NoPause
	incrom	$08537F,$1
Tbl_Teleporter_vtable:	; class descriptor of TELEPORTER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$085380,$79
Pad_SmallBrood3:	; $00 fill; never read in the corpus; between SmallBrood_StateExplode and Teleporter_NoPause
	incrom	$0853F9,$1
	include "src/f/0853FA.asm"
	include "src/f/085402.asm"
	include "src/f/085410.asm"
	include "src/f/085444.asm"
	include "src/f/085452.asm"
	include "src/f/085468.asm"
	include "src/f/085470.asm"
	include "src/f/085478.asm"
	include "src/f/08555E.asm"
	include "src/f/085582.asm"
	include "src/f/085696.asm"
	include "src/f/0857DC.asm"
	include "src/f/085850.asm"
	include "src/f/0858F6.asm"
	include "src/f/085932.asm"
	include "src/f/08593E.asm"
	include "src/f/08594C.asm"
	include "src/f/0859B0.asm"
	include "src/f/085AA6.asm"
	include "src/f/085BDE.asm"
	include "src/f/085BE8.asm"
	include "src/f/085C5E.asm"
Str_Empty_085D4A:	; C string "" (used by LittleLeg_New)
	incrom	$085D4A,$2
	include "src/f/085D4C.asm"
	include "src/f/085F0A.asm"
	include "src/f/085F82.asm"
	include "src/f/085FCE.asm"
	include "src/f/085FD8.asm"
	include "src/f/086032.asm"
	include "src/f/086136.asm"
	include "src/f/0861F4.asm"
	include "src/f/086202.asm"
	include "src/f/08627E.asm"
	include "src/f/0862CA.asm"
	include "src/f/0862D8.asm"
Str_Empty_0864E0:	; C string "" (used by BroodBossDamage_Init)
	incrom	$0864E0,$2
	include "src/f/0864E2.asm"
	include "src/f/0864EA.asm"
	include "src/f/08669C.asm"
	include "src/f/0866C0.asm"
	include "src/f/0866CE.asm"
	include "src/f/0868C6.asm"
	include "src/f/0868F0.asm"
	include "src/f/086ABC.asm"
	include "src/f/086C02.asm"
	include "src/f/086C3E.asm"
	include "src/f/086CC4.asm"
	include "src/f/086D5E.asm"
	include "src/f/086DB2.asm"
	include "src/f/086E06.asm"
	include "src/f/086E86.asm"
	include "src/f/086ECE.asm"
	include "src/f/086F28.asm"
	include "src/f/086F70.asm"
	include "src/f/086FCA.asm"
	include "src/f/08702A.asm"
	include "src/f/087072.asm"
	include "src/f/0870AC.asm"
	include "src/f/0870EA.asm"
	include "src/f/08718A.asm"
	include "src/f/087208.asm"
	include "src/f/087294.asm"
	include "src/f/087304.asm"
	include "src/f/087370.asm"
	include "src/f/087426.asm"
	include "src/f/0874DC.asm"
	include "src/f/087516.asm"
	include "src/f/087582.asm"
	include "src/f/087600.asm"
	include "src/f/08765E.asm"
	include "src/f/0876BA.asm"
	include "src/f/087748.asm"
	include "src/f/0877D2.asm"
	include "src/f/087832.asm"
	include "src/f/08789C.asm"
	include "src/f/0878E4.asm"
	include "src/f/08797A.asm"
	include "src/f/0879FE.asm"
	include "src/f/087B22.asm"
	include "src/f/087BAC.asm"
	include "src/f/087BFE.asm"
	include "src/f/087CB4.asm"
	include "src/f/087CEA.asm"
	include "src/f/087DB0.asm"
	include "src/f/087E0C.asm"
	include "src/f/087EBE.asm"
	include "src/f/087EFA.asm"
	include "src/f/087F3C.asm"
	include "src/f/087FEA.asm"
	include "src/f/08803A.asm"
	include "src/f/088044.asm"
	include "src/f/088064.asm"
	include "src/f/088112.asm"
	include "src/f/08827A.asm"
	include "src/f/0883AE.asm"
	include "src/f/0883C2.asm"
	include "src/f/088422.asm"
	include "src/f/0884D2.asm"
	include "src/f/0884E6.asm"
	include "src/f/088588.asm"
	include "src/f/088600.asm"
	include "src/f/08867C.asm"
	include "src/f/08869E.asm"
	include "src/f/088730.asm"
Tbl_BroodBossWallSetAnim:	; table read by ICandy_SetAnim; 1 of 8 bytes used at runtime; read by ICandy_SetAnim; jt[645] used by BroodBossWall_Init
	incrom	$08894C,$8
Tbl_BroodBossUpdate:	; table read by LittleLeg_Update; 1 of 8 bytes used at runtime; read by LittleLeg_Update, ICandy_SetAnim; jt[646] used by BroodBoss_StateCharge
	incrom	$088954,$8
Tbl_LittleLegUpdate:	; table read by LittleLeg_Update; E of 1A bytes used at runtime; read by LittleLeg_Update; jt[647] used by LittleLeg_SetWalking
	incrom	$08895C,$1A
Tbl_LittleLegUpdate2:	; table read by LittleLeg_Update; E of 1A bytes used at runtime; read by LittleLeg_Update; jt[648] used by LittleLeg_SetWalking
	incrom	$088976,$1A
Tbl_LittleLegUpdate3:	; table read by LittleLeg_Update; E of 1A bytes used at runtime; read by LittleLeg_Update; jt[649] used by LittleLeg_SetWalking
	incrom	$088990,$1A
Tbl_BroodBossAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[650] used by BroodBoss_ActClaw, BroodBoss_StateRoar, BroodBoss_StateShockOff
	incrom	$0889AA,$A
Tbl_BroodBossAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[651] used by BroodBoss_StateRetreat
	incrom	$0889B4,$E
Tbl_BroodBossAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1C of 1E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[652] used by BroodBoss_StateWallStop
	incrom	$0889C2,$1E
Tbl_BroodBossAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1E of 20 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[653] used by BroodBoss_ActStomp
	incrom	$0889E0,$20
Tbl_BroodBossAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1A of 1C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[654] used by BroodBoss_ActDropBomb, BroodBoss_ActDropBomb2
	incrom	$088A00,$1C
Tbl_BroodBossAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[655] used by BroodBoss_StateHurt
	incrom	$088A1C,$E
Tbl_BroodBossAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[656] used by BroodBoss_StateDeathStart
	incrom	$088A2A,$E
Tbl_BroodBossAnim8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[657] used by BroodBoss_StateDeathAnim
	incrom	$088A38,$A
Tbl_BroodBossAnim9:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, BroodBoss_ActClaw; jt[658] used by BroodBoss_ActScream
	incrom	$088A42,$12
Tbl_BroodBossActClaw:	; table read by BroodBoss_ActClaw; 2 of 2 bytes used at runtime; read by BroodBoss_ActClaw, Anim_ApplyStep; jt[659] used by BroodBoss_Init
	incrom	$088A54,$2
	include "src/f/088A56.asm"
	include "src/f/088A9A.asm"
Tbl_BroodClawCamApply:	; table read by CloneA5_CamApply; 9 of A bytes used at runtime; read by CloneA5_CamApply; jt[660] used by BroodClaw_Swing
	incrom	$088B06,$A
Tbl_BroodBossCamApply:	; table read by CloneA5_CamApply; D of E bytes used at runtime; read by CloneA5_CamApply; jt[661] used by BroodBoss_StateCharge, BroodBoss_StateChargeWall
	incrom	$088B10,$E
Tbl_CloneA5RunScene:	; table read by CloneA5_RunScene; 20 of 20 bytes used at runtime; read by CloneA5_RunScene, sub_13EA46; jt[662] used by CloneA5_RunScene
	incrom	$088B1E,$20
	incrom	$088B3E,$60
Tbl_BroodBossParts_vtable:	; class descriptor of BROODBOSSPARTS: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$088B9E,$7D
Pad_BroodBoss:	; $00 fill; never read in the corpus; between BroodBoss_ScrStepScream and EvilMaker_GetSize
	incrom	$088C1B,$1
Tbl_LittleLeg_vtable:	; class descriptor of LITTLELEG: word name offset $1A, parent none (root class), 5 method slots from +6, then the name (tools/classes.py)
	incrom	$088C1C,$24
Tbl_BroodBossWall_vtable:	; class descriptor of BROODBOSSWALL: word name offset $26, parent ICANDY, 8 method slots from +6, then the name (tools/classes.py)
	incrom	$088C40,$34
Tbl_BroodBossArm_vtable:	; class descriptor of BROODBOSSARM: word name offset $6E, parent BROODBOSSPARTS, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$088C74,$7B
Pad_BroodBoss2:	; $00 fill; never read in the corpus; between BroodBoss_ScrStepScream and EvilMaker_GetSize
	incrom	$088CEF,$1
Tbl_BroodBossDamage_vtable:	; class descriptor of BROODBOSSDAMAGE: word name offset $6E, parent BROODBOSSPARTS, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$088CF0,$7E
Tbl_BroodBoss_vtable:	; class descriptor of BROODBOSS: word name offset $6E, parent BROODBOSSPARTS, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$088D6E,$78
Lvl_CloneA5Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 29 of 2A bytes used at runtime; read by Seg_LoadList; jt[670] used by CloneA5_RunScene
	incrom	$088DE6,$2A
Art_CloneA5Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 1C66 of 1C70 bytes used at runtime; read by Nem_DecodeLoop, Seg_LoadList; jt[671] used by CloneA5_RunScene
	incrom	$088E10,$1C70
Art_CloneA5Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 56F of 570 bytes used at runtime; read by Nem_DecodeLoop, Seg_LoadList; jt[672] used by CloneA5_RunScene
	incrom	$08AA80,$570
Map_CloneA5Eni:	; Enigma-compressed tilemap (Eni_Decode); 1BE7 of 1D38 bytes used at runtime; read by Eni_ReadInline, Eni_Decode; jt[673] used by CloneA5_RunScene
	incrom	$08AFF0,$1D38
Map_CloneA5Eni2:	; Enigma-compressed tilemap (Eni_Decode); 62 of 80 bytes used at runtime; read by Eni_ReadInline, Eni_Decode; jt[674] used by CloneA5_RunScene
	incrom	$08CD28,$80
Art_BroodBossSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3DC0 of 4806 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $C8C0-CFC0; jt[675] used by BroodBoss_Init, BroodBoss_StateSetup
	incrom	$08CDA8,$4806
Art_CloneA5Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 774 of 774 bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; jt[676] used by CloneA5_LoadResources, XClone_LoadResources
	incrom	$0915AE,$774
Art_BroodBossArmSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; C40 of D70 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $D020-D2C0; jt[677] used by BroodBossArm_Init
	incrom	$091D22,$D70
Art_BroodClawSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 377 of 378 bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop, VDP_FlushDmaQueue; jt[678] used by BroodClaw_Draw, CloneA5_LoadResources
	incrom	$092A92,$378
Art_CloneA5Spr2:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 83D of 83E bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[679] used by CloneA5_LoadResources
	incrom	$092E0A,$83E
Art_CloneA5Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2AF of 2B0 bytes used at runtime; read by Nem_DecodeLoop; jt[680] used by CloneA5_LoadResources
	incrom	$093648,$2B0
Art_CloneA5Spr3:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 600 of 678 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $8180-8580; jt[681] used by CloneA5_InitShockSprites
	incrom	$0938F8,$678
Art_DropBombSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 540 of 656 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $A300-A5A0; jt[682] used by DropBomb_Init
	incrom	$093F70,$656
	include "src/f/0945C6.asm"
	include "src/f/0945D4.asm"
	include "src/f/0945E0.asm"
	include "src/f/0946BA.asm"
	include "src/f/09472E.asm"
	include "src/f/094752.asm"
	include "src/f/0947A6.asm"
	include "src/f/094834.asm"
	include "src/f/094850.asm"
	include "src/f/0948DE.asm"
	include "src/f/09496C.asm"
	include "src/f/0949FA.asm"
	include "src/f/094A88.asm"
	include "src/f/094B16.asm"
	include "src/f/094BA4.asm"
Tbl_EvilMaker_vtable:	; class descriptor of EVILMAKER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$094BAC,$78
Tbl_EvilMakerAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[697] used by EvilMaker_Init -> AiScript_Set
	incrom	$094C24,$2
	include "src/f/094C26.asm"
	include "src/f/094C82.asm"
	include "src/f/094C90.asm"
	include "src/f/094CDA.asm"
	include "src/f/094CE6.asm"
	include "src/f/094CF2.asm"
	include "src/f/094E7A.asm"
	include "src/f/094EFC.asm"
	include "src/f/094F20.asm"
	include "src/f/094F50.asm"
	include "src/f/094FB2.asm"
	include "src/f/095014.asm"
	include "src/f/095094.asm"
	include "src/f/0950D6.asm"
	include "src/f/09511E.asm"
Tbl_EvilDrop_vtable:	; class descriptor of EVILDROP: word name offset $6E, parent BIOBALLS, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$095126,$77
Pad_EvilDrop:	; $00 fill; never read in the corpus; between EvilDrop_NopStatic and XClone_GetSize
	incrom	$09519D,$1
Tbl_EvilDropBioBalls:	; data handed to BioBalls_SetPathCollapsed (format not established); never read in the corpus; jt[707] used by EvilDrop_Init, EvilDrop_ActOpen -> BioBalls_SetPathCollapsed
	incrom	$09519E,$5C
Tbl_EvilDropAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[708] used by EvilDrop_Init -> AiScript_Set
	incrom	$0951FA,$E
	include "src/f/095208.asm"
	include "src/f/095216.asm"
	include "src/f/09522C.asm"
	include "src/f/095238.asm"
	include "src/f/095250.asm"
	include "src/f/0954C8.asm"
	include "src/f/09550C.asm"
	include "src/f/095586.asm"
	include "src/f/09558E.asm"
	include "src/f/095618.asm"
	include "src/f/0956D2.asm"
	include "src/f/095758.asm"
	include "src/f/095876.asm"
	include "src/f/0958F6.asm"
	include "src/f/095968.asm"
	include "src/f/0959E0.asm"
	include "src/f/095A5A.asm"
	include "src/f/095ABC.asm"
	include "src/f/095B1E.asm"
	include "src/f/095C22.asm"
	include "src/f/095CB2.asm"
	include "src/f/095DDC.asm"
	include "src/f/095ECA.asm"
	include "src/f/095FA6.asm"
	include "src/f/096082.asm"
	include "src/f/09615C.asm"
	include "src/f/0961F0.asm"
	include "src/f/096270.asm"
	include "src/f/096318.asm"
	include "src/f/096330.asm"
	include "src/f/096396.asm"
	include "src/f/096434.asm"
	include "src/f/096490.asm"
	include "src/f/0964F4.asm"
	include "src/f/096568.asm"
	include "src/f/0965DC.asm"
	include "src/f/096650.asm"
	include "src/f/0966C4.asm"
	include "src/f/096718.asm"
	include "src/f/09676C.asm"
	include "src/f/0967C0.asm"
	include "src/f/09687C.asm"
	include "src/f/096998.asm"
	include "src/f/096A36.asm"
	include "src/f/096AA2.asm"
	include "src/f/096B16.asm"
	include "src/f/096B90.asm"
	include "src/f/096C30.asm"
	include "src/f/096C9A.asm"
	incrom	$096D30,$6
	include "src/f/096D36.asm"
	include "src/f/096D82.asm"
	include "src/f/096DF2.asm"
	include "src/f/096F3E.asm"
	include "src/f/097016.asm"
	include "src/f/09708A.asm"
	include "src/f/09715A.asm"
	include "src/f/09722C.asm"
	include "src/f/0972B2.asm"
	include "src/f/097338.asm"
	include "src/f/0973B4.asm"
	include "src/f/097426.asm"
	include "src/f/09749E.asm"
	include "src/f/097514.asm"
	include "src/f/0975B8.asm"
	include "src/f/097642.asm"
	include "src/f/097698.asm"
	include "src/f/097712.asm"
	include "src/f/097786.asm"
	include "src/f/097834.asm"
	include "src/f/097904.asm"
	include "src/f/097974.asm"
	include "src/f/097AA2.asm"
	include "src/f/097C7A.asm"
	include "src/f/097D08.asm"
	include "src/f/097D60.asm"
	include "src/f/097DB4.asm"
	include "src/f/097DC2.asm"
	include "src/f/097E32.asm"
	include "src/f/097EE0.asm"
	include "src/f/097F60.asm"
	include "src/f/097FD0.asm"
	include "src/f/097FDA.asm"
	include "src/f/09806C.asm"
	include "src/f/0981FC.asm"
	include "src/f/098236.asm"
	include "src/f/098282.asm"
	include "src/f/098290.asm"
	include "src/f/0982FC.asm"
	include "src/f/09830A.asm"
	include "src/f/098376.asm"
	include "src/f/0983E8.asm"
	include "src/f/0983F6.asm"
	include "src/f/098468.asm"
	include "src/f/098568.asm"
	include "src/f/098606.asm"
	include "src/f/098614.asm"
	include "src/f/098680.asm"
	include "src/f/0986E8.asm"
	include "src/f/09874E.asm"
	include "src/f/0987E2.asm"
	include "src/f/098830.asm"
	include "src/f/0988F6.asm"
	include "src/f/098990.asm"
	include "src/f/09899E.asm"
	include "src/f/098A0A.asm"
	include "src/f/098A66.asm"
	include "src/f/098AD2.asm"
	include "src/f/098B44.asm"
	include "src/f/098B52.asm"
	include "src/f/098BBE.asm"
	include "src/f/098C4E.asm"
	include "src/f/098CC8.asm"
	include "src/f/098DA8.asm"
Sw_098DA8:	; switch table of sub at $098DA8: 7 word offsets from Sw_098DA8-2
	dc.w	XClone_SpawnByType_Case1-(Sw_098DA8-2), loc_098E32-(Sw_098DA8-2), loc_098E6C-(Sw_098DA8-2), loc_098EA6-(Sw_098DA8-2)
	dc.w	loc_098EE0-(Sw_098DA8-2), loc_098F18-(Sw_098DA8-2), XClone_SpawnByType_Case7-(Sw_098DA8-2)
	include "src/f/098DF8.asm"
	include "src/f/098F50.asm"
	include "src/f/098F86.asm"
	include "src/f/098F92.asm"
	include "src/f/098FB6.asm"
	include "src/f/099016.asm"
Str_Empty_099078:	; C string "" (used by XClone_StartMakerMode)
	incrom	$099078,$2
	include "src/f/09907A.asm"
Sw_09907A:	; switch table of sub at $09907A: 7 word offsets from Sw_09907A-2
	dc.w	XClone_LockArena_Case1-(Sw_09907A-2), loc_0991D6-(Sw_09907A-2), XClone_LockArena_Case3-(Sw_09907A-2), XClone_LockArena_Case4-(Sw_09907A-2)
	dc.w	loc_0991C6-(Sw_09907A-2), loc_0991DA-(Sw_09907A-2), loc_0991D2-(Sw_09907A-2)
	include "src/f/0991C2.asm"
	include "src/f/0991CA.asm"
	include "src/f/0991CE.asm"
	include "src/f/0991DC.asm"
	include "src/f/09921E.asm"
	include "src/f/0993C0.asm"
	include "src/f/0993DC.asm"
	include "src/f/099466.asm"
	include "src/f/099526.asm"
	include "src/f/09980C.asm"
	include "src/f/09984A.asm"
	include "src/f/09989E.asm"
	include "src/f/0998E6.asm"
	include "src/f/099BBE.asm"
	include "src/f/099BF0.asm"
	include "src/f/099C22.asm"
	include "src/f/099C36.asm"
	include "src/f/099C88.asm"
Tbl_XClone_vtable:	; class descriptor of XCLONE: word name offset $86, parent BIONPC, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$099C90,$8D
Pad_XClone:	; $00 fill; never read in the corpus; between XClone_NopStatic and XClone_PodScript
	incrom	$099D1D,$1
Tbl_EvilBeast_vtable:	; class descriptor of EVILBEAST: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$099D1E,$90
Tbl_EvilBeam_vtable:	; class descriptor of EVILBEAM: word name offset $1A, parent none (root class), 5 method slots from +6, then the name (tools/classes.py)
	incrom	$099DAE,$23
Pad_XClone2:	; $00 fill; never read in the corpus; between XClone_NopStatic and XClone_PodScript
	incrom	$099DD1,$1
Tbl_EvilCyclops_vtable:	; class descriptor of EVILCYCLOPS: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$099DD2,$92
Tbl_EvilGambit_vtable:	; class descriptor of EVILGAMBIT: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$099E64,$91
Pad_XClone3:	; $00 fill; never read in the corpus; between XClone_NopStatic and XClone_PodScript
	incrom	$099EF5,$1
Tbl_EvilMagneto_vtable:	; class descriptor of EVILMAGNETO: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$099EF6,$92
Tbl_EvilNightcrawler_vtable:	; class descriptor of EVILNIGHTCRAWLER: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$099F88,$97
Pad_XClone4:	; $00 fill; never read in the corpus; between XClone_NopStatic and XClone_PodScript
	incrom	$09A01F,$1
Tbl_EvilPsylocke_vtable:	; class descriptor of EVILPSYLOCKE: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$09A020,$93
Pad_XClone5:	; $00 fill; never read in the corpus; between XClone_NopStatic and XClone_PodScript
	incrom	$09A0B3,$1
Tbl_EvilWolverine_vtable:	; class descriptor of EVILWOLVERINE: word name offset $86, parent XCLONE, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$09A0B4,$94
Tbl_XCloneCopy:	; table read by Mem_Copy; 20 of 20 bytes used at runtime; read by Mem_Copy; jt[805] used by XClone_SetBgPalette
	incrom	$09A148,$20
Tbl_XCloneSetBgPalette:	; format not established; never read in the corpus; jt[806] used by XClone_SetBgPalette
	incrom	$09A168,$20
Tbl_XCloneCopy2:	; table read by Mem_Copy; 20 of 20 bytes used at runtime; read by Mem_Copy; jt[807] used by XClone_SetBgPalette
	incrom	$09A188,$20
Tbl_XCloneActClearAnim:	; table read by BioBalls_ActClearAnim; 2 of 2 bytes used at runtime; read by BioBalls_ActClearAnim, Mem_Copy; jt[808] used by XClone_ActBecomeBalls, XClone_ActOpenBioBalls, XClone_StatePodOpen
	incrom	$09A1A8,$2
	include "src/f/09A1AA.asm"
Tbl_XCloneAiScript_09A1AE:	; word $0000 (2 bytes), not a string: reached only via jt[809] used by XClone_ActUnhittableScript -> AiScript_Set (e.g. an empty list/script count)
	incrom	$09A1AE,$1
Tbl_XCloneStateWaitChild:	; table read by XClone_StateWaitChild; 1 of 1 bytes used at runtime; read by XClone_StateWaitChild
	incrom	$09A1AF,$1
	include "src/f/09A1B0.asm"
Tbl_XCloneAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[810] used by XClone_Init -> AiScript_Set
	incrom	$09A1E0,$36
Tbl_XCloneInit:	; table read by XClone_Init; 2 of E bytes used at runtime; read by XClone_Init; jt[811] used by XClone_Init
	incrom	$09A216,$E
Tbl_XCloneTileHookReward:	; format not established; never read in the corpus; jt[812] used by XClone_TileHookReward -> sub_13EFA0
	incrom	$09A224,$F0
Tbl_XCloneActFacePlayer:	; table read by XClone_ActFacePlayer; 2 of 2 bytes used at runtime; read by XClone_ActFacePlayer; jt[813] used by XClone_Explode
	incrom	$09A314,$2
	include "src/f/09A316.asm"
Tbl_XCloneActCheckLowHealth:	; table read by XClone_ActCheckLowHealth; 2 of 2 bytes used at runtime; read by XClone_ActCheckLowHealth
	incrom	$09A33A,$2
	include "src/f/09A33C.asm"
Tbl_XCloneActAttack:	; table read by XClone_ActAttack; 2 of 16 bytes used at runtime; read by XClone_ActAttack
	incrom	$09A344,$16
	include "src/f/09A35A.asm"
Tbl_XCloneAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of 54 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$09A36A,$54
Tbl_EvilMakerSetPathCollapsed:	; table read by BioBalls_SetPathCollapsed; 3E of 7C bytes used at runtime; read by BioBalls_SetPathCollapsed, BioBalls_Move; jt[814] used by EvilMaker_ActDropBeast
	incrom	$09A3BE,$7C
Tbl_EvilBeastStateEmerge:	; table read by XClone_StateEmerge; A of 46 bytes used at runtime; read by XClone_StateEmerge, XClone_StatePodOpen, EvilBeast_Init; jt[815] used by EvilBeast_Init
	incrom	$09A43A,$46
	include "src/f/09A480.asm"
Tbl_XCloneAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 3 of 46 bytes used at runtime; read by Anim_ApplyStep, BioBalls_SetPathCollapsed, BioBalls_Move
	incrom	$09A49C,$46
Tbl_EvilMakerSetPathCollapsed2:	; table read by BioBalls_SetPathCollapsed; 32 of 64 bytes used at runtime; read by BioBalls_SetPathCollapsed, BioBalls_Move; jt[816] used by EvilMaker_ActDropCyclops
	incrom	$09A4E2,$64
Tbl_EvilCyclopsActStand10:	; table read by XClone_ActStand10; A of 2A bytes used at runtime; read by XClone_ActStand10, XClone_StateEmerge, XClone_StatePodOpen; jt[817] used by EvilCyclops_Init
	incrom	$09A546,$2A
	include "src/f/09A570.asm"
Tbl_XCloneAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of 38 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$09A584,$38
Tbl_EvilMakerSetPathCollapsed3:	; table read by BioBalls_SetPathCollapsed; 36 of 6C bytes used at runtime; read by BioBalls_SetPathCollapsed, BioBalls_Move; jt[818] used by EvilMaker_ActDropGambit
	incrom	$09A5BC,$6C
Tbl_EvilGambitActBallsPath:	; format not established; never read in the corpus; jt[819] used by EvilGambit_ActBallsPath
	incrom	$09A628,$D4
Tbl_EvilGambitStateEmerge:	; table read by XClone_StateEmerge; 8 of 7C bytes used at runtime; read by XClone_StateEmerge, XClone_StatePodOpen, EvilGambit_Init; jt[820] used by EvilGambit_Init
	incrom	$09A6FC,$7C
Tbl_EvilMakerEvilDrop:	; data handed to EvilDrop_Spawn (format not established); never read in the corpus; jt[821] used by EvilMaker_ActDropMagneto -> EvilDrop_Spawn
	incrom	$09A778,$7C
Tbl_EvilMagnetoActCheckLowHealth:	; table read by XClone_ActCheckLowHealth; 2 of 10 bytes used at runtime; read by XClone_ActCheckLowHealth; jt[822] used by EvilMagneto_Init
	incrom	$09A7F4,$10
	include "src/f/09A804.asm"
Tbl_XCloneActFacePlayer2:	; table read by XClone_ActFacePlayer; 2 of 12 bytes used at runtime; read by XClone_ActFacePlayer
	incrom	$09A810,$12
	include "src/f/09A822.asm"
Tbl_XCloneAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of 34 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$09A836,$34
Tbl_EvilMakerSetPathCollapsed4:	; table read by BioBalls_SetPathCollapsed; 26 of 4C bytes used at runtime; read by BioBalls_SetPathCollapsed, BioBalls_Move; jt[823] used by EvilMaker_ActDropNightcrawler
	incrom	$09A86A,$4C
Tbl_EvilNightcrawlerActCheckLowHealth:	; table read by XClone_ActCheckLowHealth; A of 10 bytes used at runtime; read by XClone_ActCheckLowHealth, XClone_StateEmerge, XClone_StatePodOpen; jt[824] used by EvilNightcrawler_Init
	incrom	$09A8B6,$10
	include "src/f/09A8C6.asm"
	include "src/f/09A8D2.asm"
Tbl_XCloneActAttack2:	; table read by XClone_ActAttack; 2 of 2 bytes used at runtime; read by XClone_ActAttack
	incrom	$09A8F6,$2
	include "src/f/09A8F8.asm"
Tbl_XCloneStateWaitChild2:	; table read by XClone_StateWaitChild; 2 of 2 bytes used at runtime; read by XClone_StateWaitChild
	incrom	$09A908,$2
	include "src/f/09A90A.asm"
Tbl_XCloneAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$09A93A,$16
Tbl_EvilMakerSetPathCollapsed5:	; table read by BioBalls_SetPathCollapsed; 2E of 5C bytes used at runtime; read by BioBalls_SetPathCollapsed, BioBalls_Move; jt[825] used by EvilMaker_ActDropPsylocke
	incrom	$09A950,$5C
Tbl_EvilPsylockeMotionPath:	; table read by BioBalls_MotionPath; 52 of A4 bytes used at runtime; read by BioBalls_MotionPath; jt[826] used by EvilPsylocke_ActBallsPath
	incrom	$09A9AC,$A4
Tbl_EvilPsylockeStateEmerge:	; table read by XClone_StateEmerge; C of 3A bytes used at runtime; read by XClone_StateEmerge, XClone_StatePodOpen, EvilPsylocke_Init; jt[827] used by EvilPsylocke_Init
	incrom	$09AA50,$3A
	include "src/f/09AA8A.asm"
Tbl_XCloneAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 14 of 44 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance
	incrom	$09AA9E,$44
Tbl_EvilMakerMove:	; table read by BioBalls_Move; 32 of 64 bytes used at runtime; read by BioBalls_Move, BioBalls_SetFormation; jt[828] used by EvilMaker_ActDropWolverine
	incrom	$09AAE2,$64
Tbl_EvilWolverineActCloseBioBalls:	; table read by XClone_ActCloseBioBalls; 8 of E bytes used at runtime; read by XClone_ActCloseBioBalls, XClone_ActBallsToFloor, EvilWolverine_Init; jt[829] used by EvilWolverine_Init
	incrom	$09AB46,$E
Tbl_XCloneBioBalls:	; data handed to BioBalls_StartPath (format not established); never read in the corpus; jt[830] used by XClone_ActBallsCollapse -> BioBalls_StartPath
	incrom	$09AB54,$7C
Tbl_XCloneImpact:	; format not established; never read in the corpus; jt[831] used by XClone_Impact -> sub_13EFA0, XClone_FrameHookCollapse -> sub_13EFA0
	incrom	$09ABD0,$48
Tbl_XCloneImpact2:	; format not established; never read in the corpus; jt[832] used by XClone_Impact
	incrom	$09AC18,$70
Tbl_XCloneFrameHookCollapse:	; format not established; never read in the corpus; jt[833] used by XClone_FrameHookCollapse -> sub_1600AA
	incrom	$09AC88,$46
	include "src/f/09ACCE.asm"
	include "src/f/09ACDC.asm"
	include "src/f/09AD96.asm"
	include "src/f/09AE80.asm"
	include "src/f/09AF3E.asm"
	include "src/f/09B168.asm"
	include "src/f/09B1AC.asm"
	include "src/f/09B224.asm"
	include "src/f/09B45E.asm"
	include "src/f/09B4BC.asm"
	include "src/f/09B50C.asm"
	include "src/f/09B55C.asm"
	include "src/f/09B60A.asm"
	include "src/f/09B6A2.asm"
	include "src/f/09B8A0.asm"
	include "src/f/09B968.asm"
Tbl_BroodClaw_vtable:	; class descriptor of BROODCLAW: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$09B98C,$78
Tbl_XCloneSetFormation:	; table read by BioBalls_SetFormation; 2A of 54 bytes used at runtime; read by BioBalls_SetFormation; jt[844] used by XClone_ActOpenBioBalls
	incrom	$09BA04,$54
Lvl_SavageA2Data:	; level data read by Level_AssignBlockSlots; 28C0 of 28CA bytes used at runtime; read by Level_AssignBlockSlots, Seg_LoadList; jt[845] used by SavageA2_LoadLevel, SavageA3_LoadLevel
	incrom	$09BA58,$28CA
Lvl_BroodClawData:	; level data read by Level_AssignBlockSlots; 89F of 8A0 bytes used at runtime; read by Level_AssignBlockSlots, Seg_LoadList; jt[846] used by SavageB1_LoadLevel
	incrom	$09E322,$8A0
Map_BroodClawEni:	; Enigma-compressed tilemap (Eni_Decode); 1AA9 of 1E4A bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Eni_Ops; jt[847] used by SavageB1_LoadLevel
	incrom	$09EBC2,$1E4A
Map_BroodClawEni2:	; Enigma-compressed tilemap (Eni_Decode); 32 of 4A bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Eni_Ops; jt[848] used by SavageB1_LoadLevel
	incrom	$0A0A0C,$4A
Lvl_BroodClawSegs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 18A of 1A6 bytes used at runtime; read by Seg_LoadList, Eni_ReadInline, Level_Load; jt[849] used by SavageB1_LoadLevel
	incrom	$0A0A56,$1A6
Lvl_SavageA2Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 4B3 of 4B4 bytes used at runtime; read by Seg_LoadList, Eni_ReadInline, Eni_Decode; jt[850] used by SavageA2_LoadLevel
	incrom	$0A0BFC,$4B4
Art_SavageA2Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 633B of 65B4 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[851] used by SavageA2_LoadLevel, SavageA3_LoadLevel
	incrom	$0A10B0,$65B4
Art_SavageA2Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 52 of 6C bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[852] used by SavageA2_LoadLevel
	incrom	$0A7664,$6C
Art_FloatBubbleSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; BD0 of BD0 bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; jt[853] used by FloatBubble_ClassInit
	incrom	$0A76D0,$BD0
Art_FloatBubbleExplodeSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; A20 of B24 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $9A40-A360; jt[854] used by FloatBubbleExplode_Init
	incrom	$0A82A0,$B24
Art_SavageA2Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2000 of 21E4 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $5300-5700; jt[855] used by SavageA2_InitLights
	incrom	$0A8DC4,$21E4
Tbl_BubbleManager_vtable:	; class descriptor of BUBBLEMANAGER: word name offset $82, parent XNPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0AAFA8,$90
	include "src/f/0AB038.asm"
	include "src/f/0AB046.asm"
	include "src/f/0AB04E.asm"
	include "src/f/0AB05A.asm"
	include "src/f/0AB070.asm"
	include "src/f/0AB080.asm"
	include "src/f/0AB0E6.asm"
	include "src/f/0AB128.asm"
	include "src/f/0AB1CA.asm"
	include "src/f/0AB1EE.asm"
	include "src/f/0AB24E.asm"
	include "src/f/0AB2CC.asm"
	include "src/f/0AB30C.asm"
	include "src/f/0AB350.asm"
	include "src/f/0AB370.asm"
Sw_0AB370:	; switch table of sub at $0AB370: 6 word offsets from Sw_0AB370-2
	dc.w	BubbleManager_SetWaveParams_Case1-(Sw_0AB370-2), BubbleManager_SetWaveParams_Case2-(Sw_0AB370-2), loc_0AB3C8-(Sw_0AB370-2), loc_0AB3DC-(Sw_0AB370-2)
	dc.w	loc_0AB3F0-(Sw_0AB370-2), loc_0AB404-(Sw_0AB370-2)
	incrom	$0AB3A2,$2
	include "src/f/0AB3A4.asm"
	include "src/f/0AB3B6.asm"
	include "src/f/0AB416.asm"
	include "src/f/0AB41E.asm"
	include "src/f/0AB46C.asm"
Tbl_FloatBubble_vtable:	; class descriptor of FLOATBUBBLE: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0AB496,$7A
	include "src/f/0AB510.asm"
	include "src/f/0AB51E.asm"
	include "src/f/0AB526.asm"
Sw_0AB526:	; switch table of sub at $0AB526: 8 word offsets from Sw_0AB526-2
	dc.w	FloatBubble_SetDirection_Up-(Sw_0AB526-2), FloatBubble_SetDirection_UpRight-(Sw_0AB526-2), FloatBubble_SetDirection_Right-(Sw_0AB526-2), FloatBubble_SetDirection_DownRight-(Sw_0AB526-2)
	dc.w	FloatBubble_SetDirection_Down-(Sw_0AB526-2), loc_0AB610-(Sw_0AB526-2), FloatBubble_SetDirection_Left-(Sw_0AB526-2), loc_0AB58E-(Sw_0AB526-2)
	include "src/f/0AB55C.asm"
	include "src/f/0AB5DE.asm"
	include "src/f/0AB65E.asm"
	include "src/f/0AB68E.asm"
	include "src/f/0AB6D8.asm"
	include "src/f/0AB706.asm"
	include "src/f/0AB750.asm"
	include "src/f/0AB75A.asm"
	include "src/f/0AB7A8.asm"
	include "src/f/0AB7EC.asm"
	include "src/f/0AB822.asm"
	include "src/f/0AB858.asm"
	include "src/f/0AB88E.asm"
	include "src/f/0AB8C4.asm"
	include "src/f/0AB8FA.asm"
	include "src/f/0AB930.asm"
	include "src/f/0AB97C.asm"
	include "src/f/0AB9A8.asm"
	include "src/f/0AB9DE.asm"
	include "src/f/0ABA14.asm"
	include "src/f/0ABA4A.asm"
	include "src/f/0ABA92.asm"
	include "src/f/0ABAC8.asm"
	include "src/f/0ABAFE.asm"
	include "src/f/0ABB1A.asm"
	include "src/f/0ABB42.asm"
	include "src/f/0ABB4E.asm"
	include "src/f/0ABB64.asm"
	include "src/f/0ABBBE.asm"
	include "src/f/0ABC26.asm"
	include "src/f/0ABC56.asm"
	include "src/f/0ABE7A.asm"
	include "src/f/0ABEDA.asm"
	include "src/f/0ABF3A.asm"
	include "src/f/0AC01E.asm"
Sw_0AC01E:	; switch table of sub at $0AC01E: 5 word offsets from Sw_0AC01E-2
	dc.w	FloatBubble_Init_Speed1-(Sw_0AC01E-2), FloatBubble_Init_Speed2-(Sw_0AC01E-2), loc_0AC13E-(Sw_0AC01E-2), loc_0AC144-(Sw_0AC01E-2)
	dc.w	FloatBubble_Init_Speed5-(Sw_0AC01E-2)
	include "src/f/0AC132.asm"
	include "src/f/0AC138.asm"
	include "src/f/0AC14A.asm"
	include "src/f/0AC14E.asm"
Tbl_FloatBubbleExplode_vtable:	; class descriptor of FLOATBUBBLEEXPLODE: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0AC1B8,$81
Pad_FloatBubble:	; $00 fill; never read in the corpus; between FloatBubble_Init_SetSpeed and FloatBubbleExplode_GetSize
	incrom	$0AC239,$1
	include "src/f/0AC23A.asm"
	include "src/f/0AC248.asm"
	include "src/f/0AC250.asm"
	include "src/f/0AC27C.asm"
	include "src/f/0AC2B2.asm"
	include "src/f/0AC2CE.asm"
	include "src/f/0AC2DA.asm"
	include "src/f/0AC2F0.asm"
	include "src/f/0AC308.asm"
Tbl_FloatBubbleExplodeAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[882] used by FloatBubbleExplode_StateStart
	incrom	$0AC3A0,$12
Tbl_PerimeterDoor_vtable:	; class descriptor of PERIMETERDOOR: word name offset $72, parent ACTOR, 27 method slots from +6, then the name (tools/classes.py)
	incrom	$0AC3B2,$80
	include "src/f/0AC432.asm"
	include "src/f/0AC440.asm"
	include "src/f/0AC448.asm"
	include "src/f/0AC45E.asm"
	include "src/f/0AC46E.asm"
	include "src/f/0AC4E8.asm"
	include "src/f/0AC91C.asm"
	include "src/f/0AC956.asm"
	include "src/f/0AC982.asm"
	include "src/f/0AD060.asm"
	include "src/f/0AD166.asm"
	include "src/f/0AD16E.asm"
	include "src/f/0AD176.asm"
	include "src/f/0AD1BC.asm"
	include "src/f/0AD342.asm"
	include "src/f/0AD3E8.asm"
	include "src/f/0AD420.asm"
	include "src/f/0AD486.asm"
Tbl_SavageA2LightFrames2:	; 32 bytes: frame+1 of the second light sprite per step, read backwards (SavageA2_AnimLights)
	incrom	$0AD50C,$20
Pad_SavageA2:	; $00 fill; never read in the corpus; between SavageA2_AnimLights and SavageA2_CamUpdateFlood
	incrom	$0AD52C,$2
Tbl_SavageA2LightFrames1:	; 32 bytes: frame+1 of the first light sprite per step, read backwards (SavageA2_AnimLights)
	incrom	$0AD52E,$20
Pad_SavageA22:	; $00 fill; never read in the corpus; between SavageA2_AnimLights and SavageA2_CamUpdateFlood
	incrom	$0AD54E,$2
	include "src/f/0AD550.asm"
	include "src/f/0AD674.asm"
	include "src/f/0AD790.asm"
	include "src/f/0AD7BE.asm"
	include "src/f/0AD7E4.asm"
	include "src/f/0AD824.asm"
	include "src/f/0AD84A.asm"
	include "src/f/0AD866.asm"
	include "src/f/0AD8EC.asm"
	include "src/f/0AD902.asm"
	include "src/f/0AD90A.asm"
	include "src/f/0AD91A.asm"
Tbl_TrapDoor_vtable:	; class descriptor of TRAPDOOR: word name offset $86, parent XNPC, 32 method slots from +6, then the name (tools/classes.py)
	incrom	$0AD956,$8F
Pad_SavageA23:	; $00 fill; never read in the corpus; between SavageA2_RunScene and TrapDoor_GetSize
	incrom	$0AD9E5,$1
	include "src/f/0AD9E6.asm"
	include "src/f/0AD9F4.asm"
	include "src/f/0AD9FC.asm"
	include "src/f/0ADA12.asm"
	include "src/f/0ADA1E.asm"
	include "src/f/0ADB1A.asm"
	include "src/f/0ADB7E.asm"
	include "src/f/0ADBBE.asm"
	include "src/f/0ADBE8.asm"
	include "src/f/0ADC26.asm"
	include "src/f/0ADCD8.asm"
	include "src/f/0ADD8A.asm"
	include "src/f/0ADE06.asm"
	include "src/f/0ADE40.asm"
	include "src/f/0ADE7A.asm"
Lvl_SavageA3Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 557 of 558 bytes used at runtime; read by Seg_LoadList; jt[903] used by SavageA3_LoadLevel
	incrom	$0ADEBA,$558
Map_SavageA3Eni:	; Enigma-compressed tilemap (Eni_Decode); 1B7E of 1E6E bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Actor_InitSpawnRec; jt[904] used by SavageA3_LoadLevel
	incrom	$0AE412,$1E6E
Map_SavageA3Eni2:	; Enigma-compressed tilemap (Eni_Decode); 52 of 6C bytes used at runtime; read by Eni_ReadInline, Eni_Decode, Eni_Ops; jt[905] used by SavageA3_LoadLevel
	incrom	$0B0280,$6C
	include "src/f/0B02EC.asm"
	include "src/f/0B02F4.asm"
	include "src/f/0B02FC.asm"
	include "src/f/0B03A2.asm"
	include "src/f/0B03DA.asm"
	include "src/f/0B0408.asm"
	include "src/f/0B042E.asm"
	include "src/f/0B0468.asm"
	include "src/f/0B0484.asm"
	include "src/f/0B050A.asm"
	include "src/f/0B0520.asm"
	include "src/f/0B0528.asm"
	include "src/f/0B0538.asm"
Lvl_SavageA4Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 3B of 3C bytes used at runtime; read by Seg_LoadList; jt[907] used by SavageA4_LoadLevel
	incrom	$0B0574,$3C
Art_SavageA4Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 356A of 3578 bytes used at runtime; read by Nem_DecodeLoop; jt[908] used by SavageA4_LoadLevel
	incrom	$0B05B0,$3578
Art_SavageA4Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 4A of 68 bytes used at runtime; read by Nem_DecodeLoop; jt[909] used by SavageA4_LoadLevel
	incrom	$0B3B28,$68
Art_SavageA4Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 17A4 of 17AE bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[910] used by SavageA4_LoadLevel
	incrom	$0B3B90,$17AE
Art_SavageA4Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; C00 of CCC bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $5100-5300; jt[911] used by SavageA4_InitEffectSprite
	incrom	$0B533E,$CCC
	include "src/f/0B600A.asm"
	include "src/f/0B602A.asm"
	include "src/f/0B6086.asm"
	include "src/f/0B60BE.asm"
	include "src/f/0B611E.asm"
	include "src/f/0B6252.asm"
	include "src/f/0B626E.asm"
	include "src/f/0B62F2.asm"
	include "src/f/0B6322.asm"
	include "src/f/0B632E.asm"
	include "src/f/0B65A0.asm"
	include "src/f/0B65C6.asm"
	include "src/f/0B6632.asm"
Tbl_SavageA4ComputeParallax:	; table read by Scroll_ComputeParallax; C of 12 bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax; jt[913] used by SavageA4_RunScene
	incrom	$0B663A,$12
Pal_SavageA4Cycle:	; palette data read by Pal_CycleStep; 30 of 30 bytes used at runtime; read by Pal_CycleStep; jt[914] used by SavageA4_CyclePalettes
	incrom	$0B664C,$30
Pal_SavageA4Cycle2:	; palette data read by Pal_CycleStep; 30 of 30 bytes used at runtime; read by Pal_CycleStep; jt[915] used by SavageA4_CyclePalettes
	incrom	$0B667C,$30
Pal_SavageA4Cycle3:	; palette data read by Pal_CycleStep; 30 of 30 bytes used at runtime; read by Pal_CycleStep; jt[916] used by SavageA4_CyclePalettes
	incrom	$0B66AC,$30
	include "src/f/0B66DC.asm"
	include "src/f/0B6740.asm"
	include "src/f/0B674E.asm"
	include "src/f/0B6824.asm"
	include "src/f/0B689A.asm"
	include "src/f/0B68B8.asm"
	include "src/f/0B68FC.asm"
	include "src/f/0B690A.asm"
	include "src/f/0B6916.asm"
	include "src/f/0B6A00.asm"
	include "src/f/0B6B2A.asm"
	include "src/f/0B6BB2.asm"
	include "src/f/0B6BD6.asm"
	include "src/f/0B6C3E.asm"
	include "src/f/0B6C8E.asm"
	include "src/f/0B6CDE.asm"
	include "src/f/0B6D2E.asm"
	include "src/f/0B6D7E.asm"
	include "src/f/0B6DD4.asm"
	include "src/f/0B6EA6.asm"
	include "src/f/0B6F28.asm"
	include "src/f/0B6F5E.asm"
	include "src/f/0B703E.asm"
	include "src/f/0B70A2.asm"
	include "src/f/0B70B0.asm"
	include "src/f/0B71F4.asm"
	include "src/f/0B7298.asm"
	include "src/f/0B7394.asm"
	include "src/f/0B7436.asm"
Sw_0B7436:	; switch table of sub at $0B7436: 4 word offsets from Sw_0B7436-2
	dc.w	ChildShip_OnHurt_Left-(Sw_0B7436-2), ChildShip_OnHurt_Right-(Sw_0B7436-2), loc_0B747A-(Sw_0B7436-2), ChildShip_OnHurt_Up-(Sw_0B7436-2)
	include "src/f/0B7472.asm"
	include "src/f/0B7482.asm"
	include "src/f/0B748A.asm"
	include "src/f/0B7490.asm"
	include "src/f/0B74CC.asm"
	include "src/f/0B74F6.asm"
	include "src/f/0B757C.asm"
	include "src/f/0B7622.asm"
	include "src/f/0B765C.asm"
	include "src/f/0B76BC.asm"
	include "src/f/0B771C.asm"
	include "src/f/0B777C.asm"
	include "src/f/0B77E8.asm"
	include "src/f/0B77FC.asm"
	include "src/f/0B78B8.asm"
	include "src/f/0B7986.asm"
	include "src/f/0B79DA.asm"
	include "src/f/0B7A2E.asm"
	include "src/f/0B7B14.asm"
Tbl_BrainBabyBio_vtable:	; class descriptor of BRAINBABYBIO: word name offset $82, parent BABYBIO, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0B7B1C,$8F
Pad_SavageA4:	; $00 fill; never read in the corpus; between SavageA4_NopStatic and BrainBabyBio_Script
	incrom	$0B7BAB,$1
Tbl_BrainChild_vtable:	; class descriptor of BRAINCHILD: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0B7BAC,$8D
Pad_SavageA42:	; $00 fill; never read in the corpus; between SavageA4_NopStatic and BrainBabyBio_Script
	incrom	$0B7C39,$1
Tbl_ChildShip_vtable:	; class descriptor of CHILDSHIP: word name offset $82, parent XNPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0B7C3A,$8C
Tbl_BrainChildAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 5 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[942] used by BrainChild_Init
	incrom	$0B7CC6,$8
Tbl_BrainChildAnim2:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[943] used by BrainChild_ActShoot -> Obj_SetAnim
	incrom	$0B7CCE,$A
Tbl_BrainBabyBioActPlayAnimC:	; table read by BabyBio_ActPlayAnimC; 2 of 2 bytes used at runtime; read by BabyBio_ActPlayAnimC; jt[944] used by BrainBabyBio_Init
	incrom	$0B7CD8,$2
	include "src/f/0B7CDA.asm"
Tbl_ChildShipActDropRocket:	; table read by ChildShip_ActDropRocket; 2 of 2 bytes used at runtime; read by ChildShip_ActDropRocket; jt[945] used by ChildShip_Init
	incrom	$0B7CEE,$2
	include "src/f/0B7CF0.asm"
Tbl_BrainChildStateLand:	; table read by BrainChild_StateLand; 2 of E bytes used at runtime; read by BrainChild_StateLand; jt[946] used by BrainChild_Init
	incrom	$0B7D08,$E
Tbl_ChildShipShakeStep:	; table read by Cam_ShakeStep; 13 of 14 bytes used at runtime; read by Cam_ShakeStep; jt[947] used by ChildShip_StateCrash1, ChildShip_StateCrash2, ChildShip_StateCrash3
	incrom	$0B7D16,$14
Tbl_ChildShipUpdate:	; table read by ChildShip_Update; 16 of 30 bytes used at runtime; read by ChildShip_Update; jt[948] used by ChildShip_StateCrash, ChildShip_Update
	incrom	$0B7D2A,$30
Tbl_SavageA4FrameHook:	; table read by SavageA4_FrameHook; 10 of 10 bytes used at runtime; read by SavageA4_FrameHook; jt[949] used by SavageA4_FrameHook
	incrom	$0B7D5A,$10
Tbl_SavageA4FrameHook2:	; table read by SavageA4_FrameHook; 10 of 10 bytes used at runtime; read by SavageA4_FrameHook; jt[950] used by SavageA4_FrameHook
	incrom	$0B7D6A,$10
Tbl_SavageA4FrameHook3:	; table read by SavageA4_FrameHook; 10 of 10 bytes used at runtime; read by SavageA4_FrameHook; jt[951] used by SavageA4_FrameHook
	incrom	$0B7D7A,$10
Tbl_SavageA4FrameHook4:	; table read by SavageA4_FrameHook; 10 of 10 bytes used at runtime; read by SavageA4_FrameHook; jt[952] used by SavageA4_FrameHook
	incrom	$0B7D8A,$10
Tbl_SavageA4FrameHook5:	; table read by SavageA4_FrameHook; 10 of 10 bytes used at runtime; read by SavageA4_FrameHook; jt[953] used by SavageA4_FrameHook
	incrom	$0B7D9A,$10
Tbl_SavageA4FrameHook6:	; table read by SavageA4_FrameHook; 10 of 10 bytes used at runtime; read by SavageA4_FrameHook; jt[954] used by SavageA4_FrameHook
	incrom	$0B7DAA,$10
Tbl_SavageBioAnim11:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[955] used by SavageBio_ActAnimA -> Obj_ChangeAnim
	incrom	$0B7DBA,$A
Tbl_SavageBioAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[956] used by SavageBio_ActAnimB, SavageBio_ActToCentre
	incrom	$0B7DC4,$A
Tbl_SavageBioAnim12:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[957] used by SavageBio_ActAnimC -> Obj_ChangeAnim
	incrom	$0B7DCE,$A
Tbl_SavageBioAnim13:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[958] used by SavageBio_ActFireRocket -> Obj_SetAnim
	incrom	$0B7DD8,$A
Tbl_SavageBioAnim14:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[959] used by SavageBio_ActFireVertical -> Obj_SetAnim
	incrom	$0B7DE2,$A
Tbl_SavageBioAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[960] used by SavageBio_ActReloadArt14
	incrom	$0B7DEC,$E
Tbl_SavageBioAnim15:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[961] used by SavageBio_ActReloadArt10 -> Obj_SetAnim
	incrom	$0B7DFA,$10
Tbl_ChildShipAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[962] used by SavageMediumBio_StateAppear
	incrom	$0B7E0A,$8
Tbl_SavageMediumBioAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[963] used by SavageMediumBio_Init -> AiScript_Set
	incrom	$0B7E12,$1A
Tbl_SavageBioActCrossIfUp:	; table read by SavageBio_ActCrossIfUp; 2 of 2 bytes used at runtime; read by SavageBio_ActCrossIfUp; jt[964] used by SavageBio_StateDying
	incrom	$0B7E2C,$2
	include "src/f/0B7E2E.asm"
Tbl_SavageBigBioAiScript_0B7E46:	; word $0000 (2 bytes), not a string: reached only via jt[965] used by SavageBigBio_Init -> AiScript_Set (e.g. an empty list/script count)
	incrom	$0B7E46,$1
Tbl_SavageBioActFrame4F:	; table read by SavageBio_ActFrame4F; 1 of 1 bytes used at runtime; read by SavageBio_ActFrame4F
	incrom	$0B7E47,$1
	include "src/f/0B7E48.asm"
Tbl_SavageBioAiScript_0B7E54:	; word $0000 (2 bytes), not a string: reached only via jt[966] used by SavageBio_ActScript2052 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$0B7E54,$1
Tbl_SavageBioStateExtend10:	; table read by SavageBio_StateExtend10; 1 of 1 bytes used at runtime; read by SavageBio_StateExtend10
	incrom	$0B7E55,$1
	include "src/f/0B7E56.asm"
Tbl_SavageBioDraw:	; table read by SavageBigBio_Draw; 50 of 70 bytes used at runtime; read by SavageBigBio_Draw; jt[967] used by SavageBio_ActExtendShort
	incrom	$0B7F76,$70
Tbl_SavageBioActExtendTentacle:	; format not established; never read in the corpus; jt[968] used by SavageBio_ActExtendTentacle
	incrom	$0B7FE6,$80
Tbl_SavageBioActExtendTentacle2:	; format not established; never read in the corpus; jt[969] used by SavageBio_ActExtendTentacle2
	incrom	$0B8066,$60
Tbl_SavageBigBioDraw:	; table read by SavageBigBio_Draw; 82 of 84 bytes used at runtime; read by SavageBigBio_Draw; jt[970] used by SavageBigBio_Draw, SavageBio_StateFireTip
	incrom	$0B80C6,$84
Tbl_SavageBioActClearAnim:	; table read by BioBalls_ActClearAnim; 2 of 2 bytes used at runtime; read by BioBalls_ActClearAnim; jt[971] used by SavageMediumBio_StateBurst
	incrom	$0B814A,$2
	include "src/f/0B814C.asm"
Tbl_SavageBioAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[972] used by SavageBio_StateCrossSurface -> AiScript_Set
	incrom	$0B815C,$1A
Tbl_SavageBioActClearDone:	; table read by BioBalls_ActClearDone; 2 of 2 bytes used at runtime; read by BioBalls_ActClearDone; jt[973] used by SavageBio_ActDie
	incrom	$0B8176,$2
	include "src/f/0B8178.asm"
Tbl_SavageBioMove:	; table read by BioBalls_Move; 40 of 84 bytes used at runtime; read by BioBalls_Move, BioBalls_SetFormation; jt[974] used by SavageBio_StateCrossSurface, SavageBioBalls_ActLeap, SavageBio_ActDie
	incrom	$0B818C,$84
Tbl_SavageBioSetFormation:	; table read by BioBalls_SetFormation; 3A of 74 bytes used at runtime; read by BioBalls_SetFormation; jt[975] used by SavageMediumBio_StateBurst
	incrom	$0B8210,$74
Art_BrainChildSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 920 of 1700 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $AFA0-B3C0; jt[976] used by BrainChild_Init
	incrom	$0B8284,$1700
Art_ChildShipSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 780 of 81A bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $A820-AFA0; jt[977] used by ChildShip_Init
	incrom	$0B9984,$81A
	include "src/f/0BA19E.asm"
	include "src/f/0BA1AC.asm"
	include "src/f/0BA1B8.asm"
	include "src/f/0BA258.asm"
	include "src/f/0BA35E.asm"
	include "src/f/0BA4A2.asm"
	include "src/f/0BA562.asm"
	include "src/f/0BA570.asm"
	include "src/f/0BA58E.asm"
	include "src/f/0BA6CE.asm"
	include "src/f/0BA77C.asm"
	include "src/f/0BA7D8.asm"
	include "src/f/0BA864.asm"
	include "src/f/0BA8FA.asm"
	include "src/f/0BAEC4.asm"
	include "src/f/0BAF14.asm"
	include "src/f/0BAF96.asm"
	include "src/f/0BAFF4.asm"
	include "src/f/0BB0D6.asm"
	include "src/f/0BB268.asm"
	include "src/f/0BB2AA.asm"
	include "src/f/0BB38C.asm"
	include "src/f/0BB3CC.asm"
	include "src/f/0BB45C.asm"
	include "src/f/0BB49C.asm"
	include "src/f/0BB52E.asm"
	include "src/f/0BB590.asm"
	include "src/f/0BB5E0.asm"
	include "src/f/0BB634.asm"
	include "src/f/0BB698.asm"
	include "src/f/0BB6CE.asm"
	include "src/f/0BB71E.asm"
	include "src/f/0BB780.asm"
	include "src/f/0BB7F0.asm"
	include "src/f/0BB850.asm"
	include "src/f/0BB8B0.asm"
	include "src/f/0BB910.asm"
	include "src/f/0BBA0E.asm"
	include "src/f/0BBA94.asm"
	include "src/f/0BBBBE.asm"
	include "src/f/0BBCBC.asm"
	include "src/f/0BBE0C.asm"
	include "src/f/0BBF4E.asm"
	include "src/f/0BC0C4.asm"
	include "src/f/0BC1A8.asm"
	include "src/f/0BC2D2.asm"
	include "src/f/0BC338.asm"
	include "src/f/0BC398.asm"
	include "src/f/0BC3F8.asm"
	include "src/f/0BC44C.asm"
	include "src/f/0BC4A0.asm"
	include "src/f/0BC516.asm"
	include "src/f/0BC58C.asm"
	include "src/f/0BC64A.asm"
	include "src/f/0BC71A.asm"
	include "src/f/0BC7A2.asm"
	include "src/f/0BC80C.asm"
	include "src/f/0BC85C.asm"
	include "src/f/0BC8AC.asm"
	include "src/f/0BC920.asm"
	include "src/f/0BC954.asm"
	include "src/f/0BCA2C.asm"
	include "src/f/0BCA7E.asm"
	include "src/f/0BCB92.asm"
	include "src/f/0BCC6A.asm"
	include "src/f/0BCC78.asm"
	include "src/f/0BCC96.asm"
	include "src/f/0BCD4E.asm"
	include "src/f/0BCD90.asm"
	include "src/f/0BCDF0.asm"
	include "src/f/0BCE0E.asm"
	include "src/f/0BCE56.asm"
	include "src/f/0BCED6.asm"
	include "src/f/0BCF2A.asm"
	include "src/f/0BCF94.asm"
	include "src/f/0BD00A.asm"
	include "src/f/0BD04C.asm"
	include "src/f/0BD128.asm"
	include "src/f/0BD1D8.asm"
	include "src/f/0BD216.asm"
	include "src/f/0BD274.asm"
Tbl_SavageBioBase_vtable:	; class descriptor of SAVAGEBIOBASE: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0BD27C,$90
Tbl_SavageBigBio_vtable:	; class descriptor of SAVAGEBIGBIO: word name offset $82, parent SAVAGEBIOBASE, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0BD30C,$8F
Pad_SavageBio:	; $00 fill; never read in the corpus; between SavageBio_NopStatic and Barbarian_GetSize
	incrom	$0BD39B,$1
Tbl_SavageMediumBio_vtable:	; class descriptor of SAVAGEMEDIUMBIO: word name offset $82, parent SAVAGEBIOBASE, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0BD39C,$92
Tbl_BarbarianTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 4 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, Barbarian_Init, XNpc_KnockbackDist; jt[1036] used by Barbarian_Init
	incrom	$0BD42E,$8
Tbl_SavageBioAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[1037] used by Barbarian_StateWalkStart
	incrom	$0BD436,$12
Tbl_SavageBioAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[1038] used by Barbarian_StateTaunt_Reset, Barbarian_StateTaunt_Play, Barbarian_StateStart
	incrom	$0BD448,$12
Tbl_SavageBioAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 2E of 60 bytes used at runtime; read by Anim_ApplyStep; jt[1039] used by Barbarian_StateIdle, Barbarian_StateIdleTimer, Barbarian_StateSegmentEnd
	incrom	$0BD45A,$60
Tbl_SavageBioAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 16 of 18 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1040] used by Barbarian_StateAttack0
	incrom	$0BD4BA,$18
Tbl_SavageBioAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1041] used by Barbarian_StateAttack1
	incrom	$0BD4D2,$10
Tbl_SavageBioAnim8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1042] used by Barbarian_StateAttack2
	incrom	$0BD4E2,$14
Tbl_SavageBioAnim9:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1043] used by Barbarian_StateAttack3
	incrom	$0BD4F6,$14
Tbl_SavageBioAnim10:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep; jt[1044] used by Barbarian_StateAttack4
	incrom	$0BD50A,$14
	include "src/f/0BD51E.asm"
	include "src/f/0BD52C.asm"
	include "src/f/0BD54A.asm"
	include "src/f/0BD6E2.asm"
	include "src/f/0BD75C.asm"
	include "src/f/0BD79A.asm"
	include "src/f/0BD7EA.asm"
	include "src/f/0BD894.asm"
	include "src/f/0BD9F0.asm"
	include "src/f/0BDA66.asm"
	include "src/f/0BDAC4.asm"
	include "src/f/0BDB04.asm"
	include "src/f/0BDB4C.asm"
	include "src/f/0BDB94.asm"
	include "src/f/0BDBE2.asm"
Sw_0BDBE2:	; switch table of sub at $0BDBE2: 4 word offsets from Sw_0BDBE2-2
	dc.w	loc_0BDC38-(Sw_0BDBE2-2), Barbarian_StateTaunt_Play-(Sw_0BDBE2-2), loc_0BDC5C-(Sw_0BDBE2-2), loc_0BDC6E-(Sw_0BDBE2-2)
	include "src/f/0BDC34.asm"
	include "src/f/0BDC4A.asm"
	include "src/f/0BDC7E.asm"
	include "src/f/0BDC9A.asm"
	include "src/f/0BDCFE.asm"
	include "src/f/0BDD52.asm"
	include "src/f/0BDDC2.asm"
	include "src/f/0BDE22.asm"
	include "src/f/0BDE82.asm"
	include "src/f/0BDEF4.asm"
	include "src/f/0BDF50.asm"
	include "src/f/0BDF9C.asm"
	include "src/f/0BDFD8.asm"
	include "src/f/0BE014.asm"
	include "src/f/0BE04E.asm"
	include "src/f/0BE08A.asm"
	include "src/f/0BE0C2.asm"
	include "src/f/0BE10C.asm"
	include "src/f/0BE15C.asm"
	include "src/f/0BE190.asm"
	include "src/f/0BE1BA.asm"
	include "src/f/0BE206.asm"
	include "src/f/0BE22A.asm"
	include "src/f/0BE29A.asm"
	include "src/f/0BE2CE.asm"
Sw_0BE2CE:	; switch table of sub at $0BE2CE: 5 word offsets from Sw_0BE2CE-2
	dc.w	loc_0BE314-(Sw_0BE2CE-2), Barbarian_StateAttack_Case1-(Sw_0BE2CE-2), loc_0BE33C-(Sw_0BE2CE-2), loc_0BE350-(Sw_0BE2CE-2)
	dc.w	Barbarian_StateAttack_Case4-(Sw_0BE2CE-2)
	include "src/f/0BE310.asm"
	include "src/f/0BE328.asm"
	include "src/f/0BE364.asm"
	include "src/f/0BE376.asm"
	include "src/f/0BE37E.asm"
	include "src/f/0BE3B4.asm"
	include "src/f/0BE3EA.asm"
	include "src/f/0BE420.asm"
	include "src/f/0BE456.asm"
	include "src/f/0BE48C.asm"
	include "src/f/0BE4C0.asm"
	include "src/f/0BE55C.asm"
	include "src/f/0BE564.asm"
	include "src/f/0BE57E.asm"
	include "src/f/0BE594.asm"
	include "src/f/0BE5D6.asm"
	include "src/f/0BE602.asm"
	include "src/f/0BE656.asm"
	include "src/f/0BE6A4.asm"
Tbl_Barbarian_vtable:	; class descriptor of BARBARIAN: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0BE74E,$8C
	include "src/f/0BE7DA.asm"
	include "src/f/0BE7E8.asm"
	include "src/f/0BE814.asm"
	include "src/f/0BE872.asm"
	include "src/f/0BE896.asm"
	include "src/f/0BE8EE.asm"
	include "src/f/0BE946.asm"
	include "src/f/0BE99C.asm"
	include "src/f/0BE9A4.asm"
	include "src/f/0BE9E2.asm"
	include "src/f/0BE9F8.asm"
	include "src/f/0BEA74.asm"
	include "src/f/0BEC6A.asm"
Tbl_Launcher_vtable:	; class descriptor of LAUNCHER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0BED0C,$77
Pad_Launcher:	; $00 fill; never read in the corpus; between Launcher_Init and SporeMine_GetSize
	incrom	$0BED83,$1
	include "src/f/0BED84.asm"
	include "src/f/0BED92.asm"
	include "src/f/0BEDA8.asm"
	include "src/f/0BEDB0.asm"
	include "src/f/0BEDD2.asm"
	include "src/f/0BEE38.asm"
Str_Empty_0BEECE:	; C string "" (used by SporeMine_InitPool)
	incrom	$0BEECE,$2
	include "src/f/0BEED0.asm"
	include "src/f/0BEF12.asm"
	include "src/f/0BF050.asm"
	include "src/f/0BF106.asm"
	include "src/f/0BF186.asm"
	include "src/f/0BF1C2.asm"
	include "src/f/0BF1FA.asm"
	include "src/f/0BF234.asm"
	include "src/f/0BF2B2.asm"
	include "src/f/0BF2FC.asm"
	include "src/f/0BF346.asm"
	include "src/f/0BF390.asm"
	include "src/f/0BF3DA.asm"
Tbl_SporeMineUpdatePool:	; table read by SporeMine_UpdatePool; 6 of A bytes used at runtime; read by SporeMine_UpdatePool, SporeMine_RecIdle; jt[1069] used by SporeMine_RecIdle
	incrom	$0BF54E,$A
Tbl_SporeMineUpdatePool2:	; table read by SporeMine_UpdatePool; 6 of A bytes used at runtime; read by SporeMine_UpdatePool, SporeMine_RecArm1; jt[1070] used by SporeMine_RecArm1
	incrom	$0BF558,$A
Tbl_SporeMineUpdatePool3:	; table read by SporeMine_UpdatePool; 6 of A bytes used at runtime; read by SporeMine_UpdatePool, SporeMine_RecArm2; jt[1071] used by SporeMine_RecArm2
	incrom	$0BF562,$A
Tbl_SporeMineUpdatePool4:	; table read by SporeMine_UpdatePool; 6 of A bytes used at runtime; read by SporeMine_UpdatePool, SporeMine_RecArm3; jt[1072] used by SporeMine_RecArm3
	incrom	$0BF56C,$A
Tbl_SporeMineUpdatePool5:	; table read by SporeMine_UpdatePool; 6 of A bytes used at runtime; read by SporeMine_UpdatePool, SporeMine_RecArm4; jt[1073] used by SporeMine_RecArm4
	incrom	$0BF576,$A
Tbl_SporeMine_vtable:	; class descriptor of SPOREMINE: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0BF580,$78
	include "src/f/0BF5F8.asm"
	include "src/f/0BF606.asm"
	include "src/f/0BF654.asm"
	include "src/f/0BF65C.asm"
	include "src/f/0BF680.asm"
	include "src/f/0BF76E.asm"
	include "src/f/0BF784.asm"
Tbl_SpikeBall_vtable:	; class descriptor of SPIKEBALL: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0BF820,$78
	include "src/f/0BF898.asm"
	include "src/f/0BF8DC.asm"
Sw_0BF8DC:	; switch table of sub at $0BF8DC: 5 word offsets from Sw_0BF8DC-2
	dc.w	SavageJungle_PalPhaseUpdate_Case0-(Sw_0BF8DC-2), SavageJungle_PalPhaseUpdate_Case1-(Sw_0BF8DC-2), loc_0BF95E-(Sw_0BF8DC-2), loc_0BF982-(Sw_0BF8DC-2)
	dc.w	loc_0BF9A6-(Sw_0BF8DC-2)
	include "src/f/0BF914.asm"
	include "src/f/0BF93A.asm"
	include "src/f/0BF9C8.asm"
	include "src/f/0BF9EA.asm"
	include "src/f/0BFA7C.asm"
	include "src/f/0BFA8A.asm"
	include "src/f/0BFAC0.asm"
	include "src/f/0BFAC8.asm"
	include "src/f/0BFADA.asm"
	include "src/f/0BFB44.asm"
Sw_0BFB44:	; switch table of sub at $0BFB44: 5 word offsets from Sw_0BFB44-2
	dc.w	SwampBubbles_Draw_Multi-(Sw_0BFB44-2), loc_0BFBAE-(Sw_0BFB44-2), loc_0BFBDA-(Sw_0BFB44-2), loc_0BFC12-(Sw_0BFB44-2)
	dc.w	loc_0BFC60-(Sw_0BFB44-2)
	include "src/f/0BFB9A.asm"
	include "src/f/0BFC94.asm"
	include "src/f/0BFC9E.asm"
	include "src/f/0BFCB4.asm"
Tbl_SwampBubbles_vtable:	; class descriptor of SWAMPBUBBLES: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0BFCE4,$7B
Pad_SwampBubbles:	; $00 fill; never read in the corpus; between SwampBubbles_Deactivate and SwampPlatform_GetSize
	incrom	$0BFD5F,$1
	include "src/f/0BFD60.asm"
	include "src/f/0BFD6E.asm"
	include "src/f/0BFDB0.asm"
	include "src/f/0BFDB8.asm"
	include "src/f/0BFDD6.asm"
	include "src/f/0BFDEC.asm"
	include "src/f/0BFE6C.asm"
	include "src/f/0BFF8C.asm"
Tbl_SwampPlatform_vtable:	; class descriptor of SWAMPPLATFORM: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0C005A,$7C
Tbl_SwampFlyStateFly:	; table read by SwampFly_StateFly; 114 of 23C bytes used at runtime; read by SwampFly_StateFly; jt[1101] used by SwampFly_StatePickPath_Default
	incrom	$0C00D6,$23C
Tbl_SwampFlyStateFly2:	; table read by SwampFly_StateFly; 24 of 1FA bytes used at runtime; read by SwampFly_StateFly; jt[1102] used by SwampFly_StatePickPath_Case1
	incrom	$0C0312,$1FA
Tbl_SwampFlyStateFly3:	; table read by SwampFly_StateFly; 6 of 13E bytes used at runtime; read by SwampFly_StateFly, SwampFly_StatePickPath_Start; jt[1103] used by SwampFly_StatePickPath_Case1
	incrom	$0C050C,$13E
Tbl_SwampFlyStateFly4:	; table read by SwampFly_StateFly; 2A of 13E bytes used at runtime; read by SwampFly_StateFly; jt[1104] used by SwampFly_StatePickPath_Case1
	incrom	$0C064A,$13E
Tbl_SwampFlyStateFly5:	; table read by SwampFly_StateFly; 22 of 1D0 bytes used at runtime; read by SwampFly_StateFly; jt[1105] used by SwampFly_StatePickPath_Case1
	incrom	$0C0788,$1D0
Tbl_SwampPlatform:	; format not established; never read in the corpus; jt[1106] used by SwampFly_StatePickPath_Case5
	incrom	$0C0958,$2
	include "src/f/0C095A.asm"
	include "src/f/0C0968.asm"
	include "src/f/0C099C.asm"
Sw_0C099C:	; switch table of sub at $0C099C: 6 word offsets from Sw_0C099C-2
	dc.w	SwampFly_StatePickPath_Default-(Sw_0C099C-2), SwampFly_StatePickPath_Case1-(Sw_0C099C-2), loc_0C09EE-(Sw_0C099C-2), loc_0C09FA-(Sw_0C099C-2)
	dc.w	loc_0C0A06-(Sw_0C099C-2), SwampFly_StatePickPath_Case5-(Sw_0C099C-2)
	include "src/f/0C09D6.asm"
	include "src/f/0C09E2.asm"
	include "src/f/0C0A12.asm"
	include "src/f/0C0A1C.asm"
	include "src/f/0C0A52.asm"
	include "src/f/0C0B7C.asm"
	include "src/f/0C0B84.asm"
	include "src/f/0C0B96.asm"
	include "src/f/0C0BAC.asm"
	include "src/f/0C0C0C.asm"
Tbl_SwampFly_vtable:	; class descriptor of SWAMPFLY: word name offset $82, parent BIONPC, 31 method slots from +6, then the name (tools/classes.py)
	incrom	$0C0CEA,$8B
Pad_SwampFly:	; $00 fill; never read in the corpus; between SwampFly_Init and SavageJungle_EmptyStub
	incrom	$0C0D75,$1
Tbl_SwampFlyComputeParallax:	; table read by Scroll_ComputeParallax; 16 of 22 bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax; jt[1114] used by SavageC1_SetParallax
	incrom	$0C0D76,$22
Tbl_SwampFlyComputeParallax2:	; table read by Scroll_ComputeParallax; 16 of 22 bytes used at runtime; read by Scroll_ComputeParallax, Scroll_SetParallax; jt[1115] used by SavageB1_SetParallax
	incrom	$0C0D98,$22
	include "src/f/0C0DBA.asm"
	include "src/f/0C0DC2.asm"
	include "src/f/0C0E16.asm"
	include "src/f/0C0E2A.asm"
	include "src/f/0C0E54.asm"
	include "src/f/0C0ED4.asm"
	include "src/f/0C0EE0.asm"
	include "src/f/0C0F88.asm"
	include "src/f/0C0FD2.asm"
	include "src/f/0C11B6.asm"
	include "src/f/0C11CE.asm"
	include "src/f/0C122A.asm"
	include "src/f/0C1258.asm"
	include "src/f/0C12DE.asm"
	include "src/f/0C12F6.asm"
	include "src/f/0C130A.asm"
	include "src/f/0C1372.asm"
	include "src/f/0C1412.asm"
	include "src/f/0C1478.asm"
	include "src/f/0C14B4.asm"
Lvl_Segs_0C14E4:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 8F7 of 8F8 bytes used at runtime; read by Seg_LoadList; jt[1123] used by SavageC1_LoadLevel
	incrom	$0C14E4,$8F8
Art_Nem_0C1DDC:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 860D of 897A bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1124] used by SavageC1_LoadLevel, SavageB1_LoadLevel
	incrom	$0C1DDC,$897A
Art_Nem_0CA756:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2E of 46 bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1125] used by SavageC1_LoadLevel
	incrom	$0CA756,$46
Art_SpaceB1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 20C8 of 20E2 bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1126] used by SpaceB1_LoadLevel, SavageC1_LoadLevel, SavageB1_LoadLevel
	incrom	$0CA79C,$20E2
Art_BarbarianSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3580 of 40B8 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStreamClip; DMA to VRAM $92A0-B500; jt[1127] used by Barbarian_Init
	incrom	$0CC87E,$40B8
Art_LauncherSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 434 of 434 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; jt[1128] used by Launcher_ClassInit
	incrom	$0D0936,$434
Art_LauncherSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 60 of 60 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; jt[1129] used by Launcher_ClassInit
	incrom	$0D0D6A,$60
Art_Spr_0D0DCA:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 413 of 414 bytes used at runtime; read by Nem_DecodeLoop, VDP_FlushDmaQueue, Spr_PreloadTiles; jt[1130] used by Water_Init
	incrom	$0D0DCA,$414
Art_SporeMineSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 285 of 286 bytes used at runtime; read by VDP_WriteWords, Nem_DecodeLoop, Spr_PreloadTiles; jt[1131] used by SporeMine_ClassInit
	incrom	$0D11DE,$286
Tbl_SpikeBallVdp:	; words copied to the VDP data port by VDP_WriteWords; 466 of 466 bytes used at runtime; read by VDP_WriteWords, Nem_DecodeLoop; jt[1132] used by SpikeBall_ClassInit
	incrom	$0D1464,$466
Tbl_SwampBubblesInit:	; format not established; never read in the corpus; jt[1133] used by SwampBubbles_Init
	incrom	$0D18CA,$141C
Art_SwampPlatformSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 313 of 314 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1134] used by SwampPlatform_ClassInit
	incrom	$0D2CE6,$314
Lvl_SwampFlySegs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 240 of 2C8 bytes used at runtime; read by Seg_LoadList, VDP_FlushDmaQueue; DMA to VRAM $AB60-AD20; jt[1135] used by SwampFly_Init
	incrom	$0D2FFA,$2C8
Lvl_Segs_0D32C2:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 6AF of 6B0 bytes used at runtime; read by Seg_LoadList, VDP_FlushDmaQueue; jt[1136] used by SentinelsD1_LoadLevel
	incrom	$0D32C2,$6B0
Art_Nem_0D3972:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 6B90 of 6C36 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[1137] used by SentinelsD1_LoadLevel
	incrom	$0D3972,$6C36
Art_Nem_0DA5A8:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 4A of 66 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[1138] used by SentinelsD1_LoadLevel
	incrom	$0DA5A8,$66
Lvl_SentinelsB2Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 697 of 698 bytes used at runtime; read by Seg_LoadList; jt[1139] used by SentinelsB2_LoadLevel
	incrom	$0DA60E,$698
Art_SentinelsB1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 890 of A5C bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1140] used by SentinelsB1_LoadLevel, SentinelsB2_LoadLevel, SentinelsD1_LoadLevel
	incrom	$0DACA6,$A5C
Art_SentinelsB2Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 12 of 2A bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1141] used by SentinelsB2_LoadLevel
	incrom	$0DB702,$2A
Art_Spr_0DB72C:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 800 of 894 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords, Spr_PreloadTiles; DMA to VRAM $7F40-88C0; jt[1142] used by SentinelsD1_InitLight
	incrom	$0DB72C,$894
Art_Spr_0DBFC0:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2D3 of 2D4 bytes used at runtime; read by VDP_FlushDmaQueue, Nem_DecodeLoop, VDP_WriteWords; jt[1143] used by SentinelsD1_LoadResources
	incrom	$0DBFC0,$2D4
	include "src/f/0DC294.asm"
Str_Empty_0DC2C4:	; C string "" (used by SentinelsD1_InitFlagBits)
	incrom	$0DC2C4,$2
	include "src/f/0DC2C6.asm"
	include "src/f/0DC2CE.asm"
	include "src/f/0DC316.asm"
	include "src/f/0DC350.asm"
	include "src/f/0DC38C.asm"
	include "src/f/0DC394.asm"
	include "src/f/0DC3DE.asm"
	include "src/f/0DC47C.asm"
	include "src/f/0DC4AA.asm"
	incrom	$0DC4BE,$20
	include "src/f/0DC4DE.asm"
	include "src/f/0DC4EC.asm"
	include "src/f/0DC59C.asm"
	include "src/f/0DC5FE.asm"
	include "src/f/0DC60C.asm"
	include "src/f/0DC618.asm"
	include "src/f/0DC638.asm"
	include "src/f/0DC776.asm"
	include "src/f/0DC7D0.asm"
	include "src/f/0DC816.asm"
	include "src/f/0DC9A0.asm"
	include "src/f/0DC9C4.asm"
	include "src/f/0DCA26.asm"
Tbl_ClosedBarrier_vtable:	; class descriptor of CLOSEDBARRIER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0DCA2E,$7C
Tbl_Barrier_vtable:	; class descriptor of BARRIER: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0DCAAA,$76
	include "src/f/0DCB20.asm"
	include "src/f/0DCB2E.asm"
	include "src/f/0DCB7A.asm"
	include "src/f/0DCB90.asm"
	include "src/f/0DCB98.asm"
	include "src/f/0DCBC8.asm"
	include "src/f/0DCD18.asm"
	include "src/f/0DCD4E.asm"
	include "src/f/0DCDD8.asm"
	include "src/f/0DCE4E.asm"
	include "src/f/0DCE6A.asm"
	include "src/f/0DCE88.asm"
	include "src/f/0DCEBE.asm"
	include "src/f/0DCF0A.asm"
	include "src/f/0DCF58.asm"
	include "src/f/0DCFBC.asm"
	include "src/f/0DCFF0.asm"
	include "src/f/0DD00C.asm"
	include "src/f/0DD060.asm"
Tbl_Blast_vtable:	; class descriptor of BLAST: word name offset $76, parent ACTOR, 28 method slots from +6, then the name (tools/classes.py)
	incrom	$0DD0E8,$7C
Art_BarrierSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 44F of 450 bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop; jt[1174] used by Barrier_ClassInit, Blast_ClassInit
	incrom	$0DD164,$450
Art_ControlBoxNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 42 of 42 bytes used at runtime; read by Nem_DecodeLoop, ControlBox_Draw, Nem_Decode; jt[1175] used by ControlBox_StartPattern
	incrom	$0DD5B4,$42
	include "src/f/0DD5F6.asm"
	include "src/f/0DD604.asm"
	include "src/f/0DD61A.asm"
	include "src/f/0DD622.asm"
	include "src/f/0DD62A.asm"
	include "src/f/0DD75A.asm"
	include "src/f/0DD804.asm"
	include "src/f/0DD856.asm"
	include "src/f/0DD8AE.asm"
	include "src/f/0DD8E2.asm"
	include "src/f/0DD956.asm"
	include "src/f/0DD980.asm"
Tbl_ControlBox_vtable:	; class descriptor of CONTROLBOX: word name offset $76, parent ACTOR, 28 method slots from +6, then the name (tools/classes.py)
	incrom	$0DDA02,$81
Pad_ControlPanel:	; $00 fill; never read in the corpus; between ControlBox_StateFire and ControlPanel_GetSize
	incrom	$0DDA83,$1
Art_ControlPanelSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3B1 of 3B2 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1185] used by SentinelsD1_LoadResources
	incrom	$0DDA84,$3B2
Art_ControlPanelNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 82 of 82 bytes used at runtime; read by Nem_DecodeLoop, ControlPanel_Draw; jt[1186] used by ControlPanel_StartPattern
	incrom	$0DDE36,$82
	include "src/f/0DDEB8.asm"
	include "src/f/0DDEC6.asm"
	include "src/f/0DDEDC.asm"
	include "src/f/0DDEE4.asm"
	include "src/f/0DDEEC.asm"
	include "src/f/0DE0B4.asm"
	include "src/f/0DE15E.asm"
	include "src/f/0DE17A.asm"
	include "src/f/0DE1CC.asm"
	include "src/f/0DE21A.asm"
	include "src/f/0DE240.asm"
	include "src/f/0DE274.asm"
	include "src/f/0DE2A8.asm"
	include "src/f/0DE33C.asm"
	include "src/f/0DE366.asm"
	include "src/f/0DE3E8.asm"
Tbl_ControlPanel_vtable:	; class descriptor of CONTROLPANEL: word name offset $7A, parent ACTOR, 29 method slots from +6, then the name (tools/classes.py)
	incrom	$0DE48E,$87
Pad_SentinelDoor:	; $00 fill; never read in the corpus; between ControlPanel_StateHit and SentinelDoor_GetSize
	incrom	$0DE515,$1
	include "src/f/0DE516.asm"
	include "src/f/0DE524.asm"
	include "src/f/0DE53A.asm"
	include "src/f/0DE542.asm"
	include "src/f/0DE54A.asm"
	include "src/f/0DE66E.asm"
	include "src/f/0DE6A6.asm"
	include "src/f/0DE6CA.asm"
	include "src/f/0DE71A.asm"
	include "src/f/0DE76A.asm"
	include "src/f/0DE7B2.asm"
	include "src/f/0DE7E8.asm"
	include "src/f/0DE81E.asm"
	include "src/f/0DE854.asm"
	include "src/f/0DE88E.asm"
	include "src/f/0DE8C4.asm"
	include "src/f/0DE8FA.asm"
	include "src/f/0DE930.asm"
	include "src/f/0DE966.asm"
Tbl_SentinelDoor_vtable:	; class descriptor of SENTINELDOOR: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0DE9A0,$7B
Pad_SentinelElevator:	; $00 fill; never read in the corpus; between SentinelDoor_StateClose5 and SentinelElevator_GetSize
	incrom	$0DEA1B,$1
Art_SentinelDoorSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 640 of 7E0 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $CE60-D9E0; jt[1204] used by SentinelDoor_Init
	incrom	$0DEA1C,$7E0
	include "src/f/0DF1FC.asm"
	include "src/f/0DF20A.asm"
	include "src/f/0DF220.asm"
	include "src/f/0DF228.asm"
	include "src/f/0DF230.asm"
	include "src/f/0DF34C.asm"
	include "src/f/0DF38E.asm"
	include "src/f/0DF3C2.asm"
	include "src/f/0DF3F6.asm"
	include "src/f/0DF426.asm"
	include "src/f/0DF4A6.asm"
	include "src/f/0DF4D6.asm"
Tbl_SentinelElevator_vtable:	; class descriptor of SENTINELELEVATOR: word name offset $6E, parent ACTOR, 26 method slots from +6, then the name (tools/classes.py)
	incrom	$0DF556,$7F
Pad_SentinelsA1:	; $00 fill; never read in the corpus; between SentinelElevator_StateSinking and SentinelsA1_ResetPalCycles
	incrom	$0DF5D5,$1
Art_SentinelElevatorSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 400 of 46C bytes used at runtime; read by VDP_FlushDmaQueue, Seg_LoadList; DMA to VRAM $D3A0-D9E0; jt[1211] used by SentinelElevator_Init
	incrom	$0DF5D6,$46C
Art_SentinelsA1Tiles:	; uncompressed 4bpp tiles DMA'd to VRAM; C9 of CA bytes used at runtime; read by VDP_FlushDmaQueue, Seg_LoadList; jt[1212] used by SentinelsA1_LoadLevel
	incrom	$0DFA42,$CA
Art_SentinelsA1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 320A of 3242 bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1213] used by SentinelsA1_LoadLevel
	incrom	$0DFB0C,$3242
Art_SentinelsA1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2E of 4E bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1214] used by SentinelsA1_LoadLevel
	incrom	$0E2D4E,$4E
Art_SentinelsA1Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 33EA of 33F4 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[1215] used by SentinelsA1_LoadLevel
	incrom	$0E2D9C,$33F4
Art_SentinelsA1Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1000 of 1126 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $3F40-4140; jt[1216] used by SentinelsA1_InitZapLights
	incrom	$0E6190,$1126
	include "src/f/0E72B6.asm"
	include "src/f/0E7306.asm"
	include "src/f/0E7582.asm"
	include "src/f/0E76DA.asm"
	include "src/f/0E785E.asm"
	include "src/f/0E789A.asm"
	include "src/f/0E78F2.asm"
	include "src/f/0E79A0.asm"
	include "src/f/0E7A5E.asm"
	include "src/f/0E7A6A.asm"
	include "src/f/0E7A8C.asm"
Tbl_CoreShieldsShakeStep:	; table read by Cam_ShakeStep; 14 of 14 bytes used at runtime; read by Cam_ShakeStep; jt[1218] used by CoreShields_StateAllDown, SentinelsB2_InstallHooks
	incrom	$0E7A94,$14
Tbl_HologramShakeStep:	; table read by Cam_ShakeStep; 53 of 54 bytes used at runtime; read by Cam_ShakeStep; jt[1219] used by Hologram_OpenExit
	incrom	$0E7AA8,$54
Art_SentinelsA1Spr2:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 18 of 18 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1220] used by SentinelsA1_CyclePalettes
	incrom	$0E7AFC,$18
Art_SentinelsA1Spr3:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 28 of 28 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1221] used by SentinelsA1_CyclePalettes
	incrom	$0E7B14,$28
Art_SentinelsA1Spr4:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 10 of 10 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1222] used by SentinelsA1_CyclePalettes
	incrom	$0E7B3C,$10
Art_SentinelsA1Spr5:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1223] used by SentinelsA1_CyclePalettes
	incrom	$0E7B4C,$14
Art_SentinelsA1Spr6:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 10 of 10 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1224] used by SentinelsA1_CyclePalettes
	incrom	$0E7B60,$10
Art_SentinelsA1Spr7:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 26 of 26 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1225] used by SentinelsA1_CyclePalettes
	incrom	$0E7B70,$26
Art_SentinelsA1Spr8:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1226] used by SentinelsA1_CyclePalettes
	incrom	$0E7B96,$14
Art_SentinelsA1Spr9:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1227] used by SentinelsA1_CyclePalettes
	incrom	$0E7BAA,$14
Art_SentinelsA1Spr10:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1228] used by SentinelsA1_CyclePalettes
	incrom	$0E7BBE,$14
Art_SentinelsA1Spr11:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1229] used by SentinelsA1_CyclePalettes
	incrom	$0E7BD2,$14
Art_SentinelsA1Spr12:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1230] used by SentinelsA1_CyclePalettes
	incrom	$0E7BE6,$14
Art_SentinelsA1Spr13:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1231] used by SentinelsA1_CyclePalettes
	incrom	$0E7BFA,$14
Art_SentinelsA1Spr14:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1232] used by SentinelsA1_CyclePalettes
	incrom	$0E7C0E,$14
Art_SentinelsA1Spr15:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1233] used by SentinelsA1_CyclePalettes
	incrom	$0E7C22,$14
Art_SentinelsA1Spr16:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1234] used by SentinelsA1_CyclePalettes
	incrom	$0E7C36,$14
Art_SentinelsA1Spr17:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1235] used by SentinelsA1_CyclePalettes
	incrom	$0E7C4A,$14
Art_SentinelsA1Spr18:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1236] used by SentinelsA1_CyclePalettes
	incrom	$0E7C5E,$14
Art_SentinelsA1Spr19:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1237] used by SentinelsA1_CyclePalettes
	incrom	$0E7C72,$14
Art_SentinelsA1Spr20:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1238] used by SentinelsA1_CyclePalettes
	incrom	$0E7C86,$14
Art_SentinelsA1Spr21:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1239] used by SentinelsA1_CyclePalettes
	incrom	$0E7C9A,$14
Art_SentinelsA1Spr22:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1240] used by SentinelsA1_CyclePalettes
	incrom	$0E7CAE,$14
Art_SentinelsA1Spr23:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; 14 of 14 bytes used at runtime; read by Pal_CycleStep, Spr_PreloadTiles; jt[1241] used by SentinelsA1_CyclePalettes
	incrom	$0E7CC2,$14
Art_SentinelsA1Spr24:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3B3 of 3B4 bytes used at runtime; read by Nem_DecodeLoop, Pal_CycleStep, Spr_PreloadTiles; jt[1242] used by SentinelsA1_LoadResources
	incrom	$0E7CD6,$3B4
	include "src/f/0E808A.asm"
	include "src/f/0E8098.asm"
	include "src/f/0E80DE.asm"
	include "src/f/0E8114.asm"
	include "src/f/0E8162.asm"
	include "src/f/0E8196.asm"
	include "src/f/0E819E.asm"
	include "src/f/0E82E4.asm"
Tbl_HoloBolt_vtable:	; class descriptor "HOLOBOLT": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$0E83AC,$78
Tbl_HoloBoltAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1248] used by HoloBolt_StateA
	incrom	$0E8424,$10
Tbl_HoloBoltAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1249] used by HoloBolt_StateB
	incrom	$0E8434,$C
Art_HoloBoltSpr:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; C of E bytes used at runtime; read by Spr_PreloadTiles, Anim_ApplyStep, Anim_AdvanceByDistance; jt[1250] used by HoloBolt_StateC
	incrom	$0E8440,$E
Art_SentinelsA1Spr25:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1587 of 1588 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[1251] used by SentinelsA1_LoadResources
	incrom	$0E844E,$1588
	include "src/f/0E99D6.asm"
	include "src/f/0E99E4.asm"
	include "src/f/0E99EC.asm"
	include "src/f/0E9A5C.asm"
	include "src/f/0E9A8C.asm"
	include "src/f/0E9B2E.asm"
	include "src/f/0E9B72.asm"
	include "src/f/0E9BCE.asm"
	include "src/f/0E9C04.asm"
	include "src/f/0E9C5E.asm"
	include "src/f/0E9D3A.asm"
	include "src/f/0E9D88.asm"
	include "src/f/0E9DAE.asm"
	include "src/f/0E9DEA.asm"
	include "src/f/0E9E36.asm"
	include "src/f/0E9E68.asm"
	include "src/f/0E9ED4.asm"
	include "src/f/0E9F24.asm"
	include "src/f/0E9F58.asm"
	include "src/f/0E9F84.asm"
	include "src/f/0E9FC0.asm"
	include "src/f/0E9FF2.asm"
	include "src/f/0EA02E.asm"
	include "src/f/0EA098.asm"
	include "src/f/0EA0A0.asm"
	include "src/f/0EA100.asm"
	include "src/f/0EA15E.asm"
	include "src/f/0EA18E.asm"
	include "src/f/0EA1BE.asm"
	include "src/f/0EA1EE.asm"
	include "src/f/0EA24C.asm"
	include "src/f/0EA27C.asm"
	include "src/f/0EA2AC.asm"
	include "src/f/0EA2DC.asm"
	include "src/f/0EA33A.asm"
	include "src/f/0EA36A.asm"
	include "src/f/0EA3C8.asm"
	include "src/f/0EA3F8.asm"
	include "src/f/0EA456.asm"
	include "src/f/0EA486.asm"
	include "src/f/0EA512.asm"
	include "src/f/0EA542.asm"
	include "src/f/0EA5CE.asm"
	include "src/f/0EA5FE.asm"
	include "src/f/0EA68A.asm"
	include "src/f/0EA6BA.asm"
	include "src/f/0EA746.asm"
	include "src/f/0EA7A4.asm"
	include "src/f/0EA7F8.asm"
	include "src/f/0EA84C.asm"
	include "src/f/0EA858.asm"
	include "src/f/0EA888.asm"
	include "src/f/0EA898.asm"
	include "src/f/0EA8AE.asm"
	include "src/f/0EAD14.asm"
Tbl_Hologram_vtable:	; class descriptor "HOLOGRAM": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$0EAE16,$78
	include "src/f/0EAE8E.asm"
Tbl_HologramAiScript_0EAEFC:	; word $0000 (2 bytes), not a string: reached only via jt[1276] used by Hologram_Init -> AiScript_Set (e.g. an empty list/script count)
	incrom	$0EAEFC,$1
	incrom	$0EAEFD,$1
	include "src/f/0EAEFE.asm"
Tbl_HologramAiScript_0EAF02:	; word $0000 (2 bytes), not a string: reached only via jt[1277] used by Hologram_StartDyingScript -> AiScript_Set (e.g. an empty list/script count)
	incrom	$0EAF02,$1
Tbl_HologramSeqA_Pose0:	; table read by Hologram_SeqA_Pose0; 1 of 1 bytes used at runtime; read by Hologram_SeqA_Pose0
	incrom	$0EAF03,$1
	include "src/f/0EAF04.asm"
Tbl_HologramAiScript_0EAF10:	; word $0000 (2 bytes), not a string: reached only via jt[1278] used by Hologram_StartAttackScript -> AiScript_Set (e.g. an empty list/script count)
	incrom	$0EAF10,$1
Tbl_HologramActPose0:	; table read by Hologram_ActPose0; 1 of 1 bytes used at runtime; read by Hologram_ActPose0
	incrom	$0EAF11,$1
	include "src/f/0EAF12.asm"
	incrom	$0EAF7A,$98
Art_SentinelsA1Spr26:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 647 of 648 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[1280] used by SentinelsA1_LoadResources
	incrom	$0EB012,$648
	include "src/f/0EB65A.asm"
	include "src/f/0EB662.asm"
	include "src/f/0EB670.asm"
	include "src/f/0EB6CE.asm"
	include "src/f/0EB702.asm"
	include "src/f/0EB796.asm"
	include "src/f/0EB7BC.asm"
	include "src/f/0EB7C8.asm"
	include "src/f/0EB7D8.asm"
	include "src/f/0EB818.asm"
	include "src/f/0EBA56.asm"
	include "src/f/0EBA94.asm"
	include "src/f/0EBB40.asm"
	include "src/f/0EBC6E.asm"
	include "src/f/0EBC7C.asm"
	include "src/f/0EBCEE.asm"
	include "src/f/0EBD78.asm"
	include "src/f/0EBDBC.asm"
Tbl_CoreShields_vtable:	; class descriptor "CORESHIELDS": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$0EBE7E,$7A
Tbl_CoreShieldsDraw:	; table read by CoreShields_Draw; 40 of 50 bytes used at runtime; read by CoreShields_Draw; jt[1294] used by CoreShields_Draw
	incrom	$0EBEF8,$50
Tbl_CoreShieldsDraw2:	; table read by CoreShields_Draw; 40 of 50 bytes used at runtime; read by CoreShields_Draw, sub_13EA46; jt[1295] used by CoreShields_Draw
	incrom	$0EBF48,$50
	incrom	$0EBF98,$118
Art_SentinelsA1Spr27:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 46D of 46E bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop, Nem_BuildCodeTable; jt[1298] used by SentinelsA1_LoadResources
	incrom	$0EC0B0,$46E
	include "src/f/0EC51E.asm"
	include "src/f/0EC526.asm"
	include "src/f/0EC534.asm"
	include "src/f/0EC572.asm"
	include "src/f/0EC5B0.asm"
	include "src/f/0EC5E0.asm"
	include "src/f/0EC622.asm"
	include "src/f/0EC668.asm"
	include "src/f/0EC69E.asm"
	include "src/f/0EC6E0.asm"
	include "src/f/0EC740.asm"
	include "src/f/0EC7B0.asm"
	include "src/f/0EC7D6.asm"
	include "src/f/0EC7F8.asm"
	include "src/f/0EC804.asm"
	include "src/f/0EC834.asm"
	include "src/f/0EC840.asm"
	include "src/f/0EC856.asm"
Tbl_CoreElevator_vtable:	; class descriptor "COREELEVATOR": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$0EC98E,$7C
Tbl_CoreElevatorAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1309] used by CoreElevator_Init
	incrom	$0ECA0A,$8
Tbl_CoreZap_vtable:	; class descriptor "COREZAP": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$0ECA12,$76
Lvl_SentinelsB1Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 697 of 698 bytes used at runtime; read by Seg_LoadList; jt[1311] used by SentinelsB1_LoadLevel
	incrom	$0ECA88,$698
Art_SentinelsB1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 70E2 of 717A bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[1312] used by SentinelsB1_LoadLevel, SentinelsB2_LoadLevel
	incrom	$0ED120,$717A
Art_SentinelsB1Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 4A of 62 bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[1313] used by SentinelsB1_LoadLevel
	incrom	$0F429A,$62
	include "src/f/0F42FC.asm"
	include "src/f/0F4314.asm"
	include "src/f/0F4350.asm"
	include "src/f/0F4358.asm"
	include "src/f/0F43F6.asm"
	include "src/f/0F4428.asm"
	include "src/f/0F4440.asm"
	include "src/f/0F44E8.asm"
	include "src/f/0F4524.asm"
	include "src/f/0F4542.asm"
	include "src/f/0F4562.asm"
	include "src/f/0F4576.asm"
	include "src/f/0F47AE.asm"
	include "src/f/0F4AEE.asm"
	include "src/f/0F4B2C.asm"
	include "src/f/0F4C72.asm"
	include "src/f/0F4CBC.asm"
	include "src/f/0F4CD0.asm"
	include "src/f/0F4CD8.asm"
Art_SentinelsB2Spr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1FF of 200 bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop; jt[1318] used by SentinelsB2_LoadDigits
	incrom	$0F4D00,$200
Lvl_SiberiaB1Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 292 of 29A bytes used at runtime; read by Seg_LoadList, Nem_DecodeLoop, Eni_Decode; jt[1319] used by SiberiaB1_LoadLevel
	incrom	$0F4F00,$29A
Lvl_SiberiaB1Segs2:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 49F of 4A0 bytes used at runtime; read by Seg_LoadList, Nem_DecodeLoop, Eni_Decode; jt[1320] used by SiberiaB1_LoadLevel
	incrom	$0F519A,$4A0
Art_SiberiaB1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 5B58 of 5C9C bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1321] used by SiberiaB1_InitWind, SiberiaB1_LoadLevel
	incrom	$0F563A,$5C9C
Art_SiberiaB1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 32 of 4C bytes used at runtime; read by Nem_DecodeLoop, Eni_Decode, Eni_ReadInline; jt[1322] used by SiberiaB1_LoadLevel
	incrom	$0FB2D6,$4C
Art_SiberiaB1Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 800 of AB0 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $1380-1580; jt[1323] used by SiberiaB1_InitWindSprite
	incrom	$0FB322,$AB0
Art_SiberiaB1Spr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 948 of 948 bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; jt[1324] used by SiberiaB1_LoadResources
	incrom	$0FBDD2,$948
	include "src/f/0FC71A.asm"
	include "src/f/0FC72E.asm"
	include "src/f/0FC78A.asm"
	include "src/f/0FC890.asm"
	include "src/f/0FC8A4.asm"
	include "src/f/0FC954.asm"
	include "src/f/0FCB8E.asm"
	include "src/f/0FCBDA.asm"
	include "src/f/0FCC62.asm"
	include "src/f/0FCC6A.asm"
	include "src/f/0FCC86.asm"
	include "src/f/0FCCAE.asm"
	include "src/f/0FCDEE.asm"
	include "src/f/0FCE32.asm"
	include "src/f/0FCE74.asm"
	include "src/f/0FCEAA.asm"
	include "src/f/0FCEDE.asm"
	include "src/f/0FD0E0.asm"
	include "src/f/0FD24C.asm"
	include "src/f/0FD50A.asm"
Str_Empty_0FD574:	; C string "" (used by SiberiaB1_InstallTileHooks)
	incrom	$0FD574,$2
	include "src/f/0FD576.asm"
	include "src/f/0FD614.asm"
	include "src/f/0FD69C.asm"
	include "src/f/0FD6A8.asm"
Tbl_SiberiaB1Wind:	; 11 x 8-byte wind keyframes {word duration frames, word angle deg, word strength (16.8), word unused}, then $FFFF... (SiberiaB1_StepWind)
	incrom	$0FD71C,$60
Tbl_SiberiaB1PalCycle1:	; palette cycle: {long offset to colours, byte delay, byte palette index $2F}, long -1, then colour words ending $FFFF (Pal_CycleStep via SiberiaB1_CyclePalettes)
	incrom	$0FD77C,$1A
Tbl_SiberiaB1PalCycle2:	; palette cycle for palette index $2D, same format (SiberiaB1_CyclePalettes)
	incrom	$0FD796,$1A
Tbl_SiberiaB1PalCycle3:	; palette cycle for palette index $2E, same format (SiberiaB1_CyclePalettes)
	incrom	$0FD7B0,$1A
Lvl_SpaceB1Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 6D1 of 6D2 bytes used at runtime; read by Seg_LoadList; jt[1330] used by SpaceB1_LoadLevel
	incrom	$0FD7CA,$6D2
Map_SpaceB1Eni:	; Enigma-compressed tilemap (Eni_Decode); 8119 of 835E bytes used at runtime; read by Eni_ReadInline, Nem_DecodeLoop, Eni_Decode; jt[1331] used by SpaceB1_LoadLevel
	incrom	$0FDE9C,$835E
Map_SpaceB1Eni2:	; Enigma-compressed tilemap (Eni_Decode); 3A of 52 bytes used at runtime; read by Eni_ReadInline, Nem_DecodeLoop, Eni_Decode; jt[1332] used by SpaceB1_LoadLevel
	incrom	$1061FA,$52
Art_SpaceB1Spr:	; sprite definition (type $12): $24-byte header, $14-byte frame records, pieces, tiles; 55A of 56C bytes used at runtime; read by Eni_ReadInline, VDP_WriteWords, Eni_Decode; jt[1333] used by SpaceB1_LoadLevel
	incrom	$10624C,$56C
Art_Platform1Spr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3A8 of 3A8 bytes used at runtime; read by Eni_ReadInline, VDP_WriteWords, Eni_Decode; jt[1334] used by Platform1_ClassInit, Platform1_Init
	incrom	$1067B8,$3A8
	include "src/f/106B60.asm"
	include "src/f/106B68.asm"
	include "src/f/106B76.asm"
	include "src/f/106B8C.asm"
	include "src/f/106BCE.asm"
	include "src/f/106BF0.asm"
Sw_106BF0:	; switch table of sub at $106BF0: 4 word offsets from Sw_106BF0-2
	dc.w	Platform1_Init_SetFrame2-(Sw_106BF0-2), loc_106CDA-(Sw_106BF0-2), Platform1_Init_SetFrame1-(Sw_106BF0-2), Platform1_Init_Common-(Sw_106BF0-2)
	include "src/f/106CC8.asm"
	include "src/f/106CEC.asm"
	include "src/f/106CFE.asm"
	include "src/f/106DC0.asm"
	include "src/f/106E14.asm"
	include "src/f/106EA8.asm"
	include "src/f/106F42.asm"
Sw_106F42:	; switch table of sub at $106F42: 4 word offsets from Sw_106F42-2
	dc.w	Platform1_SteerByPad_LeftRight-(Sw_106F42-2), loc_107044-(Sw_106F42-2), loc_106FF0-(Sw_106F42-2), Platform1_SteerByPad_UpDown-(Sw_106F42-2)
	include "src/f/106F9C.asm"
	include "src/f/107092.asm"
	include "src/f/1070E8.asm"
	include "src/f/1071AA.asm"
	include "src/f/1071DE.asm"
	include "src/f/107254.asm"
Tbl_Platform1_vtable:	; class descriptor "PLATFORM1": word $7E = name offset, long parent (SYNCHRONIZEDACTOR), 30 method pointers, then the class name string
	incrom	$1072E8,$88
	include "src/f/107370.asm"
	include "src/f/107378.asm"
	include "src/f/1073A8.asm"
Sw_1073A8:	; switch table of sub at $1073A8: 14 word offsets from Sw_1073A8-2
	dc.w	SpaceB1_CyclePalettes_SetA-(Sw_1073A8-2), loc_107408-(Sw_1073A8-2), loc_107410-(Sw_1073A8-2), loc_107418-(Sw_1073A8-2)
	dc.w	loc_107420-(Sw_1073A8-2), loc_107428-(Sw_1073A8-2), loc_107430-(Sw_1073A8-2), loc_107438-(Sw_1073A8-2)
	dc.w	loc_10743E-(Sw_1073A8-2), loc_107446-(Sw_1073A8-2), loc_10744E-(Sw_1073A8-2), loc_107456-(Sw_1073A8-2)
	dc.w	loc_10745E-(Sw_1073A8-2), loc_107466-(Sw_1073A8-2)
	include "src/f/107400.asm"
	include "src/f/10746C.asm"
Sw_10746C:	; switch table of sub at $10746C: 8 word offsets from Sw_10746C-2
	dc.w	SpaceB1_CyclePalettes_SetB-(Sw_10746C-2), loc_1074C0-(Sw_10746C-2), loc_1074C8-(Sw_10746C-2), loc_1074D0-(Sw_10746C-2)
	dc.w	loc_1074D8-(Sw_10746C-2), loc_1074DE-(Sw_10746C-2), loc_1074E6-(Sw_10746C-2), loc_1074EE-(Sw_10746C-2)
	include "src/f/1074B8.asm"
	include "src/f/1074F4.asm"
	include "src/f/10750C.asm"
	include "src/f/107540.asm"
	include "src/f/107560.asm"
	include "src/f/107592.asm"
	include "src/f/1075B4.asm"
	include "src/f/107658.asm"
	include "src/f/10769A.asm"
	include "src/f/107780.asm"
	include "src/f/10778C.asm"
	include "src/f/1077AC.asm"
	include "src/f/1077BA.asm"
Str_Empty_1077FE:	; C string "" (used by Switch_ClassInit)
	incrom	$1077FE,$2
	include "src/f/107800.asm"
	include "src/f/107834.asm"
	include "src/f/107860.asm"
	include "src/f/1079D8.asm"
Tbl_Switch_vtable:	; class descriptor "SWITCH": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$107A3E,$76
Lvl_SpaceA1Segs:	; floor-segment list (Seg_LoadList: 12/10-byte records until a 0 byte); 3D of 3E bytes used at runtime; read by Seg_LoadList; jt[1350] used by SpaceA1_LoadLevel
	incrom	$107AB4,$3E
Art_SpaceA1Nem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 2522 of 2538 bytes used at runtime; read by Nem_DecodeLoop; jt[1351] used by SpaceA1_LoadLevel
	incrom	$107AF2,$2538
Art_SpaceA1Nem2:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 12 of 2A bytes used at runtime; read by Nem_DecodeLoop; jt[1352] used by SpaceA1_LoadLevel
	incrom	$10A02A,$2A
Art_SpaceA1Nem3:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 14C6 of 14D0 bytes used at runtime; read by Nem_DecodeLoop; jt[1353] used by SpaceA1_LoadLevel
	incrom	$10A054,$14D0
Art_ElevatorNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 1 of E bytes used at runtime; read by Nem_DecodeLoop, Eni_ReadInline, Eni_Decode; jt[1354] used by Elevator_Update
	incrom	$10B524,$E
Tbl_Elevator_vtable:	; class descriptor "ELEVATOR": word $16 = name offset, long parent (none), 4 method pointers, then the class name string
	incrom	$10B532,$20
	include "src/f/10B552.asm"
	include "src/f/10B57C.asm"
	include "src/f/10B584.asm"
	include "src/f/10B58E.asm"
	include "src/f/10B5D0.asm"
	include "src/f/10B672.asm"
	include "src/f/10B6BE.asm"
	include "src/f/10B76C.asm"
	include "src/f/10B7A0.asm"
	include "src/f/10B840.asm"
	include "src/f/10B98A.asm"
	include "src/f/10B9C8.asm"
	include "src/f/10B9D0.asm"
	include "src/f/10BA48.asm"
	include "src/f/10BA6A.asm"
	include "src/f/10BB62.asm"
	include "src/f/10BB6E.asm"
Art_DeathbirdSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1CAF of 1CB0 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[1362] used by Deathbird_ClassInit
	incrom	$10BBD6,$1CB0
Art_DeathbirdSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 30C0 of 3582 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $ACE0-B480; jt[1363] used by Deathbird_Init
	incrom	$10D886,$3582
Art_DeathbirdSpr3:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 259 of 25A bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop; jt[1364] used by Deathbird_ClassInit
	incrom	$110E08,$25A
Tbl_DeathbirdAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Nem_DecodeLoop, Nem_Decode; jt[1365] used by Deathbird_SetMoveMode_Case2, Deathbird_SetMoveMode_Case4, Deathbird_SetMoveMode_Case5
	incrom	$111062,$E
Tbl_DeathbirdAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1366] used by Deathbird_SetMoveMode_Case2
	incrom	$111070,$8
Tbl_DeathbirdAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1367] used by Deathbird_StateThrowBurst
	incrom	$111078,$E
Tbl_DeathbirdAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 5 of 8 bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[1368] used by Deathbird_SetMoveMode_Case7
	incrom	$111086,$8
Tbl_DeathbirdAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1369] used by Deathbird_SetMoveMode_Case1
	incrom	$11108E,$E
Tbl_DeathbirdAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1370] used by Deathbird_StateLandOnSwitch
	incrom	$11109C,$C
Tbl_DeathbirdAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1371] used by Deathbird_StatePeck
	incrom	$1110A8,$8
Tbl_DeathbirdAnim8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1372] used by Deathbird_SetMoveMode_Case10
	incrom	$1110B0,$8
Tbl_DeathbirdStateChooseAttack:	; table read by Deathbird_StateChooseAttack; 5 of A bytes used at runtime; read by Deathbird_StateChooseAttack, Anim_ApplyStep; jt[1373] used by Deathbird_Init, Deathbird_StateChooseAttack
	incrom	$1110B8,$A
Tbl_DeathbirdStateSendHornets:	; table read by Deathbird_StateSendHornets; 9D of A0 bytes used at runtime; read by Deathbird_StateSendHornets; jt[1374] used by Deathbird_Init, Deathbird_StateSendHornets
	incrom	$1110C2,$A0
Tbl_Deathbird_vtable:	; class descriptor "DEATHBIRD": word $76 = name offset, long parent (ACTOR), 28 method pointers, then the class name string
	incrom	$111162,$80
	include "src/f/1111E2.asm"
	include "src/f/1111EA.asm"
Sw_1111EA:	; switch table of sub at $1111EA: 17 word offsets from Sw_1111EA-2
	dc.w	Deathbird_MovePolar_Case0-(Sw_1111EA-2), loc_11130E-(Sw_1111EA-2), loc_11131E-(Sw_1111EA-2), Deathbird_MovePolar_Case3-(Sw_1111EA-2)
	dc.w	Deathbird_MovePolar_Case4-(Sw_1111EA-2), loc_11136A-(Sw_1111EA-2), loc_111386-(Sw_1111EA-2), loc_1113AA-(Sw_1111EA-2)
	dc.w	loc_1113D2-(Sw_1111EA-2), loc_1113EA-(Sw_1111EA-2), loc_111406-(Sw_1111EA-2), loc_11142A-(Sw_1111EA-2)
	dc.w	loc_111452-(Sw_1111EA-2), loc_111476-(Sw_1111EA-2), loc_11149C-(Sw_1111EA-2), loc_1114CA-(Sw_1111EA-2)
	dc.w	Deathbird_MovePolar_Case16-(Sw_1111EA-2)
	include "src/f/1112FE.asm"
	include "src/f/111336.asm"
	include "src/f/111352.asm"
	include "src/f/1114FC.asm"
	include "src/f/11157A.asm"
	include "src/f/111588.asm"
	include "src/f/111590.asm"
	include "src/f/1115A6.asm"
	include "src/f/111790.asm"
	include "src/f/111798.asm"
	include "src/f/1117A0.asm"
Sw_1117A0:	; switch table of sub at $1117A0: 11 word offsets from Sw_1117A0-2
	dc.w	Deathbird_SetMoveMode_Case0-(Sw_1117A0-2), Deathbird_SetMoveMode_Case1-(Sw_1117A0-2), Deathbird_SetMoveMode_Case2-(Sw_1117A0-2), loc_1118B2-(Sw_1117A0-2)
	dc.w	Deathbird_SetMoveMode_Case4-(Sw_1117A0-2), Deathbird_SetMoveMode_Case5-(Sw_1117A0-2), loc_1119B2-(Sw_1117A0-2), Deathbird_SetMoveMode_Case7-(Sw_1117A0-2)
	dc.w	loc_111A9A-(Sw_1117A0-2), Deathbird_SetMoveMode_Case9-(Sw_1117A0-2), Deathbird_SetMoveMode_Case10-(Sw_1117A0-2)
	include "src/f/1117DC.asm"
	include "src/f/1117F0.asm"
	include "src/f/111842.asm"
	include "src/f/1118D8.asm"
	include "src/f/111920.asm"
	include "src/f/111A00.asm"
	include "src/f/111ABA.asm"
	include "src/f/111B50.asm"
	include "src/f/111B9A.asm"
	include "src/f/111BAA.asm"
	include "src/f/111DEA.asm"
Str_Empty_111E42:	; C string "" (used by Deathbird_ClassInit)
	incrom	$111E42,$2
	include "src/f/111E44.asm"
	include "src/f/112016.asm"
	include "src/f/11214E.asm"
Sw_11214E:	; switch table of sub at $11214E: 5 word offsets from Sw_11214E-2
	dc.w	Deathbird_Move_Done-(Sw_11214E-2), Deathbird_Move_Done-(Sw_11214E-2), Deathbird_Move_Done-(Sw_11214E-2), Deathbird_Move_Wobble-(Sw_11214E-2)
	dc.w	Deathbird_Move_Polar-(Sw_11214E-2)
	incrom	$112182,$4
	include "src/f/112186.asm"
	include "src/f/1121C6.asm"
	include "src/f/112330.asm"
	include "src/f/11233A.asm"
	include "src/f/1123FA.asm"
	include "src/f/112596.asm"
	include "src/f/1125A0.asm"
	include "src/f/1125B8.asm"
	include "src/f/112664.asm"
	include "src/f/112754.asm"
	include "src/f/11286E.asm"
	include "src/f/1128AE.asm"
	include "src/f/1128E4.asm"
	include "src/f/112A2E.asm"
	include "src/f/112B2E.asm"
	include "src/f/112B90.asm"
	include "src/f/112BDE.asm"
	include "src/f/112C50.asm"
	include "src/f/112C9E.asm"
	include "src/f/112D1E.asm"
	include "src/f/112D9E.asm"
	include "src/f/112EA4.asm"
	include "src/f/112F58.asm"
	include "src/f/112F8E.asm"
Tbl_DeathbirdVdp:	; words copied to the VDP data port by VDP_WriteWords; 18B of 1C8 bytes used at runtime; read by VDP_WriteWords; jt[1388] used by sub_15C306
	incrom	$112FD8,$1C8
Tbl_XPlayer_vtable:	; class descriptor "XPLAYER": word $F2 = name offset, long parent (ACTOR), 59 method pointers, then the class name string
	incrom	$1131A0,$FA
Tbl_XClimber_vtable:	; class descriptor "XCLIMBER": word $F6 = name offset, long parent (XPLAYER), 60 method pointers, then the class name string
	incrom	$11329A,$100
Tbl_Beast_vtable:	; class descriptor "BEAST": word $F6 = name offset, long parent (XCLIMBER), 60 method pointers, then the class name string
	incrom	$11339A,$FC
Tbl_Nightcrawler_vtable:	; class descriptor "NIGHTCRAWLER": word $F6 = name offset, long parent (XCLIMBER), 60 method pointers, then the class name string
	incrom	$113496,$104
Tbl_Psylocke_vtable:	; class descriptor "PSYLOCKE": word $F6 = name offset, long parent (XCLIMBER), 60 method pointers, then the class name string
	incrom	$11359A,$100
Tbl_Wolverine_vtable:	; class descriptor "WOLVERINE": word $F6 = name offset, long parent (XCLIMBER), 60 method pointers, then the class name string
	incrom	$11369A,$100
Tbl_Magneto_vtable:	; class descriptor "MAGNETO": word $F2 = name offset, long parent (XPLAYER), 59 method pointers, then the class name string
	incrom	$11379A,$FA
Tbl_Gambit_vtable:	; class descriptor "GAMBIT": word $F2 = name offset, long parent (XPLAYER), 59 method pointers, then the class name string
	incrom	$113894,$FA
Tbl_Cyclops_vtable:	; class descriptor "CYCLOPS": word $F2 = name offset, long parent (XPLAYER), 59 method pointers, then the class name string
	incrom	$11398E,$FA
Tbl_XNpc_vtable:	; class descriptor "XNPC": word $82 = name offset, long parent (ACTOR), 31 method pointers, then the class name string
	incrom	$113A88,$88
Tbl_BioNpc_vtable:	; class descriptor "BIONPC": word $82 = name offset, long parent (XNPC), 31 method pointers, then the class name string
	incrom	$113B10,$8A
	include "src/f/113B9A.asm"
	include "src/f/113BA8.asm"
	include "src/f/113BBE.asm"
	include "src/f/113C14.asm"
	include "src/f/113C80.asm"
	include "src/f/113CA6.asm"
	include "src/f/113D0E.asm"
	include "src/f/113D20.asm"
Sw_113D20:	; switch table of sub at $113D20: 9 word offsets from Sw_113D20-2
	dc.w	XNpc_TakeDamage_Type4-(Sw_113D20-2), XNpc_TakeDamage_Default-(Sw_113D20-2), XNpc_TakeDamage_Default-(Sw_113D20-2), XNpc_TakeDamage_Default-(Sw_113D20-2)
	dc.w	XNpc_TakeDamage_Default-(Sw_113D20-2), XNpc_TakeDamage_Hurt-(Sw_113D20-2), XNpc_TakeDamage_Hurt-(Sw_113D20-2), XNpc_TakeDamage_Hurt-(Sw_113D20-2)
	dc.w	XNpc_TakeDamage_Hurt-(Sw_113D20-2)
	include "src/f/113D60.asm"
	include "src/f/113D64.asm"
	include "src/f/113DA0.asm"
	include "src/f/113E76.asm"
	include "src/f/113E80.asm"
	include "src/f/113EDA.asm"
	include "src/f/113EFE.asm"
	include "src/f/113F38.asm"
	include "src/f/113F5C.asm"
Sw_113F5C:	; switch table of sub at $113F5C: 4 word offsets from Sw_113F5C-2
	dc.w	loc_114008-(Sw_113F5C-2), loc_114088-(Sw_113F5C-2), XNpc_HurtReact_Stun-(Sw_113F5C-2), XNpc_HurtReact_Stun-(Sw_113F5C-2)
	include "src/f/113FFC.asm"
	include "src/f/114100.asm"
	include "src/f/11410E.asm"
Sw_11410E:	; switch table of sub at $11410E: 4 word offsets from Sw_11410E-2
	dc.w	loc_1141D2-(Sw_11410E-2), loc_114256-(Sw_11410E-2), XNpc_DeathReact_Explode-(Sw_11410E-2), XNpc_DeathReact_Explode-(Sw_11410E-2)
	include "src/f/1141C6.asm"
	include "src/f/1142D2.asm"
	include "src/f/1142E0.asm"
	include "src/f/1142E8.asm"
	include "src/f/11432E.asm"
	include "src/f/11434A.asm"
	include "src/f/11438A.asm"
	include "src/f/1143BC.asm"
	include "src/f/1143EC.asm"
	include "src/f/11446C.asm"
	include "src/f/11449C.asm"
	include "src/f/114550.asm"
	include "src/f/1146C6.asm"
	include "src/f/1146F6.asm"
	include "src/f/1147B6.asm"
	include "src/f/114860.asm"
	include "src/f/1148B2.asm"
	include "src/f/114914.asm"
	include "src/f/11494A.asm"
	include "src/f/11497C.asm"
	include "src/f/114ABA.asm"
	include "src/f/114AC8.asm"
	include "src/f/114ADE.asm"
	include "src/f/114B2E.asm"
	include "src/f/114B90.asm"
	include "src/f/114C4C.asm"
	include "src/f/114D0A.asm"
Tbl_XNpcTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 6 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, XNpc_Init, XNpc_KnockbackDist; jt[1417] used by XNpc_Init
	incrom	$114E70,$8
Tbl_MaintRobotTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 3 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, MaintRobot_Init; jt[1418] used by MaintRobot_Init, SwampFly_Init
	incrom	$114E78,$8
Art_XCloneSpr:	; sprite definition (type $01): $24-byte header, $14-byte frame records, pieces, tiles; 5 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, VDP_WriteWords, XClone_Init; jt[1419] used by XClone_Init
	incrom	$114E80,$8
Tbl_BioNpcVdp:	; words copied to the VDP data port by VDP_WriteWords; EE8 of EE8 bytes used at runtime; read by VDP_WriteWords; jt[1420] used by Scene_AllocCommonVram
	incrom	$114E88,$EE8
Art_PowerUpSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; CC0 of 1764 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStreamClip, Spr_UploadFrame; DMA to VRAM $B3A0-DF00; jt[1421] used by PowerUp_Init
	incrom	$115D70,$1764
Tbl_SegmentMinusPowerUpUpdate:	; table read by PowerUp_Update; C of 16 bytes used at runtime; read by PowerUp_Update, Actor_Draw; jt[1422] used by SegmentMinusPowerUp_Init, SegmentPlusPowerUp_Init
	incrom	$1174D4,$16
Tbl_XPowerMinusPowerUpUpdate:	; table read by PowerUp_Update; C of 16 bytes used at runtime; read by PowerUp_Update, Actor_Draw, XPowerPlusPowerUp_Init; jt[1423] used by XPowerMinusPowerUp_Init, XPowerPlusPowerUp_Init
	incrom	$1174EA,$16
Tbl_MondoMinusPowerUpUpdate:	; table read by PowerUp_Update; 14 of 26 bytes used at runtime; read by PowerUp_Update; jt[1424] used by MondoMinusPowerUp_Init, MondoPlusPowerUp_Init
	incrom	$117500,$26
Tbl_MysteryPowerUpInit:	; format not established; never read in the corpus; jt[1425] used by MysteryPowerUp_Init
	incrom	$117526,$16
	include "src/f/11753C.asm"
	include "src/f/11754A.asm"
	include "src/f/117608.asm"
	include "src/f/1177AA.asm"
	include "src/f/1177B8.asm"
	include "src/f/1177C6.asm"
	include "src/f/117802.asm"
	include "src/f/117860.asm"
	include "src/f/11789C.asm"
	include "src/f/1178AA.asm"
	include "src/f/1178FC.asm"
	include "src/f/117938.asm"
	include "src/f/117946.asm"
	include "src/f/11798A.asm"
	include "src/f/1179C6.asm"
	include "src/f/1179D4.asm"
	include "src/f/117A26.asm"
	include "src/f/117A62.asm"
	include "src/f/117A70.asm"
	include "src/f/117AB4.asm"
	include "src/f/117AE4.asm"
	include "src/f/117AF2.asm"
	include "src/f/117B44.asm"
	include "src/f/117B82.asm"
	include "src/f/117B90.asm"
	include "src/f/117BD4.asm"
Tbl_PowerUp_vtable:	; class descriptor "POWERUP": word $72 = name offset, long parent (ACTOR), 27 method pointers, then the class name string
	incrom	$117C28,$7A
Tbl_SegmentPlusPowerUp_vtable:	; class descriptor "SEGMENTPLUSPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117CA2,$86
Tbl_SegmentMinusPowerUp_vtable:	; class descriptor "SEGMENTMINUSPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117D28,$86
Tbl_XPowerPlusPowerUp_vtable:	; class descriptor "XPOWERPLUSPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117DAE,$84
Tbl_XPowerMinusPowerUp_vtable:	; class descriptor "XPOWERMINUSPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117E32,$86
Tbl_MondoPlusPowerUp_vtable:	; class descriptor "MONDOPLUSPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117EB8,$84
Tbl_MondoMinusPowerUp_vtable:	; class descriptor "MONDOMINUSPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117F3C,$84
Tbl_MysteryPowerUp_vtable:	; class descriptor "MYSTERYPOWERUP": word $72 = name offset, long parent (POWERUP), 27 method pointers, then the class name string
	incrom	$117FC0,$82
	include "src/f/118042.asm"
	include "src/f/118074.asm"
	include "src/f/118136.asm"
	include "src/f/118166.asm"
	include "src/f/1181AC.asm"
	include "src/f/1181F6.asm"
	include "src/f/11821E.asm"
	include "src/f/118254.asm"
	include "src/f/1182D4.asm"
	include "src/f/118426.asm"
	include "src/f/118430.asm"
	include "src/f/1184AC.asm"
	include "src/f/118550.asm"
	include "src/f/1186A8.asm"
	include "src/f/11870A.asm"
	include "src/f/118750.asm"
	include "src/f/118758.asm"
	include "src/f/118760.asm"
	include "src/f/1187C2.asm"
	include "src/f/118814.asm"
	include "src/f/118826.asm"
	include "src/f/118874.asm"
Tbl_ICandy_vtable:	; class descriptor "ICANDY": word $26 = name offset, long parent (none), 8 method pointers, then the class name string
	incrom	$1188AC,$2E
	include "src/f/1188DA.asm"
	include "src/f/1188E8.asm"
	include "src/f/11893C.asm"
Sw_11893C:	; switch table of sub at $11893C: 17 word offsets from Sw_11893C-2
	dc.w	RThetaObject_Move_Case0-(Sw_11893C-2), loc_118A7C-(Sw_11893C-2), RThetaObject_Move_Case2-(Sw_11893C-2), loc_118A9C-(Sw_11893C-2)
	dc.w	RThetaObject_Move_Case4-(Sw_11893C-2), loc_118AC8-(Sw_11893C-2), loc_118AE0-(Sw_11893C-2), loc_118B00-(Sw_11893C-2)
	dc.w	loc_118B24-(Sw_11893C-2), loc_118B38-(Sw_11893C-2), loc_118B50-(Sw_11893C-2), loc_118B70-(Sw_11893C-2)
	dc.w	loc_118B94-(Sw_11893C-2), loc_118BB4-(Sw_11893C-2), loc_118BD6-(Sw_11893C-2), loc_118C00-(Sw_11893C-2)
	dc.w	RThetaObject_Move_Case16-(Sw_11893C-2)
	include "src/f/118A74.asm"
	include "src/f/118A88.asm"
	include "src/f/118AB4.asm"
	include "src/f/118C2E.asm"
Tbl_RThetaObject_vtable:	; class descriptor "RTHETAOBJECT": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$118C8E,$7C
Tbl_GaussBulletUpdate:	; table read by GaussBullet_Update; 28 of 28 bytes used at runtime; read by GaussBullet_Update; jt[1481] used by GaussBullet_InitPool
	incrom	$118D0A,$28
Tbl_GaussBullet_vtable:	; class descriptor "GAUSSBULLET": word $E = name offset, long parent (none), 2 method pointers, then the class name string
	incrom	$118D32,$1A
	include "src/f/118D4C.asm"
	include "src/f/118D56.asm"
	include "src/f/118D6C.asm"
	include "src/f/119086.asm"
	include "src/f/1190D6.asm"
Str_Empty_11918E:	; C string "" (used by GaussBullet_InitPool)
	incrom	$11918E,$2
	include "src/f/119190.asm"
Art_GaussBulletSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 4A4 of 4A4 bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; jt[1487] used by GaussBullet_InitPool
	incrom	$11928A,$4A4
	include "src/f/11972E.asm"
	include "src/f/119738.asm"
Str_Empty_119782:	; C string "" (used by BBoard_New)
	incrom	$119782,$2
	include "src/f/119784.asm"
	include "src/f/119796.asm"
Tbl_BBoard_vtable:	; class descriptor "BBOARD": word $16 = name offset, long parent (none), 4 method pointers, then the class name string
	incrom	$1197CA,$1E
	include "src/f/1197E8.asm"
	include "src/f/1197F2.asm"
Str_Empty_119892:	; C string "" (used by Synchronizer_New)
	incrom	$119892,$2
	include "src/f/119894.asm"
	include "src/f/119914.asm"
	include "src/f/11993A.asm"
	include "src/f/119960.asm"
	include "src/f/11997A.asm"
	include "src/f/11998A.asm"
	include "src/f/1199B8.asm"
	include "src/f/119A46.asm"
	include "src/f/119A8C.asm"
	include "src/f/119B20.asm"
	include "src/f/119B66.asm"
	include "src/f/119BCA.asm"
	include "src/f/119CEC.asm"
Tbl_Synchronizer_vtable:	; class descriptor "SYNCHRONIZER": word $2A = name offset, long parent (none), 9 method pointers, then the class name string
	incrom	$119CFE,$38
	include "src/f/119D36.asm"
	include "src/f/119D44.asm"
	include "src/f/119D72.asm"
	include "src/f/119DC4.asm"
	include "src/f/119E20.asm"
	include "src/f/119E3E.asm"
	include "src/f/119E48.asm"
	include "src/f/119E66.asm"
	include "src/f/119E70.asm"
	include "src/f/119E92.asm"
	include "src/f/119EB4.asm"
Tbl_SyncActor_vtable:	; class descriptor "SYNCHRONIZEDACTOR": word $7E = name offset, long parent (ACTOR), 30 method pointers, then the class name string
	incrom	$119ECA,$90
Art_BabyBioSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1180 of 13E0 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $9480-C500; jt[1515] used by BabyBio_Init, BrainChild_StateLand
	incrom	$119F5A,$13E0
Art_BabyBioSpr2:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; C of E bytes used at runtime; read by Anim_ApplyStep, VDP_FlushDmaQueue, Spr_EmitStreamClip; jt[1516] used by BabyBio_ActCrawl, BabyBio_Move
	incrom	$11B33A,$E
Tbl_WallCrawlBioActCrawlHorizontal:	; format not established; never read in the corpus; jt[1517] used by WallCrawlBio_ActCrawlHorizontal
	incrom	$11B348,$E
Tbl_WallCrawlBioAnim3:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1518] used by WallCrawlBio_ActCrawlHorizontal -> Obj_SetAnim
	incrom	$11B356,$E
Tbl_WallCrawlBioAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, WallCrawlBio_Move, Anim_Advance; jt[1519] used by WallCrawlBio_ActCrawlHorizontal
	incrom	$11B364,$E
Tbl_WallCrawlBioActCrawlVertical:	; format not established; never read in the corpus; jt[1520] used by WallCrawlBio_ActCrawlVertical
	incrom	$11B372,$E
Tbl_WallCrawlBioAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, WallCrawlBio_Move, Anim_Advance; jt[1521] used by WallCrawlBio_ActCrawlVertical
	incrom	$11B380,$E
Tbl_WallCrawlBioAnim4:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1522] used by WallCrawlBio_ActCrawlVertical -> Obj_SetAnim
	incrom	$11B38E,$E
Tbl_BabyBioAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1523] used by BabyBio_ActCrawl, BabyBio_ActPlayAnimB
	incrom	$11B39C,$8
Tbl_BabyBioAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 5 of 8 bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[1524] used by BabyBio_ActPlayAnimA
	incrom	$11B3A4,$8
Tbl_BabyBioAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1525] used by BabyBio_ActPlayAnimC
	incrom	$11B3AC,$A
Tbl_BabyBioMove:	; table read by BabyBio_Move; 8 of A bytes used at runtime; read by BabyBio_Move, Anim_ApplyStep, Anim_AdvanceByDistance; jt[1526] used by BabyBio_ActPlayAnimD
	incrom	$11B3B6,$A
Tbl_BabyBioMove2:	; table read by BabyBio_Move; 122 of 124 bytes used at runtime; read by BabyBio_Move; jt[1527] used by BabyBio_Init, BabyBio_Move, ChildShip_Init
	incrom	$11B3C0,$124
Tbl_BabySentinelAAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1528] used by BabySentinelA_Init -> AiScript_Set
	incrom	$11B4E4,$2
	include "src/f/11B4E6.asm"
Tbl_BabySentinelBActWaitPlayerNear192:	; table read by BabyBio_ActWaitPlayerNear192; 2 of 2 bytes used at runtime; read by BabyBio_ActWaitPlayerNear192; jt[1529] used by BabySentinelB_Init
	incrom	$11B506,$2
	include "src/f/11B508.asm"
	include "src/f/11B524.asm"
Tbl_BabySentinelBAiScript_11B53C:	; word $0000 (2 bytes), not a string: reached only via jt[1530] used by BabySentinelB_Init -> AiScript_Set (e.g. an empty list/script count)
	incrom	$11B53C,$1
Tbl_BabySentinelBActPlayAnimD:	; table read by BabyBio_ActPlayAnimD; 1 of 1 bytes used at runtime; read by BabyBio_ActPlayAnimD
	incrom	$11B53D,$1
	include "src/f/11B53E.asm"
	include "src/f/11B552.asm"
Tbl_BabySentinelCAiScript_11B55E:	; word $0000 (2 bytes), not a string: reached only via jt[1531] used by BabySentinelC_Init -> AiScript_Set (e.g. an empty list/script count)
	incrom	$11B55E,$1
Tbl_BabySentinelBWaitCrawlLimit:	; table read by BabyBio_WaitCrawlLimit; 1 of 1 bytes used at runtime; read by BabyBio_WaitCrawlLimit
	incrom	$11B55F,$1
	include "src/f/11B560.asm"
Tbl_BabySentinelCAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1532] used by BabySentinelC_Init -> AiScript_Set
	incrom	$11B590,$2E
Tbl_BabyMoleManActPlayAnimC:	; table read by BabyBio_ActPlayAnimC; 2 of 2 bytes used at runtime; read by BabyBio_ActPlayAnimC; jt[1533] used by BabyMoleMan_Init_Default
	incrom	$11B5BE,$2
	include "src/f/11B5C0.asm"
Tbl_BabyMoleManAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1534] used by BabyMoleMan_Init_Case0 -> AiScript_Set
	incrom	$11B5D0,$2A
Tbl_BabyMoleManActPlayAnimC2:	; table read by BabyBio_ActPlayAnimC; 2 of 2 bytes used at runtime; read by BabyBio_ActPlayAnimC; jt[1535] used by BabyMoleMan_Init_Case1
	incrom	$11B5FA,$2
	include "src/f/11B5FC.asm"
Tbl_BabyMoleManAiScript2:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1536] used by BabyMoleMan_Init_Case2 -> AiScript_Set
	incrom	$11B60C,$12
Tbl_BabyMoleManAiScript3:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1537] used by BabyMoleMan_Init_Case2 -> AiScript_Set
	incrom	$11B61E,$12
Tbl_FloatBioActNext:	; table read by BabyBio_ActNext; 2 of 2 bytes used at runtime; read by BabyBio_ActNext; jt[1538] used by FloatBio_Init_Case0
	incrom	$11B630,$2
	include "src/f/11B632.asm"
Tbl_FloatBioActFacePlayer:	; table read by BabyBio_ActFacePlayer; 2 of 2 bytes used at runtime; read by BabyBio_ActFacePlayer; jt[1539] used by FloatBio_Init_Case1
	incrom	$11B65A,$2
	include "src/f/11B65C.asm"
Tbl_FloatBioAiScript_11B66C:	; word $0000 (2 bytes), not a string: reached only via jt[1540] used by FloatBio_Init_Case1 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$11B66C,$1
Tbl_FloatBioActPlayAnimC:	; table read by BabyBio_ActPlayAnimC; 1 of 1 bytes used at runtime; read by BabyBio_ActPlayAnimC
	incrom	$11B66D,$1
	include "src/f/11B66E.asm"
	include "src/f/11B67E.asm"
Tbl_FloatBioAiScript_11B686:	; word $0000 (2 bytes), not a string: reached only via jt[1541] used by FloatBio_Init_Case1 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$11B686,$1
Tbl_FloatBioActPlayAnimC2:	; table read by BabyBio_ActPlayAnimC; 1 of 1 bytes used at runtime; read by BabyBio_ActPlayAnimC
	incrom	$11B687,$1
	include "src/f/11B688.asm"
Tbl_WallCrawlBioActStopFrame11:	; table read by WallCrawlBio_ActStopFrame11; 2 of 2 bytes used at runtime; read by WallCrawlBio_ActStopFrame11; jt[1542] used by WallCrawlBio_Init
	incrom	$11B6A0,$2
	include "src/f/11B6A2.asm"
Tbl_WallCrawlBioAiScript_11B6AA:	; word $0000 (2 bytes), not a string: reached only via jt[1543] used by WallCrawlBio_Init -> AiScript_Set (e.g. an empty list/script count)
	incrom	$11B6AA,$1
Tbl_WallCrawlBioActStopFrame0:	; table read by WallCrawlBio_ActStopFrame0; 1 of 1 bytes used at runtime; read by WallCrawlBio_ActStopFrame0
	incrom	$11B6AB,$1
	include "src/f/11B6AC.asm"
Tbl_BabyMoleManTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 6 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, XNpc_KnockbackDist, BabyMoleMan_Init; jt[1544] used by BabyMoleMan_Init, BabySentinelA_Init, WallCrawlBio_Init
	incrom	$11B6B4,$8
Tbl_BabySentinelBInit:	; table read by BabySentinelB_Init; 5 of 8 bytes used at runtime; read by BabySentinelB_Init, XNpc_TakeDamage_Hurt, XNpc_KnockbackDist; jt[1545] used by BabySentinelB_Init
	incrom	$11B6BC,$8
Tbl_FloatBioTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 5 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, FloatBio_Init, XNpc_KnockbackDist; jt[1546] used by FloatBio_Init
	incrom	$11B6C4,$8
Tbl_BabySentinelCTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 3 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, BabySentinelC_Init; jt[1547] used by BabySentinelC_Init
	incrom	$11B6CC,$8
Tbl_BioFlame_vtable:	; class descriptor "BIOFLAME": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$11B6D4,$78
Tbl_BabyBio_vtable:	; class descriptor "BABYBIO": word $82 = name offset, long parent (BIONPC), 31 method pointers, then the class name string
	incrom	$11B74C,$8A
Tbl_BabySentinelA_vtable:	; class descriptor "BABYSENTINELA": word $82 = name offset, long parent (BABYBIO), 31 method pointers, then the class name string
	incrom	$11B7D6,$90
Tbl_BabySentinelB_vtable:	; class descriptor "BABYSENTINELB": word $82 = name offset, long parent (BABYBIO), 31 method pointers, then the class name string
	incrom	$11B866,$90
Tbl_BabySentinelC_vtable:	; class descriptor "BABYSENTINELC": word $82 = name offset, long parent (BABYBIO), 31 method pointers, then the class name string
	incrom	$11B8F6,$90
Tbl_BabyMoleMan_vtable:	; class descriptor "BABYMOLEMAN": word $82 = name offset, long parent (BABYBIO), 31 method pointers, then the class name string
	incrom	$11B986,$8E
Tbl_FloatBio_vtable:	; class descriptor "FLOATBIO": word $82 = name offset, long parent (BABYBIO), 31 method pointers, then the class name string
	incrom	$11BA14,$8C
Tbl_WallCrawlBio_vtable:	; class descriptor "WALLCRAWLBIO": word $82 = name offset, long parent (BABYBIO), 31 method pointers, then the class name string
	incrom	$11BAA0,$90
	include "src/f/11BB30.asm"
	include "src/f/11BB3E.asm"
	include "src/f/11BB54.asm"
	include "src/f/11BC88.asm"
	include "src/f/11BE72.asm"
	include "src/f/11C146.asm"
	include "src/f/11C154.asm"
	include "src/f/11C16A.asm"
	include "src/f/11C172.asm"
	include "src/f/11C184.asm"
	include "src/f/11C190.asm"
	include "src/f/11C3C2.asm"
	include "src/f/11C576.asm"
	include "src/f/11C5BA.asm"
	include "src/f/11C630.asm"
	include "src/f/11C662.asm"
Sw_11C662:	; switch table of sub at $11C662: 4 word offsets from Sw_11C662-2
	dc.w	BabyBio_GetMoveLimit_Horiz-(Sw_11C662-2), loc_11C6A8-(Sw_11C662-2), BabyBio_GetMoveLimit_Vert-(Sw_11C662-2), BabyBio_GetMoveLimit_Vert-(Sw_11C662-2)
	include "src/f/11C694.asm"
	include "src/f/11C6BC.asm"
	include "src/f/11C6C4.asm"
	include "src/f/11C6CE.asm"
	include "src/f/11C71C.asm"
	include "src/f/11C782.asm"
	include "src/f/11C79E.asm"
	include "src/f/11C7E6.asm"
	include "src/f/11C88C.asm"
	include "src/f/11C918.asm"
	include "src/f/11C974.asm"
	include "src/f/11C9DC.asm"
	include "src/f/11CA3C.asm"
	include "src/f/11CA9C.asm"
	include "src/f/11CAFC.asm"
	include "src/f/11CB5C.asm"
	include "src/f/11CBBC.asm"
	include "src/f/11CC7E.asm"
	include "src/f/11CD42.asm"
	include "src/f/11CDA8.asm"
	include "src/f/11CE34.asm"
	include "src/f/11CE9A.asm"
	include "src/f/11CFE8.asm"
	include "src/f/11D0D4.asm"
	include "src/f/11D184.asm"
	include "src/f/11D210.asm"
	include "src/f/11D2C6.asm"
	include "src/f/11D3F2.asm"
	include "src/f/11D422.asm"
	include "src/f/11D4F0.asm"
	include "src/f/11D55C.asm"
	include "src/f/11D646.asm"
	include "src/f/11D6C0.asm"
	include "src/f/11D6CE.asm"
	include "src/f/11D6E4.asm"
	include "src/f/11D74A.asm"
	include "src/f/11D758.asm"
	include "src/f/11D76E.asm"
	include "src/f/11D836.asm"
	include "src/f/11D844.asm"
	include "src/f/11D85A.asm"
	include "src/f/11D922.asm"
	include "src/f/11D930.asm"
	include "src/f/11D946.asm"
Sw_11D946:	; switch table of sub at $11D946: 4 word offsets from Sw_11D946-2
	dc.w	BabyMoleMan_Init_Case0-(Sw_11D946-2), BabyMoleMan_Init_Case1-(Sw_11D946-2), BabyMoleMan_Init_Case2-(Sw_11D946-2), loc_11D9F8-(Sw_11D946-2)
	include "src/f/11D9BC.asm"
	include "src/f/11D9D0.asm"
	include "src/f/11D9E4.asm"
	include "src/f/11DA0C.asm"
	include "src/f/11DA54.asm"
	include "src/f/11DA62.asm"
	include "src/f/11DAB6.asm"
	include "src/f/11DACC.asm"
Sw_11DACC:	; switch table of sub at $11DACC: 4 word offsets from Sw_11DACC-2
	dc.w	FloatBio_Init_Case0-(Sw_11DACC-2), FloatBio_Init_Case1-(Sw_11DACC-2), loc_11DBC6-(Sw_11DACC-2), loc_11DBDA-(Sw_11DACC-2)
	include "src/f/11DB4E.asm"
	include "src/f/11DB64.asm"
	include "src/f/11DBFA.asm"
	include "src/f/11DC32.asm"
	include "src/f/11DC40.asm"
	include "src/f/11DCB6.asm"
	include "src/f/11DD2C.asm"
	include "src/f/11DD92.asm"
	include "src/f/11DE38.asm"
	include "src/f/11DE9E.asm"
	include "src/f/11DF44.asm"
	include "src/f/11DF5A.asm"
	include "src/f/11E176.asm"
Art_BioBulletSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 20 of 66 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_UploadFrame, Spr_EmitStreamClip; DMA to VRAM $A180-A1A0; jt[1617] used by BioBullet_Init
	incrom	$11E2FA,$66
	include "src/f/11E360.asm"
	include "src/f/11E36E.asm"
	include "src/f/11E3E6.asm"
	include "src/f/11E420.asm"
	include "src/f/11E480.asm"
	include "src/f/11E5E6.asm"
	include "src/f/11E618.asm"
Tbl_BioBullet_vtable:	; class descriptor "BIOBULLET": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$11E6EC,$78
Tbl_XCloneAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1625] used by BioBalls_StateAnimA, XClone_ActBecomeBalls, XClone_ActOpenBioBalls
	incrom	$11E764,$C
Tbl_BioBallsAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1626] used by BioBalls_StateAnimB, XClone_StatePodWaitOpen
	incrom	$11E770,$C
Tbl_BioBallsAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1627] used by BioBalls_Init -> AiScript_Set
	incrom	$11E77C,$2
	include "src/f/11E77E.asm"
	incrom	$11E782,$28
	include "src/f/11E7AA.asm"
	include "src/f/11E7B8.asm"
	include "src/f/11E7C4.asm"
	include "src/f/11E8F2.asm"
	include "src/f/11E9CC.asm"
	include "src/f/11ED04.asm"
	include "src/f/11EEA8.asm"
	include "src/f/11EF1E.asm"
	include "src/f/11EF42.asm"
	include "src/f/11EF96.asm"
	include "src/f/11EFF2.asm"
	include "src/f/11F05C.asm"
	include "src/f/11F0C6.asm"
	include "src/f/11F11C.asm"
	include "src/f/11F152.asm"
	include "src/f/11F188.asm"
	include "src/f/11F1A6.asm"
Str_Empty_11F22A:	; C string "" (used by BioBalls_AllocBallList)
	incrom	$11F22A,$2
	include "src/f/11F22C.asm"
	include "src/f/11F2F2.asm"
	include "src/f/11F3E2.asm"
	include "src/f/11F42C.asm"
	include "src/f/11F4C0.asm"
	include "src/f/11F538.asm"
	include "src/f/11F588.asm"
	include "src/f/11F67C.asm"
	include "src/f/11FAA2.asm"
	include "src/f/11FCB8.asm"
	include "src/f/11FEE4.asm"
	include "src/f/1200AE.asm"
	include "src/f/120124.asm"
	include "src/f/1203A4.asm"
Tbl_BioBalls_vtable:	; class descriptor "BIOBALLS": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$1203AC,$78
Art_BioBallsSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 180 of 1F8 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $A820-A8A0; jt[1659] used by BioBalls_Draw, BioBalls_Init
	incrom	$120424,$1F8
Tbl_Anim_12061C:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, VDP_FlushDmaQueue, Anim_AdvanceByDistance; jt[1660] used by SavageMediumBio_ActWalk, BigBio_StateWaitPlayers
	incrom	$12061C,$12
Tbl_Anim_12062E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1661] used by BioSentinel_StateThink
	incrom	$12062E,$12
Tbl_Anim_120640:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1662] used by SavageMediumBio_ActShoot, BioSentinel_StateAimLevel
	incrom	$120640,$A
Tbl_Anim_12064A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1663] used by BioSentinel_StateAimUp
	incrom	$12064A,$A
Tbl_Anim_120654:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1664] used by BioSentinel_StateAimDown
	incrom	$120654,$A
Tbl_Anim_12065E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1665] used by BioSentinel_StateWalking, BioSentinel_StateThink
	incrom	$12065E,$C
Tbl_Anim_12066A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1666] used by BioSentinel_StateStart
	incrom	$12066A,$A
Tbl_Anim_120674:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1667] used by BioSentinel_StateCeilingCrawl
	incrom	$120674,$A
Tbl_Anim_12067E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1668] used by BioSentinel_StateDropFlip
	incrom	$12067E,$A
Tbl_Anim_120688:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1669] used by BioSentinel_StateHurt
	incrom	$120688,$E
Tbl_Anim_120696:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1670] used by BioSentinel_StateHurt
	incrom	$120696,$E
Tbl_BioSentinelInit:	; table read by BioSentinel_Init; 1 of 8 bytes used at runtime; read by BioSentinel_Init; jt[1671] used by BioSentinel_Init
	incrom	$1206A4,$8
Tbl_Anim_1206AC:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[1672] used by BigBio_StateWalkIn
	incrom	$1206AC,$10
Tbl_BigBioAnim:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1673] used by BigBio_ActRoarThenMorph -> Obj_SetAnim, BigBio_ActRoarThenLaunch -> Obj_SetAnim
	incrom	$1206BC,$E
Tbl_Anim_1206CA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1674] used by BigBio_StateDefeated
	incrom	$1206CA,$E
Tbl_BigBioAnim2:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1675] used by BigBio_StateMorphToShape, BigBio_StateGatherOrbs -> Obj_SetAnim
	incrom	$1206D8,$E
Tbl_Anim_1206E6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1676] used by BigBio_ActIdleAnim90, BigBio_ActFaceIdle90, BigBio_StartScript
	incrom	$1206E6,$E
Tbl_Anim_1206F4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep; jt[1677] used by BigBio_ActSpit3
	incrom	$1206F4,$E
Tbl_BigBioBigBio:	; data handed to BigBio_SetOrbShape (format not established); never read in the corpus; jt[1678] used by BigBio_StateStartMorph -> BigBio_SetOrbShape, BigBio_StateLaunch -> BigBio_Launch, BigBio_StateDeathOrbs -> BigBio_SetOrbShape
	incrom	$120702,$84
Tbl_BigBioStateDying:	; format not established; never read in the corpus; jt[1679] used by BigBio_StateDying
	incrom	$120786,$20
Tbl_BigBioDraw:	; table read by BigBio_Draw; 80 of 80 bytes used at runtime; read by BigBio_Draw, BigBio_StateWaitPlayers, BigBio_TakeDamage; jt[1680] used by BigBio_Draw, BigBio_TakeDamage, BigBio_StateWaitPlayers
	incrom	$1207A6,$80
Tbl_Draw_120826:	; table read by BigBio_Draw; 2 of 2 bytes used at runtime; read by BigBio_Draw, BigBio_StateWaitPlayers, BigBio_TakeDamage; jt[1681] used by BigBio_StartScript
	incrom	$120826,$2
	include "src/f/120828.asm"
	include "src/f/120868.asm"
	include "src/f/120876.asm"
	include "src/f/120936.asm"
	include "src/f/120944.asm"
	include "src/f/1209D8.asm"
	include "src/f/120B4A.asm"
	include "src/f/120C02.asm"
	include "src/f/120D32.asm"
	include "src/f/120DA2.asm"
	include "src/f/120E2C.asm"
	include "src/f/120F00.asm"
	include "src/f/120F64.asm"
	include "src/f/120FC8.asm"
	include "src/f/12102C.asm"
	include "src/f/121062.asm"
	include "src/f/121098.asm"
	include "src/f/1210CE.asm"
	include "src/f/12110E.asm"
	include "src/f/12123E.asm"
	include "src/f/121408.asm"
	include "src/f/1214B2.asm"
	include "src/f/121566.asm"
	include "src/f/12156E.asm"
	include "src/f/12157A.asm"
	include "src/f/121582.asm"
	include "src/f/121598.asm"
	include "src/f/1215A6.asm"
	include "src/f/121634.asm"
	include "src/f/121662.asm"
	include "src/f/1218F0.asm"
	include "src/f/121992.asm"
	include "src/f/1219FE.asm"
	include "src/f/121CD6.asm"
	include "src/f/121D94.asm"
	include "src/f/121DB6.asm"
	include "src/f/122024.asm"
	include "src/f/122088.asm"
	include "src/f/1221D0.asm"
	include "src/f/122244.asm"
	include "src/f/1222A0.asm"
	include "src/f/12232C.asm"
	include "src/f/122362.asm"
	include "src/f/122398.asm"
	include "src/f/1223D4.asm"
	include "src/f/122438.asm"
	include "src/f/1224B0.asm"
	include "src/f/122660.asm"
	include "src/f/1226C4.asm"
	include "src/f/1227B4.asm"
	include "src/f/12287A.asm"
	include "src/f/1228F2.asm"
	include "src/f/1229AC.asm"
	include "src/f/122A14.asm"
	include "src/f/122AFA.asm"
	include "src/f/122B96.asm"
	include "src/f/122DBE.asm"
	include "src/f/122E18.asm"
	include "src/f/122E92.asm"
	include "src/f/122EDA.asm"
	include "src/f/122F64.asm"
	include "src/f/12314C.asm"
	include "src/f/1231E0.asm"
	include "src/f/123242.asm"
	include "src/f/123272.asm"
	include "src/f/1232F0.asm"
	include "src/f/123346.asm"
	include "src/f/12340E.asm"
	include "src/f/1234F4.asm"
	include "src/f/1234FC.asm"
Tbl_BigBio:	; format not established; never read in the corpus; referenced by BigBio_ClassInit
	incrom	$12355E,$2
Tbl_BigBio2:	; format not established; never read in the corpus; referenced by BigBio_ClassInit
	incrom	$123560,$2
Tbl_BasicBioSentinel_vtable:	; class descriptor "BASICBIOSENTINEL": word $82 = name offset, long parent (BIONPC), 31 method pointers, then the class name string
	incrom	$123562,$94
Tbl_BioSentinel_vtable:	; class descriptor "BIOSENTINEL": word $82 = name offset, long parent (BASICBIOSENTINEL), 31 method pointers, then the class name string
	incrom	$1235F6,$8E
Tbl_BigBio_vtable:	; class descriptor "BIGBIO": word $82 = name offset, long parent (BASICBIOSENTINEL), 31 method pointers, then the class name string
	incrom	$123684,$8A
Art_BasicBioSentinelSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 4E60 of 5822 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $9A80-A960; jt[1708] used by BasicBioSentinel_SetFrame, BigBio_Init, SavageBioBase_SetFrame
	incrom	$12370E,$5822
Art_BasicBioSentinelSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 4360 of 4DAC bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $9A80-BCC0; jt[1709] used by BasicBioSentinel_SetFrame, BioSentinel_Init, SavageBioBase_SetFrame
	incrom	$128F30,$4DAC
Art_BigBioSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 159 of 15A bytes used at runtime; read by Nem_DecodeLoop, VDP_FlushDmaQueue, Spr_PreloadTiles; jt[1710] used by BigBio_ClassInit
	incrom	$12DCDC,$15A
Art_BasicBioSentinelSpr3:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3A0 of 1E70 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $A820-ABC0; jt[1711] used by BasicBioSentinel_SetFrame, SavageBioBase_SetFrame, SavageMediumBio_Init
	incrom	$12DE36,$1E70
Art_SavageBioSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2080 of 2E42 bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; DMA to VRAM $AC60-BA80; jt[1712] used by BasicBioSentinel_SetFrame, SavageBigBio_Init, SavageBioBase_SetFrame
	incrom	$12FCA6,$2E42
Art_SavageA4Spr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 54C of 54C bytes used at runtime; read by VDP_FlushDmaQueue, VDP_WriteWords; jt[1713] used by SavageA4_LoadResources
	incrom	$132AE8,$54C
Art_BrainRocketSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 120 of 5FC bytes used at runtime; read by VDP_FlushDmaQueue, Spr_UploadFrame, Obj_UpdateBoxes; DMA to VRAM $D6A0-D740; jt[1714] used by BrainRocket_Init
	incrom	$133034,$5FC
	include "src/f/133630.asm"
	include "src/f/13363E.asm"
	include "src/f/13364A.asm"
	include "src/f/1336DC.asm"
	include "src/f/1337BA.asm"
	include "src/f/1337FC.asm"
	include "src/f/133898.asm"
	include "src/f/1338A8.asm"
	include "src/f/13395E.asm"
	include "src/f/1339A6.asm"
	include "src/f/1339C8.asm"
	include "src/f/1339F4.asm"
	include "src/f/133A40.asm"
	include "src/f/133B42.asm"
	include "src/f/133B66.asm"
	include "src/f/133B74.asm"
	include "src/f/133BB2.asm"
	include "src/f/133C1A.asm"
	include "src/f/133CD0.asm"
	include "src/f/133CF4.asm"
Tbl_BrainRocket_vtable:	; class descriptor "BRAINROCKET": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$133CFC,$7A
Tbl_DropRocket_vtable:	; class descriptor "DROPROCKET": word $6E = name offset, long parent (BRAINROCKET), 26 method pointers, then the class name string
	incrom	$133D76,$7A
Tbl_BigAcBulletAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1729] used by BrainRocket_StateSetDirection, DropRocket_StateDrop
	incrom	$133DF0,$C
Tbl_BigAcBulletAnim3:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1730] used by BrainRocket_StateSetDirection -> Obj_SetAnim
	incrom	$133DFC,$C
Tbl_BigAcBulletAnim4:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1731] used by BrainRocket_StateSetDirection -> Obj_SetAnim
	incrom	$133E08,$C
Tbl_BrainRocketShakeStep:	; table read by Cam_ShakeStep; D of E bytes used at runtime; read by Cam_ShakeStep; jt[1732] used by BrainRocket_Attack
	incrom	$133E14,$E
Tbl_BrainRocketShakeStep2:	; table read by Cam_ShakeStep; 13 of 14 bytes used at runtime; read by Cam_ShakeStep; jt[1733] used by BrainRocket_Update
	incrom	$133E22,$14
Tbl_BrainRocketUpdate:	; format not established; never read in the corpus; jt[1734] used by BrainRocket_Update, BrainRocket_Attack
	incrom	$133E36,$14
	include "src/f/133E4A.asm"
Art_CloneA1Spr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; A3 of A4 bytes used at runtime; read by Spr_PreloadTiles, Nem_BuildCodeTable; jt[1736] used by CloneA1_LoadResources, CloneA2_LoadResources, SavageA2_LoadResources
	incrom	$133E98,$A4
	include "src/f/133F3C.asm"
	include "src/f/133F4A.asm"
	include "src/f/133F56.asm"
	include "src/f/133F62.asm"
	include "src/f/134080.asm"
	include "src/f/1340D0.asm"
	include "src/f/13412A.asm"
	include "src/f/13420C.asm"
Tbl_FireWall_vtable:	; class descriptor "FIREWALL": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$134214,$78
	incrom	$13428C,$38
Tbl_1342C4:	; format not established; never read in the corpus; jt[1743] used by FireWall_StateSpawnFlame
	incrom	$1342C4,$28
	incrom	$1342EC,$18
Tbl_134304:	; format not established; never read in the corpus; jt[1745] used by FireWall_StateSpawnFlame
	incrom	$134304,$38
	incrom	$13433C,$28
Tbl_134364:	; format not established; never read in the corpus; jt[1747] used by FireWall_StateSpawnFlame
	incrom	$134364,$18
Tbl_Anim_13437C:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1748] used by FlyBrood_Init_Tail, FlyBrood_ActDiveAtPlayer, FlyBrood_ActDiveAtPlayerLow
	incrom	$13437C,$A
Tbl_Anim_134386:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1749] used by FlyBrood_StateSwoopPatrol -> Obj_ChangeAnim
	incrom	$134386,$A
Tbl_Anim_134390:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1750] used by FlyBrood_Init_Tail -> Obj_ChangeAnim, FlyBrood_ActDiveAtPlayer -> Obj_ChangeAnim, FlyBrood_ActDiveAtPlayerLow -> Obj_ChangeAnim
	incrom	$134390,$18
Tbl_AiScript_1343A8:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1751] used by FlyBrood_Init_Case4 -> AiScript_Set
	incrom	$1343A8,$54
Tbl_1343FC:	; format not established; never read in the corpus; jt[1752] used by FlyBrood_StateSwoopPatrol
	incrom	$1343FC,$5C
Tbl_FlyBroodMovePath:	; table read by FlyBrood_MovePath; 7E of 80 bytes used at runtime; read by FlyBrood_MovePath; jt[1753] used by FlyBrood_ActHover90, FlyBrood_ActHoverForever, FlyBrood_ActHoverUntilNear
	incrom	$134458,$80
Tbl_AiScript_1344D8:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1754] used by FlyBrood_Init_Case0 -> AiScript_Set
	incrom	$1344D8,$2
	include "src/f/1344DA.asm"
Tbl_FlyBroodAiScript_1344DE:	; word $0000 (2 bytes), not a string: reached only via jt[1755] used by FlyBrood_Init_Case1 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$1344DE,$1
Tbl_FlyBroodStateWaitPlayerInRange:	; table read by FlyBrood_StateWaitPlayerInRange; 1 of 1 bytes used at runtime; read by FlyBrood_StateWaitPlayerInRange
	incrom	$1344DF,$1
	include "src/f/1344E0.asm"
Tbl_FlyBroodAiScript_1344E8:	; word $0000 (2 bytes), not a string: reached only via jt[1756] used by FlyBrood_Init_Case1 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$1344E8,$1
Tbl_FlyBroodStateWaitPlayerInRange2:	; table read by FlyBrood_StateWaitPlayerInRange; 1 of 1 bytes used at runtime; read by FlyBrood_StateWaitPlayerInRange
	incrom	$1344E9,$1
	include "src/f/1344EA.asm"
Tbl_FlyBroodAiScript_1344F2:	; word $0000 (2 bytes), not a string: reached only via jt[1757] used by FlyBrood_Init_Case1 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$1344F2,$1
Tbl_FlyBroodStateWaitPlayerInRange3:	; table read by FlyBrood_StateWaitPlayerInRange; 1 of 1 bytes used at runtime; read by FlyBrood_StateWaitPlayerInRange
	incrom	$1344F3,$1
	include "src/f/1344F4.asm"
Tbl_FlyBroodAiScript:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1758] used by FlyBrood_Init_Case4 -> AiScript_Set
	incrom	$1344FC,$A
Tbl_FlyBroodAiScript2:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1759] used by FlyBrood_Init_Case4 -> AiScript_Set
	incrom	$134506,$6
Tbl_FlyBroodAiScript3:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1760] used by FlyBrood_Init_Case4 -> AiScript_Set
	incrom	$13450C,$6
Tbl_FlyBroodAiScript4:	; data handed to AiScript_Set (format not established); never read in the corpus; jt[1761] used by FlyBrood_Init_Case4 -> AiScript_Set
	incrom	$134512,$6
Tbl_FlyBrood_vtable:	; class descriptor "FLYBROOD": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$134518,$78
	include "src/f/134590.asm"
	include "src/f/13459E.asm"
	include "src/f/1345A6.asm"
	include "src/f/13463C.asm"
	include "src/f/13478C.asm"
	include "src/f/1347F8.asm"
	include "src/f/13486A.asm"
	include "src/f/1348E8.asm"
	include "src/f/1348F0.asm"
	include "src/f/134906.asm"
	include "src/f/134934.asm"
Sw_134934:	; switch table of sub at $134934: 8 word offsets from Sw_134934-2
	dc.w	FlyBrood_Init_Case0-(Sw_134934-2), FlyBrood_Init_Case1-(Sw_134934-2), loc_134B10-(Sw_134934-2), loc_134B26-(Sw_134934-2)
	dc.w	FlyBrood_Init_Case4-(Sw_134934-2), loc_134BA6-(Sw_134934-2), loc_134BBA-(Sw_134934-2), loc_134BCE-(Sw_134934-2)
	include "src/f/134AE4.asm"
	include "src/f/134AFA.asm"
	include "src/f/134B42.asm"
	include "src/f/134BE6.asm"
	include "src/f/134C3A.asm"
	include "src/f/134C60.asm"
	include "src/f/134D64.asm"
	include "src/f/134E2A.asm"
	include "src/f/134E6A.asm"
	include "src/f/134EC4.asm"
	include "src/f/134F20.asm"
	include "src/f/134F9C.asm"
	include "src/f/134FF2.asm"
	include "src/f/1350FE.asm"
	include "src/f/135134.asm"
	include "src/f/13518A.asm"
	include "src/f/1351EA.asm"
	include "src/f/1352D4.asm"
	include "src/f/13536A.asm"
	include "src/f/135452.asm"
	include "src/f/1354E8.asm"
	include "src/f/13557A.asm"
	include "src/f/135610.asm"
	include "src/f/13570A.asm"
	include "src/f/135794.asm"
Art_FlyBroodSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2E9 of 2EA bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1778] used by FlyBrood_ClassInit, XClone_LoadResources
	incrom	$1357A4,$2EA
Art_FlyBroodNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 1 of 374 bytes used at runtime; read by Nem_DecodeLoop, Nem_Decode, Nem_DecodeLoop_Inline; jt[1779] used by FlyBrood_Init
	incrom	$135A8E,$374
Art_HornetSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 607 of 608 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1780] used by Hornet_ClassInit
	incrom	$135E02,$608
Tbl_HornetAnimIdle:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): hornet idle/fly loop, set by Obj_ChangeAnim at spawn and after each shot; 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[1781] used by Hornet_Init, Hornet_StateShotRecover
	incrom	$13640A,$A
Tbl_HornetAnimAim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): wind-up before each shot (Hornet_StateShotLoop); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1782] used by Hornet_StateShotLoop
	incrom	$136414,$C
Tbl_HornetAnimFire:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): played as the gauss bullet leaves (Hornet_StateFire); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[1783] used by Hornet_StateFire
	incrom	$136420,$C
Tbl_HornetCirclePath:	; 31 word pairs (dx, dy) = velocity steps around a circle (radius 8), then 127,127 end marker; Hornet_StepCirclePath adds (d << 8) >> obj+9C to x/y each step and wraps at 127 (jt 1784)
	incrom	$13642C,$80
Tbl_HornetTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 7 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, XNpc_KnockbackDist, Hornet_Init; jt[1785] used by Hornet_Init
	incrom	$1364AC,$8
	include "src/f/1364B4.asm"
	include "src/f/1364C2.asm"
	include "src/f/1364CA.asm"
	include "src/f/136584.asm"
	include "src/f/136598.asm"
	include "src/f/136642.asm"
	include "src/f/1366A2.asm"
	include "src/f/13679A.asm"
	include "src/f/136816.asm"
	include "src/f/136880.asm"
	include "src/f/1368F4.asm"
	include "src/f/13695C.asm"
	include "src/f/136992.asm"
	include "src/f/1369C8.asm"
	include "src/f/136A32.asm"
	include "src/f/136AA6.asm"
	include "src/f/136B0E.asm"
	include "src/f/136B44.asm"
	include "src/f/136B84.asm"
	include "src/f/136BD4.asm"
	include "src/f/136C28.asm"
	include "src/f/136CCA.asm"
	include "src/f/136D1A.asm"
	include "src/f/136D44.asm"
	include "src/f/136D86.asm"
Sw_136D86:	; switch table of sub at $136D86: 4 word offsets from Sw_136D86-2
	dc.w	Hornet_StatePickPattern_CaseDefault-(Sw_136D86-2), Hornet_StatePickPattern_Case1-(Sw_136D86-2), loc_136DDA-(Sw_136D86-2), loc_136DF0-(Sw_136D86-2)
	include "src/f/136DAE.asm"
	include "src/f/136DC4.asm"
	include "src/f/136E04.asm"
	include "src/f/136E3A.asm"
	include "src/f/136E50.asm"
	include "src/f/136E5C.asm"
	include "src/f/136E7C.asm"
	include "src/f/13707A.asm"
	include "src/f/13709E.asm"
	include "src/f/1370E8.asm"
	include "src/f/137142.asm"
Sw_137142:	; switch table of sub at $137142: 4 word offsets from Sw_137142-2
	dc.w	Hornet_SpawnForDeathbird_CaseDefault-(Sw_137142-2), Hornet_SpawnForDeathbird_CaseDefault-(Sw_137142-2), Hornet_SpawnForDeathbird_Case2-(Sw_137142-2), loc_137200-(Sw_137142-2)
	include "src/f/1371C8.asm"
	include "src/f/1371D8.asm"
	include "src/f/13722C.asm"
Tbl_Hornet_vtable:	; class descriptor "HORNET": word $82 = name offset, long parent (XNPC), 31 method pointers, then the class name string
	incrom	$137252,$8A
Art_HornetBulletSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 63 of 64 bytes used at runtime; read by Spr_PreloadTiles, Nem_BuildCodeTable, Nem_DecodeLoop; jt[1796] used by HornetBullet_ClassInit
	incrom	$1372DC,$64
	include "src/f/137340.asm"
	include "src/f/13734E.asm"
	include "src/f/137356.asm"
	include "src/f/137362.asm"
	include "src/f/137382.asm"
	include "src/f/13745E.asm"
	include "src/f/1375DA.asm"
Tbl_HornetBullet_vtable:	; class descriptor "HORNETBULLET": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$137708,$7C
Art_LaserCannonSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 7A0 of 9C6 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStreamClip; DMA to VRAM $BE60-CD60; jt[1804] used by LaserCannon_Init
	incrom	$137784,$9C6
	include "src/f/13814A.asm"
	include "src/f/138158.asm"
	include "src/f/13816E.asm"
	include "src/f/138176.asm"
	include "src/f/13817E.asm"
	include "src/f/138284.asm"
	include "src/f/1382BA.asm"
	include "src/f/1382E4.asm"
	include "src/f/138318.asm"
	include "src/f/138358.asm"
	include "src/f/13846E.asm"
	include "src/f/1384A4.asm"
	include "src/f/1384F4.asm"
	include "src/f/13852A.asm"
	include "src/f/138556.asm"
	include "src/f/138582.asm"
	include "src/f/1385B8.asm"
Tbl_LaserCannon_vtable:	; class descriptor "LASERCANNON": word $82 = name offset, long parent (XNPC), 31 method pointers, then the class name string
	incrom	$1386B4,$8E
Tbl_LaserCannonAnimExtend:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): frames 0,1,2,3 played before each burst (LaserCannon_StateExtend); jt[1812]
	incrom	$138742,$E
Tbl_LaserCannonAnimRetract:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): frames 3,2,1,0 played after the burst (LaserCannon_StateRetract); jt[1813]
	incrom	$138750,$E
Tbl_LaserCannonTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 4 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, LaserCannon_Init, XNpc_KnockbackDist; jt[1814] used by LaserCannon_Init
	incrom	$13875E,$8
	include "src/f/138766.asm"
	include "src/f/13884A.asm"
	include "src/f/138858.asm"
	include "src/f/138864.asm"
	include "src/f/1388F8.asm"
	include "src/f/138900.asm"
	include "src/f/138908.asm"
	include "src/f/13891A.asm"
	include "src/f/138968.asm"
	include "src/f/1389C2.asm"
Tbl_LineSegKiller_vtable:	; class descriptor "LINESEGKILLER": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$1389CA,$7C
	include "src/f/138A46.asm"
	include "src/f/138A54.asm"
	include "src/f/138AD4.asm"
	include "src/f/138B42.asm"
	include "src/f/138B50.asm"
	include "src/f/138B5C.asm"
	include "src/f/138CD6.asm"
	include "src/f/138DA8.asm"
	include "src/f/138EA2.asm"
	include "src/f/138EDC.asm"
	include "src/f/138F1E.asm"
Sw_138F1E:	; switch table of sub at $138F1E: 4 word offsets from Sw_138F1E-2
	dc.w	MaintRobot_StateChase_Case0-(Sw_138F1E-2), MaintRobot_StateChase_Case1-(Sw_138F1E-2), loc_138FF0-(Sw_138F1E-2), MaintRobot_StateChase_Case3-(Sw_138F1E-2)
	include "src/f/138FBC.asm"
	include "src/f/139038.asm"
	include "src/f/13906A.asm"
	include "src/f/1390B0.asm"
	include "src/f/1390BA.asm"
	include "src/f/139108.asm"
	include "src/f/139162.asm"
	include "src/f/139178.asm"
Tbl_MaintRobotFire_vtable:	; class descriptor "MAINTROBOTFIRE": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$139180,$7E
Tbl_MaintRobot_vtable:	; class descriptor "MAINTROBOT": word $82 = name offset, long parent (XNPC), 31 method pointers, then the class name string
	incrom	$1391FE,$8E
Tbl_MaintRobotAnimMove:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): frames 0-5, +2 word $A; MAINTROBOT while chasing/patrolling and firing (MaintRobot_StateResume, MaintRobot_StateStartVolley); jt[1833]
	incrom	$13928C,$12
Tbl_MaintRobotAnimStop:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6): frames 0-5, +2 word 0; MAINTROBOT halting before a volley (MaintRobot_StateStop); jt[1834]
	incrom	$13929E,$12
Tbl_MaintRobotFireAnim:	; animation script (flags 2, 7 steps: frames 0,1,2,4,5,6,7): MAINTROBOTFIRE burst, Obj_SetAnim in MaintRobotFire_Init; the object Kills itself when it ends; jt[1835]
	incrom	$1392B0,$14
Art_MaintRobotSpr:	; sprite definition (type $18, raw 4bpp tiles) of MAINTROBOT: preloaded by CloneA1/CloneA2_LoadResources into -$1A7E, MaintRobot_Init uses the slot or this def directly; DMA to VRAM $9A80-9F80; jt[1836]
	incrom	$1392C4,$A28
Art_MaintRobotFireSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 540 of 6B2 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_PreloadTiles; DMA to VRAM $CE60-D720; jt[1837] used by MaintRobotFire_Init
	incrom	$139CEC,$6B2
Art_MineNem:	; Nemesis-style compressed 4bpp tiles (Nem_Decode; code table built from pairs by the caller); 397 of 398 bytes used at runtime; read by Nem_DecodeLoop, VDP_FlushDmaQueue; jt[1838] used by Mine_ClassInit
	incrom	$13A39E,$398
	include "src/f/13A736.asm"
	include "src/f/13A744.asm"
	include "src/f/13A75A.asm"
	include "src/f/13A762.asm"
	include "src/f/13A784.asm"
	include "src/f/13A7EA.asm"
Str_MinePoolTag:	; empty C string: Mem_StackAlloc tag of the mine pool (Mine_InitPool)
	incrom	$13A880,$2
	include "src/f/13A882.asm"
	include "src/f/13A8C4.asm"
	include "src/f/13AA02.asm"
	include "src/f/13AB12.asm"
	include "src/f/13AB92.asm"
	include "src/f/13ABCE.asm"
	include "src/f/13AC06.asm"
	include "src/f/13AC40.asm"
	include "src/f/13ACBE.asm"
	include "src/f/13ACF8.asm"
	include "src/f/13AD32.asm"
	include "src/f/13AD6C.asm"
	include "src/f/13ADA6.asm"
Tbl_Mine_vtable:	; class descriptor "MINE": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$13AF1A,$74
Tbl_MineAnimIdle:	; animation script {byte flags, byte 6 steps, word frame delay 5, ..., frames 0-5 from +6}: idle blink of a pooled mine (Mine_StateStart); delays 5,4,3,2,1 in this and the next four scripts = the blink speeds up while it arms; jt[1846]
	incrom	$13AF8E,$12
Tbl_MineAnimArm1:	; animation script, frames 0-5, frame delay 4: first arming step, 20 frames (Mine_StateArm1); jt[1847]
	incrom	$13AFA0,$12
Tbl_MineAnimArm2:	; animation script, frames 0-5, frame delay 3: second arming step, 20 frames (Mine_StateArm2); jt[1848]
	incrom	$13AFB2,$12
Tbl_MineAnimArm3:	; animation script, frames 0-5, frame delay 2: third arming step, 13 frames (Mine_StateArm3); jt[1849]
	incrom	$13AFC4,$12
Tbl_MineAnimArm4:	; sprite definition (type $00): $24-byte header, $14-byte frame records, pieces, tiles; A of 12 bytes used at runtime; read by Mine_PoolUpdate, Mine_StateArm4, VDP_WriteWords; jt[1850] used by Mine_StateArm4
	incrom	$13AFD6,$12
Art_NinjaSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1C2C of 1C2C bytes used at runtime; read by VDP_WriteWords, Spr_PreloadTiles; DMA to VRAM $CE60-D4A0; jt[1851] used by Ninja_Init, SiberiaB1_LoadResources
	incrom	$13AFE8,$1C2C
	include "src/f/13CC14.asm"
	include "src/f/13CC22.asm"
	include "src/f/13CC2E.asm"
	include "src/f/13CC3A.asm"
	include "src/f/13CC90.asm"
	include "src/f/13CE68.asm"
	include "src/f/13CF6A.asm"
	include "src/f/13D1CE.asm"
	include "src/f/13D260.asm"
	include "src/f/13D2A0.asm"
	include "src/f/13D2F4.asm"
	include "src/f/13D344.asm"
	include "src/f/13D424.asm"
	include "src/f/13D46A.asm"
	include "src/f/13D4FE.asm"
	include "src/f/13D574.asm"
	include "src/f/13D60C.asm"
	include "src/f/13D6B6.asm"
	include "src/f/13D716.asm"
	include "src/f/13D786.asm"
	include "src/f/13D7F6.asm"
Tbl_Ninja_vtable:	; class descriptor "NINJA": word $82 = name offset, long parent (BIONPC), 31 method pointers, then the class name string
	incrom	$13D7FE,$88
Tbl_NinjaAnimIdle:	; animation script {byte flags 0 (loop), byte 2 steps, word delay 8, ..., frames 0,1}: NINJA standing (Init, Ninja_ActFacePlayer/IdleAnim/Wait/Pause30); jt[1867]
	incrom	$13D886,$A
Tbl_NinjaAnimAttack:	; animation script {flags 2 (once), 3 steps, delay 8, frames 2,3,4}: NINJA attack with sound $AC (Ninja_ActAttack); jt[1868]
	incrom	$13D890,$C
Tbl_NinjaAnimCrouch:	; animation script {flags 2 (once), 1 step, delay 8, frame 5}: NINJA take-off pose (Ninja_ActLeap); jt[1869]
	incrom	$13D89C,$8
Tbl_NinjaAnimAirborne:	; animation script {flags 0 (loop), 4 steps, delay 4, frames 5-8}: NINJA in the air (Ninja_StateLeapAir); Ninja_Move clips to segments only while this is the current animation; jt[1870]
	incrom	$13D8A4,$E
Tbl_NinjaAnimLand:	; animation script {flags 2 (once), 2 steps, delay 8, frames 1,2}: NINJA landing (Ninja_StateWaitLanding); jt[1871]
	incrom	$13D8B2,$A
Tbl_NinjaIntroScript:	; AI script (AiScript_Set in Ninja_Init, jt[1872]): word count 2, jmp Ninja_ActWait, then the thunk Ninja_ScrStepStartCombat (jmp Ninja_ActStartCombat) that follows
	incrom	$13D8BC,$6
	include "src/f/13D8C2.asm"
Tbl_NinjaCombatScript:	; AI script (AiScript_Set): word count 7, then jmp thunks Ninja_ScrStepFacePlayer, leap, face, attack, check-leave, idle anim, wait; set by Ninja_ActStartCombat (jt[1873]); the intro script at $13D8BC (count 2: wait, start combat) is jt[1872]
	incrom	$13D8C6,$1
	incrom	$13D8C7,$1
	include "src/f/13D8C8.asm"
	include "src/f/13D8D0.asm"
Tbl_NinjaLeaveScript:	; AI script: word count 2, thunks jmp Ninja_ActLeap, jmp Ninja_ActPause30; installed by Ninja_ActCheckLeave when the +$A2 timer runs out; Ninja_Deactivate removes a ninja running it for good (sub_1F66F0); jt[1874]
	incrom	$13D8E4,$A
Tbl_NinjaTakeDamage_Hurt:	; table read by XNpc_TakeDamage_Hurt; 6 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, XNpc_KnockbackDist, Ninja_Init; jt[1875] used by Ninja_Init
	incrom	$13D8EE,$8
	include "src/f/13D8F6.asm"
	include "src/f/13D954.asm"
	include "src/f/13DA0C.asm"
	include "src/f/13DA50.asm"
	include "src/f/13DA80.asm"
	include "src/f/13DBD8.asm"
	include "src/f/13DCB8.asm"
	include "src/f/13DE36.asm"
	include "src/f/13DE4A.asm"
	include "src/f/13DE5E.asm"
	include "src/f/13DF16.asm"
	include "src/f/13DF44.asm"
	include "src/f/13DF74.asm"
	include "src/f/13E14A.asm"
	include "src/f/13E23E.asm"
	include "src/f/13E30E.asm"
	include "src/f/13E36E.asm"
	include "src/f/13E426.asm"
	include "src/f/13E490.asm"
	include "src/f/13E4EA.asm"
	include "src/f/13E6EE.asm"
	include "src/f/13E808.asm"
	include "src/f/13E928.asm"
	include "src/f/13EA46.asm"
	include "src/f/13EBB6.asm"
	include "src/f/13EC26.asm"
	include "src/f/13EE20.asm"
	include "src/f/13EEFA.asm"
	include "src/f/13EFA0.asm"
	include "src/f/13F04A.asm"
	include "src/f/13F058.asm"
	include "src/f/13F064.asm"
	include "src/f/13F070.asm"
	include "src/f/13F0F0.asm"
	include "src/f/13F114.asm"
Sw_13F114:	; switch table of sub at $13F114: 6 word offsets from Sw_13F114-2
	dc.w	loc_13F1AE-(Sw_13F114-2), loc_13F19A-(Sw_13F114-2), loc_13F186-(Sw_13F114-2), loc_13F172-(Sw_13F114-2)
	dc.w	loc_13F15E-(Sw_13F114-2), loc_13F14A-(Sw_13F114-2)
	include "src/f/13F14A.asm"
	include "src/f/13F1AE.asm"
	include "src/f/13F1DC.asm"
	include "src/f/13F1EC.asm"
	include "src/f/13F1FC.asm"
	include "src/f/13F20C.asm"
	include "src/f/13F21C.asm"
	include "src/f/13F24C.asm"
	include "src/f/13F282.asm"
Tbl_Pop_vtable:	; class descriptor "POP": word $6E = name offset, long parent (ACTOR), 26 method pointers, then the class name string
	incrom	$13F28A,$72
	incrom	$13F2FC,$6C
Tbl_13F368:	; format not established; never read in the corpus; jt[1891] used by sub_13DCB8
	incrom	$13F368,$6C
	incrom	$13F3D4,$A0
	include "src/f/13F474.asm"
	include "src/f/13F486.asm"
	include "src/f/13F498.asm"
	include "src/f/13F4D4.asm"
Str_Empty_13F588:	; C string "" (used by sub_13F4D4)
	incrom	$13F588,$2
	include "src/f/13F58A.asm"
	include "src/f/13F728.asm"
Art_SpaceB1Spr2:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 141 of 142 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, Nem_BuildCodeTable; jt[1898] used by SpaceB1_LoadResources
	incrom	$13F946,$142
	include "src/f/13FA88.asm"
	include "src/f/13FA96.asm"
	include "src/f/13FAA2.asm"
	include "src/f/13FBA4.asm"
	include "src/f/13FCC2.asm"
	include "src/f/13FDA2.asm"
	include "src/f/13FE36.asm"
	include "src/f/13FEB6.asm"
	include "src/f/13FF2C.asm"
	include "src/f/13FF5E.asm"
	include "src/f/14004A.asm"
	include "src/f/1400AA.asm"
	include "src/f/1400D6.asm"
Tbl_SparkCallSlot5A:	; table read by ClassList_CallSlot5A; C of 74 bytes used at runtime; read by ClassList_CallSlot5A, ClassList_InitAll, ClassList_CallSlot62; jt[1906] used by Spark_Draw, Spark_Init
	incrom	$1400DE,$74
Tbl_Anim_140152:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1907] used by sub_13FEB6 -> Obj_SetAnim
	incrom	$140152,$C
Tbl_SparkMove:	; format not established; never read in the corpus; jt[1908] used by Spark_Move
	incrom	$14015E,$30
Art_Spr_14018E:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1531 of 1532 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles; jt[1909] used by sub_1416CE
	incrom	$14018E,$1532
	include "src/f/1416C0.asm"
	include "src/f/1416CE.asm"
	include "src/f/1416EA.asm"
	include "src/f/1418A4.asm"
	include "src/f/1418FA.asm"
	include "src/f/14199C.asm"
	include "src/f/1419E0.asm"
	include "src/f/141ADC.asm"
	include "src/f/141B3C.asm"
	include "src/f/141B72.asm"
	include "src/f/141CBC.asm"
	include "src/f/141CCA.asm"
	include "src/f/141D46.asm"
	include "src/f/141DA8.asm"
	include "src/f/141DE8.asm"
	include "src/f/141EEE.asm"
	include "src/f/141F18.asm"
	include "src/f/142008.asm"
	include "src/f/14205E.asm"
	incrom	$1420DE,$88
Lvl_Data_142166:	; level data read by Level_FrameLoop; 68 of 8C bytes used at runtime; read by Level_FrameLoop, Actor_Update, Actor_New; jt[1926] used by sub_141CCA, sub_141DA8
	incrom	$142166,$8C
Tbl_Anim_1421F2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1927] used by sub_1416EA
	incrom	$1421F2,$8
Tbl_Anim_1421FA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1928] used by sub_141DE8, sub_141F18, sub_142008
	incrom	$1421FA,$10
Tbl_Anim_14220A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, sub_141ADC; jt[1929] used by sub_141B3C
	incrom	$14220A,$12
	incrom	$14221C,$2
	include "src/f/14221E.asm"
Tbl_AiScript_14222A:	; word $0000 (2 bytes), not a string: reached only via jt[1931] used by sub_141DE8 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$14222A,$1
	incrom	$14222B,$1
	include "src/f/14222C.asm"
Tbl_AiScript_142238:	; word $0000 (2 bytes), not a string: reached only via jt[1932] used by sub_141DA8 -> sub_1F66F0, sub_141F18 -> AiScript_Set (e.g. an empty list/script count)
	incrom	$142238,$1
	incrom	$142239,$1
	include "src/f/14223A.asm"
Tbl_TakeDamage_Hurt_142246:	; table read by XNpc_TakeDamage_Hurt; 5 of 8 bytes used at runtime; read by XNpc_TakeDamage_Hurt, sub_1416EA, XNpc_KnockbackDist; jt[1933] used by sub_1416EA
	incrom	$142246,$8
	include "src/f/14224E.asm"
	include "src/f/14225C.asm"
	include "src/f/1422A0.asm"
	include "src/f/1422A8.asm"
	include "src/f/142322.asm"
	include "src/f/1423D6.asm"
	include "src/f/14241C.asm"
	include "src/f/142446.asm"
	include "src/f/142490.asm"
	include "src/f/1424DA.asm"
	include "src/f/142524.asm"
	include "src/f/142562.asm"
	include "src/f/1425A0.asm"
	include "src/f/1425DE.asm"
	include "src/f/1426FE.asm"
	include "src/f/14278E.asm"
	include "src/f/14280A.asm"
	include "src/f/14286A.asm"
	include "src/f/1428E6.asm"
	include "src/f/142946.asm"
	include "src/f/1429A6.asm"
	include "src/f/142A22.asm"
	include "src/f/142A82.asm"
	include "src/f/142AA6.asm"
	include "src/f/142ACA.asm"
	include "src/f/142AE0.asm"
Str_Empty_142B52:	; C string "" (used by sub_142AE0)
	incrom	$142B52,$2
	include "src/f/142B54.asm"
	include "src/f/142CD6.asm"
Sw_142CD6:	; switch table of sub at $142CD6: 9 word offsets from Sw_142CD6-2
	dc.w	loc_142F0C-(Sw_142CD6-2), loc_142F14-(Sw_142CD6-2), loc_142F1C-(Sw_142CD6-2), loc_142F2A-(Sw_142CD6-2)
	dc.w	loc_142F38-(Sw_142CD6-2), loc_142F46-(Sw_142CD6-2), loc_142F54-(Sw_142CD6-2), loc_142F5C-(Sw_142CD6-2)
	dc.w	loc_142F64-(Sw_142CD6-2)
	include "src/f/142F0C.asm"
	include "src/f/142F2A.asm"
	include "src/f/142F38.asm"
	include "src/f/142F5C.asm"
	include "src/f/142F64.asm"
	include "src/f/142F70.asm"
	include "src/f/14304E.asm"
	include "src/f/143082.asm"
Sw_143082:	; switch table of sub at $143082: 9 word offsets from Sw_143082-2
	dc.w	loc_1430E4-(Sw_143082-2), loc_143100-(Sw_143082-2), loc_14311A-(Sw_143082-2), loc_143136-(Sw_143082-2)
	dc.w	loc_143152-(Sw_143082-2), loc_14316A-(Sw_143082-2), loc_143184-(Sw_143082-2), loc_14319E-(Sw_143082-2)
	dc.w	loc_1431B6-(Sw_143082-2)
	include "src/f/1430E4.asm"
	include "src/f/143136.asm"
	include "src/f/143152.asm"
	include "src/f/14319E.asm"
	include "src/f/1431B6.asm"
	include "src/f/1431D0.asm"
	include "src/f/1431D6.asm"
	include "src/f/14321A.asm"
Lvl_Data_143224:	; level data read by Level_FrameLoop; 54 of 7E bytes used at runtime; read by Level_FrameLoop, sub_142B54, Actor_New; jt[1939] used by sub_142B54
	incrom	$143224,$7E
Tbl_Anim_1432A2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[1940] used by sub_142446
	incrom	$1432A2,$A
Tbl_Anim_1432AC:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1941] used by sub_142490, sub_142B54
	incrom	$1432AC,$A
Tbl_Anim_1432B6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1942] used by sub_1424DA
	incrom	$1432B6,$A
Tbl_Anim_1432C0:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 3 of 10 bytes used at runtime; read by Anim_ApplyStep; jt[1943] used by sub_142322
	incrom	$1432C0,$10
Tbl_Anim_1432D0:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1944] used by sub_142524
	incrom	$1432D0,$A
Tbl_Anim_1432DA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1945] used by sub_142562
	incrom	$1432DA,$A
Tbl_Anim_1432E4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[1946] used by sub_1425A0
	incrom	$1432E4,$A
Tbl_Anim_1432EE:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[1947] used by sub_142322 -> Obj_ChangeAnim
	incrom	$1432EE,$10
Art_Spr_1432FE:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1040 of 12D4 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $9A80-C9A0; jt[1948] used by sub_142B54
	incrom	$1432FE,$12D4
Art_Spr_1445D2:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1A1 of 1A2 bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop, Nem_BuildCodeTable; jt[1949] used by sub_142AE0
	incrom	$1445D2,$1A2
	include "src/f/144774.asm"
	include "src/f/1449CC.asm"
	include "src/f/1449DA.asm"
	include "src/f/1449E6.asm"
	include "src/f/144AE2.asm"
	include "src/f/144C76.asm"
	include "src/f/144CAA.asm"
	include "src/f/144CE2.asm"
	include "src/f/144CF0.asm"
	include "src/f/144D50.asm"
	include "src/f/144D88.asm"
Lvl_Data_144D90:	; level data read by Level_FrameLoop; 48 of 78 bytes used at runtime; read by Level_FrameLoop, sub_144AE2, Actor_New; jt[1959] used by sub_1449E6, sub_144C76, sub_144CAA
	incrom	$144D90,$78
Tbl_144E08:	; format not established; never read in the corpus; jt[1960] used by sub_144CF0, sub_144D50
	incrom	$144E08,$7E
Tbl_144E86:	; format not established; never read in the corpus; jt[1961] used by sub_144774
	incrom	$144E86,$6C
Tbl_144EF2:	; format not established; never read in the corpus; jt[1962] used by sub_144774
	incrom	$144EF2,$3C
	incrom	$144F2E,$C8
Art_Spr_144FF6:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 400 of 86C bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $D6A0-DAA0; jt[1964] used by sub_1449E6
	incrom	$144FF6,$86C
Art_EvilMagnetoSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 57A0 of 82B4 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $7BA0-ABA0; jt[1965] used by EvilMagneto_Init, MagnetoBoss_Init, Magneto_SelectSpriteDef
	incrom	$145862,$82B4
Art_Spr_14DB16:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 1500 of 1E88 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStreamClip, Spr_UploadFrame; DMA to VRAM $81C0-F7E0; jt[1966] used by Scene_AllocCommonVram, sub_1581CA
	incrom	$14DB16,$1E88
Art_MagnetoBossSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 29A0 of 334C bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $7BA0-8AC0; jt[1967] used by MagnetoBoss_Init, Player_CalcMaxTiles, sub_1599CC
	incrom	$14F99E,$334C
Art_MagnetoBossSpr3:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2720 of 4EBC bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStreamClip, Spr_UploadFrame; DMA to VRAM $7DA0-AAA0; jt[1968] used by MagnetoBoss_Init, Player_CalcMaxTiles, sub_1599CC
	incrom	$152CEA,$4EBC
	include "src/f/157BA6.asm"
	include "src/f/157BB4.asm"
	include "src/f/157BC2.asm"
	include "src/f/157BD2.asm"
	include "src/f/157C22.asm"
	include "src/f/157C5C.asm"
	include "src/f/157CB2.asm"
	include "src/f/157CFE.asm"
	include "src/f/157D5E.asm"
	include "src/f/157E64.asm"
	include "src/f/157ED6.asm"
	include "src/f/1580B2.asm"
	include "src/f/1581CA.asm"
	include "src/f/158260.asm"
	include "src/f/1582B6.asm"
	include "src/f/1583D6.asm"
	include "src/f/158474.asm"
	include "src/f/158536.asm"
	include "src/f/158610.asm"
	include "src/f/158876.asm"
	include "src/f/158992.asm"
	include "src/f/158A60.asm"
	include "src/f/158AC0.asm"
	include "src/f/158AF8.asm"
	include "src/f/158C0E.asm"
	include "src/f/158DD4.asm"
	include "src/f/158E32.asm"
	include "src/f/158E78.asm"
	include "src/f/158EEE.asm"
	include "src/f/158F32.asm"
	include "src/f/158F68.asm"
	include "src/f/158F92.asm"
	include "src/f/158FE4.asm"
	include "src/f/159030.asm"
	include "src/f/159092.asm"
Sw_159092:	; switch table of sub at $159092: 10 word offsets from Sw_159092-2
	dc.w	loc_1590C6-(Sw_159092-2), loc_1590D0-(Sw_159092-2), loc_1590DA-(Sw_159092-2), loc_1590E4-(Sw_159092-2)
	dc.w	loc_1590EE-(Sw_159092-2), loc_1590F8-(Sw_159092-2), loc_159102-(Sw_159092-2), loc_15910C-(Sw_159092-2)
	dc.w	loc_159116-(Sw_159092-2), loc_159120-(Sw_159092-2)
	include "src/f/1590C6.asm"
	include "src/f/1590DA.asm"
	include "src/f/1590E4.asm"
	include "src/f/15910C.asm"
	include "src/f/159120.asm"
	include "src/f/15912A.asm"
	include "src/f/15912E.asm"
	include "src/f/159130.asm"
	include "src/f/159138.asm"
Sw_159138:	; switch table of sub at $159138: 10 word offsets from Sw_159138-2
	dc.w	loc_15916C-(Sw_159138-2), loc_159176-(Sw_159138-2), loc_159180-(Sw_159138-2), loc_15918A-(Sw_159138-2)
	dc.w	loc_159194-(Sw_159138-2), loc_15919E-(Sw_159138-2), loc_1591A8-(Sw_159138-2), loc_1591B2-(Sw_159138-2)
	dc.w	loc_1591BC-(Sw_159138-2), loc_1591C6-(Sw_159138-2)
	include "src/f/15916C.asm"
	include "src/f/159180.asm"
	include "src/f/15918A.asm"
	include "src/f/1591B2.asm"
	include "src/f/1591C6.asm"
	include "src/f/1591D0.asm"
	include "src/f/1591D4.asm"
	include "src/f/1591D6.asm"
	include "src/f/1591DE.asm"
Sw_1591DE:	; switch table of sub at $1591DE: 8 word offsets from Sw_1591DE-2
	dc.w	loc_15920C-(Sw_1591DE-2), loc_159216-(Sw_1591DE-2), loc_159220-(Sw_1591DE-2), loc_15922A-(Sw_1591DE-2)
	dc.w	loc_159234-(Sw_1591DE-2), loc_15923E-(Sw_1591DE-2), loc_159248-(Sw_1591DE-2), loc_159252-(Sw_1591DE-2)
	include "src/f/15920C.asm"
	include "src/f/159216.asm"
	include "src/f/15922A.asm"
	include "src/f/159248.asm"
	include "src/f/159252.asm"
	include "src/f/15925C.asm"
	include "src/f/159260.asm"
	include "src/f/159262.asm"
	include "src/f/15926A.asm"
Sw_15926A:	; switch table of sub at $15926A: 8 word offsets from Sw_15926A-2
	dc.w	loc_159298-(Sw_15926A-2), loc_1592A2-(Sw_15926A-2), loc_1592AC-(Sw_15926A-2), loc_1592B6-(Sw_15926A-2)
	dc.w	loc_1592C0-(Sw_15926A-2), loc_1592CA-(Sw_15926A-2), loc_1592D4-(Sw_15926A-2), loc_1592DE-(Sw_15926A-2)
	include "src/f/159298.asm"
	include "src/f/1592A2.asm"
	include "src/f/1592B6.asm"
	include "src/f/1592D4.asm"
	include "src/f/1592DE.asm"
	include "src/f/1592E8.asm"
	include "src/f/1592EC.asm"
	include "src/f/1592EE.asm"
	include "src/f/1592F6.asm"
	include "src/f/159354.asm"
Sw_159354:	; switch table of sub at $159354: 10 word offsets from Sw_159354-2
	dc.w	loc_159398-(Sw_159354-2), loc_1593D4-(Sw_159354-2), loc_1593F2-(Sw_159354-2), loc_159410-(Sw_159354-2)
	dc.w	loc_15942E-(Sw_159354-2), loc_15944A-(Sw_159354-2), loc_159466-(Sw_159354-2), loc_159482-(Sw_159354-2)
	dc.w	loc_15949C-(Sw_159354-2), loc_1593B6-(Sw_159354-2)
	include "src/f/159398.asm"
	include "src/f/1593B6.asm"
	include "src/f/1593D4.asm"
	include "src/f/1593F2.asm"
	include "src/f/159410.asm"
	include "src/f/159482.asm"
	include "src/f/1594B6.asm"
	include "src/f/1594C0.asm"
Sw_1594C0:	; switch table of sub at $1594C0: 8 word offsets from Sw_1594C0-2
	dc.w	loc_159502-(Sw_1594C0-2), loc_159520-(Sw_1594C0-2), loc_15953E-(Sw_1594C0-2), loc_15955C-(Sw_1594C0-2)
	dc.w	loc_159578-(Sw_1594C0-2), loc_159594-(Sw_1594C0-2), loc_1595B0-(Sw_1594C0-2), loc_1595CA-(Sw_1594C0-2)
	include "src/f/159502.asm"
	include "src/f/1595B0.asm"
	include "src/f/1595CA.asm"
	include "src/f/1595E4.asm"
	include "src/f/1595EE.asm"
	include "src/f/1597BE.asm"
	include "src/f/15980C.asm"
Sw_15980C:	; switch table of sub at $15980C: 8 word offsets from Sw_15980C-2
	dc.w	loc_15984E-(Sw_15980C-2), loc_159864-(Sw_15980C-2), loc_159878-(Sw_15980C-2), loc_15988C-(Sw_15980C-2)
	dc.w	loc_1598A0-(Sw_15980C-2), loc_1598B4-(Sw_15980C-2), loc_1598C8-(Sw_15980C-2), loc_1598DA-(Sw_15980C-2)
	include "src/f/15984E.asm"
	include "src/f/159864.asm"
	include "src/f/15988C.asm"
	include "src/f/1598C8.asm"
	include "src/f/1598DA.asm"
	include "src/f/1598EC.asm"
	include "src/f/1598F6.asm"
	include "src/f/1599CC.asm"
	include "src/f/159A06.asm"
	include "src/f/159A46.asm"
	incrom	$159AB4,$F4
Tbl_ApocalypsePostLoadVram:	; table read by Scene_PostLoadVram; 20 of 20 bytes used at runtime; read by Scene_PostLoadVram; jt[1994] used by Apocalypse_ClassInit, Cerebro_Run, Failure_RunScene
	incrom	$159BA8,$20
Tbl_PostLoadVram_159BC8:	; table read by Scene_PostLoadVram; 20 of 20 bytes used at runtime; read by Scene_PostLoadVram; jt[1995] used by Scene_PostLoadVram
	incrom	$159BC8,$20
	incrom	$159BE8,$2E4
	include "src/f/159ECC.asm"
	include "src/f/159FB8.asm"
	include "src/f/159FD6.asm"
	include "src/f/15A0AC.asm"
	include "src/f/15A168.asm"
	include "src/f/15A19C.asm"
	include "src/f/15A6DE.asm"
	include "src/f/15A6FC.asm"
	include "src/f/15A79C.asm"
	include "src/f/15A7C8.asm"
	include "src/f/15A82A.asm"
	include "src/f/15A8FE.asm"
	include "src/f/15AA20.asm"
	include "src/f/15AB44.asm"
	include "src/f/15AC68.asm"
	include "src/f/15AD8A.asm"
	include "src/f/15ADEC.asm"
	include "src/f/15AE48.asm"
	include "src/f/15B0D0.asm"
	include "src/f/15B0E6.asm"
	include "src/f/15B18A.asm"
Tbl_Anim_15B1D6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2021] used by Blast_StateStart
	incrom	$15B1D6,$E
Tbl_Anim_15B1E4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 14 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2022] used by Blast_StateLaunch
	incrom	$15B1E4,$16
Tbl_Anim_15B1FA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2023] used by Blast_StateStick
	incrom	$15B1FA,$C
Tbl_ClosedBarrierAnim:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2024] used by ClosedBarrier_Init -> Obj_SetAnim, Barrier_Close -> Obj_SetAnim
	incrom	$15B206,$A
Art_BioNpcSpr:	; sprite definition (type $0F): $24-byte header, $14-byte frame records, pieces, tiles; 10 of 10 bytes used at runtime; read by sub_15AE48, Spr_PreloadTiles, Nem_BuildCodeTable; jt[2025] used by BioNpc_DrawStunned, Blast_Draw
	incrom	$15B210,$10
Art_BlastSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; D3 of D4 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_PreloadTiles, Nem_BuildCodeTable; jt[2026] used by Blast_ClassInit, sub_1B9D68
	incrom	$15B220,$D4
Art_HUDTiles:	; uncompressed 4bpp tiles DMA'd to VRAM; 400 of 400 bytes used at runtime; read by VDP_FlushDmaQueue, Nem_DecodeLoop; DMA to VRAM $FA00-FF00; jt[2027] used by HUD_Redraw
	incrom	$15B2F4,$400
Art_HUDTiles2:	; uncompressed 4bpp tiles DMA'd to VRAM; 500 of 500 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $FC80-10000; jt[2028] used by HUD_UpdateHealthBars
	incrom	$15B6F4,$500
Art_HUDTiles3:	; uncompressed 4bpp tiles DMA'd to VRAM; 500 of 500 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $FC00-10000; jt[2029] used by HUD_UpdateHealthBars
	incrom	$15BBF4,$500
Art_HUDTiles4:	; uncompressed 4bpp tiles DMA'd to VRAM; 108 of 108 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $FA00-FB40; jt[2030] used by HUD_Redraw
	incrom	$15C0F4,$108
	include "src/f/15C1FC.asm"
Art_Tiles_15C21A:	; uncompressed 4bpp tiles DMA'd to VRAM; 8 of 8 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $FA00-FB40
	incrom	$15C21A,$8
	include "src/f/15C222.asm"
	include "src/f/15C22E.asm"
Art_Tiles_15C230:	; uncompressed 4bpp tiles DMA'd to VRAM; 4 of 6 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $FA00-FB40
	incrom	$15C230,$6
	include "src/f/15C236.asm"
	incrom	$15C23E,$8
	include "src/f/15C246.asm"
	include "src/f/15C252.asm"
	incrom	$15C254,$8
	include "src/f/15C25C.asm"
	incrom	$15C28E,$1E
	include "src/f/15C2AC.asm"
	include "src/f/15C306.asm"
	include "src/f/15C32E.asm"
	include "src/f/15C39A.asm"
	include "src/f/15C41C.asm"
	include "src/f/15C42A.asm"
Sw_15C42A:	; switch table of sub at $15C42A: 9 word offsets from Sw_15C42A-2
	dc.w	loc_15C49E-(Sw_15C42A-2), loc_15C4BA-(Sw_15C42A-2), loc_15C4E2-(Sw_15C42A-2), loc_15C4FE-(Sw_15C42A-2)
	dc.w	loc_15C51A-(Sw_15C42A-2), loc_15C564-(Sw_15C42A-2), loc_15C57E-(Sw_15C42A-2), loc_15C598-(Sw_15C42A-2)
	dc.w	loc_15C5B2-(Sw_15C42A-2)
	include "src/f/15C49E.asm"
	include "src/f/15C5D6.asm"
	include "src/f/15CA6C.asm"
	include "src/f/15CAA4.asm"
	include "src/f/15CB34.asm"
	include "src/f/15CECC.asm"
	include "src/f/15D00E.asm"
	include "src/f/15D7D8.asm"
	include "src/f/15D7F8.asm"
	include "src/f/15D858.asm"
	include "src/f/15D8CC.asm"
	include "src/f/15D92C.asm"
	include "src/f/15D93A.asm"
	include "src/f/15D970.asm"
	include "src/f/15D978.asm"
	include "src/f/15D980.asm"
	include "src/f/15D988.asm"
Str_ObjPoolTags:	; two empty C strings: Mem_StackAlloc tags of the object storage ($15DA34) and object pointer table ($15DA36) in Obj_AllocPool
	incrom	$15DA34,$2
Str_ObjPoolTagPtrs:	; empty C string: Mem_StackAlloc tag of the object pointer table (Obj_AllocPool)
	incrom	$15DA36,$2
	include "src/f/15DA38.asm"
	include "src/f/15DA90.asm"
	include "src/f/15DAD8.asm"
	include "src/f/15DB26.asm"
	include "src/f/15DB8E.asm"
	include "src/f/15DBF2.asm"
	include "src/f/15DC78.asm"
	include "src/f/15DCC4.asm"
Str_Undefined:	; C string "UNDEFINED" (used by Actor_Init)
	incrom	$15DE14,$A
	include "src/f/15DE1E.asm"
	include "src/f/15DEAE.asm"
	include "src/f/15DEEE.asm"
	include "src/f/15DF2A.asm"
	include "src/f/15DF66.asm"
	include "src/f/15DFA8.asm"
	include "src/f/15E18C.asm"
	include "src/f/15E222.asm"
	include "src/f/15E3D4.asm"
	include "src/f/15E410.asm"
	include "src/f/15E452.asm"
	include "src/f/15E55A.asm"
	include "src/f/15E630.asm"
	include "src/f/15E680.asm"
	include "src/f/15E6B2.asm"
	include "src/f/15E76C.asm"
	include "src/f/15E7EA.asm"
	include "src/f/15E7FA.asm"
	include "src/f/15EA78.asm"
	include "src/f/15EAC8.asm"
	include "src/f/15EAD0.asm"
	include "src/f/15EAE2.asm"
	include "src/f/15EB78.asm"
	include "src/f/15EC0E.asm"
	include "src/f/15ECB2.asm"
	include "src/f/15ED56.asm"
	include "src/f/15EDCC.asm"
	include "src/f/15EE48.asm"
	include "src/f/15EF90.asm"
	include "src/f/15F036.asm"
	include "src/f/15F0DC.asm"
	include "src/f/15F16A.asm"
	include "src/f/15F1F8.asm"
	include "src/f/15F37C.asm"
	include "src/f/15F3F0.asm"
Tbl_NibbleFill:	; 16 longs: colour n (0-15) repeated in all 8 pixels of a 4bpp tile row ($00000000, $11111111 ... $FFFFFFFF); decoder Nem_DecodeLoop fills runs with it
	incrom	$15F456,$40
Tbl_NibbleMaskLow:	; 9 longs: mask of the low k nibbles, k = 0..8 ($0, $F, $FF ... $FFFFFFFF); decoder Nem_DecodeLoop
	incrom	$15F496,$24
	include "src/f/15F4BA.asm"
Tbl_NibbleMaskAt:	; 9 longs: single-nibble mask at nibble position k-1 ($0, $F, $F0 ... $F0000000); decoder Nem_DecodeLoop_Row
	incrom	$15F51C,$24
	include "src/f/15F540.asm"
	include "src/f/15F566.asm"
	include "src/f/15F572.asm"
	include "src/f/15F57E.asm"
	include "src/f/15F5CA.asm"
	include "src/f/15F5FC.asm"
	include "src/f/15F65C.asm"
	include "src/f/15F6F0.asm"
	incrom	$15F720,$20
	include "src/f/15F740.asm"
	include "src/f/15F78E.asm"
	include "src/f/15F8B6.asm"
	include "src/f/15F954.asm"
	include "src/f/15F95C.asm"
Str_Empty_15FA2A:	; C string "" (used by Spawn_InitRecords)
Str_SpawnRecTag:	; empty C string: Mem_StackAlloc tag of the spawn records (Spawn_InitRecords)
	incrom	$15FA2A,$2
	include "src/f/15FA2C.asm"
	include "src/f/15FA7A.asm"
	include "src/f/15FBAE.asm"
	incrom	$15FBBE,$B2
	include "src/f/15FC70.asm"
	include "src/f/15FC84.asm"
	include "src/f/15FC9A.asm"
	include "src/f/15FCD8.asm"
	include "src/f/15FD0E.asm"
	include "src/f/1600A0.asm"
	include "src/f/1600AA.asm"
Tbl_RandXor1:	; words: Rand_Next XOR table 1, indexed from $1D0 down by 2 (233 entries used of 241)
	incrom	$1600CA,$1E2
	include "src/f/1602AC.asm"
Tbl_RandXor2:	; words: Rand_Next XOR table 2, indexed from $12C down by 2 (151 entries; the top 8 run past the table into Rand_Next_Mix3 code bytes)
	incrom	$1602C8,$11E
	include "src/f/1603E6.asm"
Tbl_RandXor3:	; words: Rand_Next XOR table 3, indexed from $FC down by 2 (127 entries)
	incrom	$160402,$FE
	include "src/f/160500.asm"
	include "src/f/160512.asm"
	include "src/f/160550.asm"
	include "src/f/160594.asm"
	include "src/f/160642.asm"
	include "src/f/1606F4.asm"
	include "src/f/1607A0.asm"
	include "src/f/1607AA.asm"
Str_Empty_1607E6:	; C string "" (used by Cam_New)
	incrom	$1607E6,$2
	include "src/f/1607E8.asm"
	include "src/f/160996.asm"
	include "src/f/1609A8.asm"
	include "src/f/1609CC.asm"
	include "src/f/160A18.asm"
	include "src/f/160ACA.asm"
	include "src/f/160B0E.asm"
	include "src/f/160BB0.asm"
	include "src/f/160C3E.asm"
	include "src/f/160D06.asm"
	include "src/f/160DCE.asm"
	include "src/f/160E0E.asm"
	include "src/f/160E4E.asm"
	include "src/f/160E60.asm"
	include "src/f/160E72.asm"
	include "src/f/160F36.asm"
	include "src/f/160FCC.asm"
	include "src/f/160FDE.asm"
	include "src/f/160FFE.asm"
	include "src/f/16103C.asm"
	include "src/f/16118E.asm"
	include "src/f/161222.asm"
	include "src/f/16136E.asm"
	include "src/f/161744.asm"
	include "src/f/161816.asm"
Snd_1618BC:	; sound data; never read in the corpus; jt[2111] used by Game_Init -> Snd_Init
	incrom	$1618BC,$2336
Snd_163BF2:	; sound data; never read in the corpus; jt[2112] used by Game_Init -> Snd_Init
	incrom	$163BF2,$5CC
Snd_1641BE:	; sound data; never read in the corpus; jt[2113] used by Game_Init -> Snd_Init
	incrom	$1641BE,$176EC
Snd_17B8AA:	; sound data; never read in the corpus; jt[2114] used by Game_Init -> Snd_Init
	incrom	$17B8AA,$6DE6
Art_Spr_182690:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 180 of 2A2 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $6940-9600; jt[2115] used by Scene_AllocCommonVram
	incrom	$182690,$2A2
Tbl_Anim_182932:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1E of 22 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2116] used by loc_06757C
	incrom	$182932,$22
Tbl_Anim_182954:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 3E of 48 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2117] used by loc_06745C
	incrom	$182954,$48
Tbl_Anim_18299C:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2118] used by Beast_AirAttackDown
	incrom	$18299C,$A
Tbl_Anim_1829A6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2119] used by Beast_DiveImpact
	incrom	$1829A6,$C
Tbl_Anim_1829B2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2120] used by Beast_AirSpecial
	incrom	$1829B2,$C
Tbl_Anim_1829BE:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2121] used by Beast_StateCling
	incrom	$1829BE,$12
Tbl_Anim_1829D0:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2122] used by Beast_GroundSpecial
	incrom	$1829D0,$A
Tbl_Anim_1829DA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2123] used by Beast_StateStomp
	incrom	$1829DA,$C
Tbl_EvilBeastAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2124] used by EvilBeast_ActThrow, Beast_StateStomp
	incrom	$1829E6,$A
Tbl_EvilBeastAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2125] used by EvilBeast_StateThrow, Beast_StateStompEnd
	incrom	$1829F0,$8
Tbl_Anim_1829F8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of 1E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2126] used by Beast_StateRoll
	incrom	$1829F8,$1E
	incrom	$182A16,$5E
Tbl_ShakeStep_182A74:	; table read by Cam_ShakeStep; 1F of 20 bytes used at runtime; read by Cam_ShakeStep; jt[2128] used by Beast_DiveImpact, Beast_ShockwaveInit
	incrom	$182A74,$20
Tbl_XCloneShakeStep:	; table read by Cam_ShakeStep; 51 of 52 bytes used at runtime; read by Cam_ShakeStep, BroodClaw_CamApplyShake; jt[2129] used by XClone_StateBallsReturn, Beast_ShockwaveInit
	incrom	$182A94,$52
	include "src/f/182AE6.asm"
	include "src/f/182AF4.asm"
	include "src/f/182B3C.asm"
	include "src/f/182BDE.asm"
	include "src/f/182C74.asm"
	include "src/f/182DC2.asm"
	include "src/f/182F0C.asm"
	include "src/f/182FFA.asm"
	include "src/f/1830BE.asm"
	include "src/f/183136.asm"
	include "src/f/1831D0.asm"
	include "src/f/18323E.asm"
	include "src/f/1832B6.asm"
	include "src/f/183320.asm"
	include "src/f/183512.asm"
	include "src/f/1835C2.asm"
	include "src/f/183630.asm"
	include "src/f/1836C0.asm"
	include "src/f/183724.asm"
	include "src/f/1837B0.asm"
	include "src/f/183810.asm"
	include "src/f/183870.asm"
	include "src/f/1838B8.asm"
	include "src/f/18393C.asm"
	include "src/f/183A24.asm"
	include "src/f/183A3E.asm"
	include "src/f/183AB6.asm"
	include "src/f/183BAE.asm"
	include "src/f/183E1A.asm"
	include "src/f/183EB2.asm"
	include "src/f/183F70.asm"
	include "src/f/183FFE.asm"
	include "src/f/1840EC.asm"
	include "src/f/184158.asm"
	include "src/f/1841E4.asm"
	include "src/f/1841F4.asm"
Art_PlayerSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 150 of 150 bytes used at runtime; read by VDP_WriteWords, VDP_FlushDmaQueue, Spr_PreloadTiles; DMA to VRAM $9160-A560; jt[2147] used by Player_CalcMaxTiles, XClone_LoadResources, Beast_Init
	incrom	$1841FE,$150
Art_BeastSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 7860 of 9BDE bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $66A0-A8E0; jt[2148] used by Beast_SelectSpriteDef, EvilBeast_Init, Beast_Init
	incrom	$18434E,$9BDE
Art_PlayerSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 74E0 of 8476 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $85E0-A220; jt[2149] used by Player_CalcMaxTiles, Beast_SetFrame
	incrom	$18DF2C,$8476
Tbl_BeastAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1D of 22 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2150] used by loc_0675D6
	incrom	$1963A2,$22
Tbl_BeastAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2151] used by Wolverine_StateWallCling
	incrom	$1963C4,$A
Tbl_BeastAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2152] used by Wolverine_StateWallCling
	incrom	$1963CE,$A
Tbl_BeastAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2153] used by Wolverine_StateWallCling
	incrom	$1963D8,$A
Tbl_BeastAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2154] used by Wolverine_StateWallCling
	incrom	$1963E2,$A
Tbl_BeastAnim12:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2155] used by Wolverine_StartWallClimb -> Obj_SetAnim
	incrom	$1963EC,$8
Tbl_BeastAnim13:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2156] used by Wolverine_StartWallClimb -> Obj_SetAnim
	incrom	$1963F4,$8
Tbl_BeastAnim14:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2157] used by Wolverine_StartCeilingCrawl -> Obj_SetAnim, Wolverine_StateCeilingHang -> Obj_SetAnim
	incrom	$1963FC,$A
Tbl_BeastAnim15:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2158] used by Wolverine_StartCeilingCrawl -> Obj_SetAnim, Wolverine_StateCeilingHang -> Obj_SetAnim
	incrom	$196406,$A
Tbl_BeastAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 36 of 3E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2159] used by loc_067478
	incrom	$196410,$3E
Tbl_EvilWolverineAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 18 of 1A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2160] used by EvilWolverine_ActLeap, Wolverine_StateLunge, Wolverine_GroundSpecial
	incrom	$19644E,$1A
Tbl_BeastAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 18 of 1A bytes used at runtime; read by Anim_ApplyStep; jt[2161] used by Wolverine_StateLunge, Wolverine_GroundSpecial
	incrom	$196468,$1A
Tbl_BeastAnim8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2162] used by Wolverine_StateWallCling
	incrom	$196482,$14
Tbl_BeastAnim9:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2163] used by Wolverine_AirAttackDown
	incrom	$196496,$16
Tbl_BeastAnim10:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2164] used by Wolverine_AirSpecial
	incrom	$1964AC,$14
Tbl_BeastAnim11:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1E of 34 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2165] used by Wolverine_AirSpecial
	incrom	$1964C0,$34
	incrom	$1964F4,$5E
	include "src/f/196552.asm"
	include "src/f/196560.asm"
	include "src/f/1965D2.asm"
	include "src/f/196686.asm"
	include "src/f/19673A.asm"
	include "src/f/1968D2.asm"
	include "src/f/1969C2.asm"
	include "src/f/196C82.asm"
	include "src/f/196E64.asm"
	include "src/f/196F70.asm"
	include "src/f/197116.asm"
	include "src/f/1972B8.asm"
	include "src/f/197348.asm"
	include "src/f/197412.asm"
	include "src/f/197498.asm"
	include "src/f/1974EE.asm"
	include "src/f/1975E6.asm"
	include "src/f/19767C.asm"
	include "src/f/1976D2.asm"
	include "src/f/19777E.asm"
	include "src/f/1979A4.asm"
	include "src/f/197A3C.asm"
	include "src/f/197ACA.asm"
	include "src/f/197B96.asm"
	include "src/f/197C22.asm"
	include "src/f/197C32.asm"
	include "src/f/197C3C.asm"
Art_EvilWolverineSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 82C0 of BA10 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $66A0-9F00; jt[2180] used by EvilWolverine_Init, Player_CalcMaxTiles, Wolverine_SelectSpriteDef
	incrom	$197C44,$BA10
Art_PlayerSpr3:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2060 of 28F2 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStream; DMA to VRAM $66A0-9FE0; jt[2181] used by Player_CalcMaxTiles, Wolverine_SetFrame
	incrom	$1A3654,$28F2
Tbl_Anim_1A5F46:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 41 of 78 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2182] used by loc_0675B2
	incrom	$1A5F46,$78
Tbl_Anim_1A5FBE:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2183] used by sub_1A62A2, sub_1A62D6, sub_1A6FDC
	incrom	$1A5FBE,$12
Tbl_Anim_1A5FD0:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2184] used by sub_1A62D6, sub_1A6B36
	incrom	$1A5FD0,$12
Tbl_Anim_1A5FE2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[2185] used by sub_1A65EC
	incrom	$1A5FE2,$A
Tbl_Anim_1A5FEC:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2186] used by sub_1A651E, sub_1A6A5C, sub_1A6FDC
	incrom	$1A5FEC,$12
Tbl_Anim_1A5FFE:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2187] used by sub_1A6C48
	incrom	$1A5FFE,$A
Tbl_Anim_1A6008:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 14 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2188] used by sub_1A65EC
	incrom	$1A6008,$16
Tbl_Anim_1A601E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 38 of 42 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2189] used by loc_067478
	incrom	$1A601E,$42
Tbl_Anim_1A6060:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2190] used by sub_1A72C6
	incrom	$1A6060,$8
Tbl_Anim_1A6068:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2191] used by sub_1A72C6
	incrom	$1A6068,$8
Tbl_EvilNightcrawlerAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 14 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2192] used by EvilNightcrawler_ActTeleport, sub_1A757E
	incrom	$1A6070,$16
Tbl_Anim_1A6086:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 14 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2193] used by sub_1A78BC
	incrom	$1A6086,$16
Tbl_EvilNightcrawlerAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 18 of 1A bytes used at runtime; read by Anim_ApplyStep; jt[2194] used by EvilNightcrawler_StateTeleportIn, sub_1A78BC
	incrom	$1A609C,$1A
	include "src/f/1A60B6.asm"
Tbl_Anim_1A616A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$1A616A,$16
	incrom	$1A6180,$5E
	include "src/f/1A61DE.asm"
	include "src/f/1A61EC.asm"
	include "src/f/1A621C.asm"
	include "src/f/1A6248.asm"
	include "src/f/1A62A2.asm"
	include "src/f/1A62D6.asm"
	include "src/f/1A6410.asm"
	include "src/f/1A646A.asm"
	include "src/f/1A64C4.asm"
	include "src/f/1A651E.asm"
	include "src/f/1A65EC.asm"
	incrom	$1A6A40,$12
	include "src/f/1A6A52.asm"
	include "src/f/1A6A5C.asm"
	include "src/f/1A6B36.asm"
	include "src/f/1A6C48.asm"
	include "src/f/1A6FDC.asm"
	include "src/f/1A714C.asm"
	include "src/f/1A71EE.asm"
	include "src/f/1A72C6.asm"
	include "src/f/1A73B2.asm"
	include "src/f/1A74A2.asm"
	include "src/f/1A757E.asm"
	include "src/f/1A76E6.asm"
	include "src/f/1A7730.asm"
	include "src/f/1A775E.asm"
	include "src/f/1A77F0.asm"
	include "src/f/1A7848.asm"
	include "src/f/1A78BC.asm"
	include "src/f/1A7962.asm"
	include "src/f/1A7984.asm"
	include "src/f/1A79A6.asm"
	include "src/f/1A7A86.asm"
	include "src/f/1A7B10.asm"
	include "src/f/1A7BFE.asm"
	include "src/f/1A7CA4.asm"
	include "src/f/1A7CAC.asm"
	include "src/f/1A7CBC.asm"
Art_EvilNightcrawlerSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 6F20 of 8D90 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStream; DMA to VRAM $6CA0-A580; jt[2213] used by EvilNightcrawler_Init, Nightcrawler_SelectSpriteDef, Player_CalcMaxTiles
	incrom	$1A7CC6,$8D90
Art_PlayerSpr4:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 35C0 of 3EF4 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $7080-9D40; jt[2214] used by Player_CalcMaxTiles, sub_1A7BFE
	incrom	$1B0A56,$3EF4
Art_PlayerSpr5:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 3A40 of 4530 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $8620-A400; jt[2215] used by Player_CalcMaxTiles, sub_1A7BFE
	incrom	$1B494A,$4530
Tbl_NightcrawlerAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 14 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2216] used by loc_0675C4
	incrom	$1B8E7A,$16
Tbl_EvilPsylockeAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1E of 34 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2217] used by EvilPsylocke_ActDash, sub_1B947C
	incrom	$1B8E90,$34
Tbl_NightcrawlerAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 2E of 34 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2218] used by loc_067478
	incrom	$1B8EC4,$34
Tbl_NightcrawlerAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2219] used by sub_1B9248
	incrom	$1B8EF8,$14
Tbl_NightcrawlerAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2220] used by sub_1B90E0
	incrom	$1B8F0C,$10
Tbl_NightcrawlerAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 18 of 1A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2221] used by sub_1B9C40
	incrom	$1B8F1C,$1A
Tbl_NightcrawlerAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 18 of 1A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2222] used by sub_1B9C40
	incrom	$1B8F36,$1A
Tbl_NightcrawlerAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 16 of 18 bytes used at runtime; read by Anim_ApplyStep; jt[2223] used by sub_1B9CC2
	incrom	$1B8F50,$18
Tbl_NightcrawlerAnim8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 24 of 28 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2224] used by sub_1B9CC2
	incrom	$1B8F68,$28
Tbl_NightcrawlerAnim9:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 16 of 18 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2225] used by sub_1B9B6E
	incrom	$1B8F90,$18
Tbl_NightcrawlerAnim10:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 16 of 18 bytes used at runtime; read by Anim_ApplyStep; jt[2226] used by sub_1B9B6E
	incrom	$1B8FA8,$18
Tbl_NightcrawlerAnim11:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 16 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2227] used by sub_1B99C2
	incrom	$1B8FC0,$16
Tbl_NightcrawlerAnim12:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2228] used by sub_1B99C2 -> Obj_SetAnim
	incrom	$1B8FD6,$2C
	incrom	$1B9002,$5E
	include "src/f/1B9060.asm"
	include "src/f/1B906E.asm"
	include "src/f/1B90E0.asm"
	include "src/f/1B9198.asm"
	include "src/f/1B9248.asm"
	include "src/f/1B92C0.asm"
	include "src/f/1B947C.asm"
	include "src/f/1B976C.asm"
	include "src/f/1B9800.asm"
	include "src/f/1B9896.asm"
	include "src/f/1B99C2.asm"
	include "src/f/1B9B02.asm"
	include "src/f/1B9B6E.asm"
	include "src/f/1B9C40.asm"
	include "src/f/1B9CC2.asm"
	include "src/f/1B9D44.asm"
	include "src/f/1B9D68.asm"
	include "src/f/1B9E78.asm"
	include "src/f/1B9F1E.asm"
	include "src/f/1B9FE8.asm"
	include "src/f/1BA006.asm"
	include "src/f/1BA016.asm"
Art_EvilPsylockeSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 5020 of 6CD4 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_RenderToBitmap_Loop; DMA to VRAM $6860-C660; jt[2245] used by EvilPsylocke_Init, Player_CalcMaxTiles, Psylocke_SelectSpriteDef
	incrom	$1BA020,$6CD4
Art_PlayerSpr6:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; E00 of 2E8C bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStream; DMA to VRAM $8DE0-9300; jt[2246] used by Player_CalcMaxTiles, sub_1B9E78
	incrom	$1C0CF4,$2E8C
Art_PlayerSpr7:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 7100 of 9B66 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $6860-CA80; jt[2247] used by Player_CalcMaxTiles, sub_1B9E78
	incrom	$1C3B80,$9B66
Tbl_PsylockeAnim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2248] used by loc_0675E8
	incrom	$1CD6E6,$10
Tbl_PsylockeAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 27 of 2C bytes used at runtime; read by Anim_ApplyStep; jt[2249] used by loc_067478
	incrom	$1CD6F6,$2C
Tbl_MagnetoBossAnim2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2250] used by MagnetoBoss_Update
	incrom	$1CD722,$10
Tbl_CloneA5Anim:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep; jt[2251] used by CloneA5_CamUpdate, sub_1CDB32, sub_1CDDA4
	incrom	$1CD732,$10
Tbl_Psylocke:	; format not established; never read in the corpus; jt[2252] used by loc_15922A
	incrom	$1CD742,$A
Tbl_Psylocke2:	; format not established; never read in the corpus; jt[2253] used by loc_1592B6
	incrom	$1CD74C,$10
Tbl_PsylockeAnim3:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[2254] used by loc_159216, loc_15922A
	incrom	$1CD75C,$A
Tbl_PsylockeAnim4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2255] used by loc_1592A2, loc_1592B6
	incrom	$1CD766,$10
Tbl_PsylockeAnim5:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2256] used by loc_159216, loc_159248
	incrom	$1CD776,$A
Tbl_PsylockeAnim6:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep; jt[2257] used by loc_1592A2, loc_1592D4
	incrom	$1CD780,$10
Tbl_Psylocke3:	; format not established; never read in the corpus; jt[2258] used by loc_15920C, loc_159252
	incrom	$1CD790,$A
Tbl_Psylocke4:	; format not established; never read in the corpus; jt[2259] used by loc_159298, loc_1592DE
	incrom	$1CD79A,$10
Tbl_PsylockeAnim26:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2260] used by sub_1CE73E -> Obj_SetAnim
	incrom	$1CD7AA,$C
Tbl_PsylockeAnim7:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[2261] used by sub_1CE2CE, sub_1CE902
	incrom	$1CD7B6,$A
Tbl_PsylockeAnim8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep; jt[2262] used by sub_1CE22C, sub_1CE826
	incrom	$1CD7C0,$10
Tbl_Psylocke5:	; format not established; never read in the corpus; jt[2263] used by loc_1590E4
	incrom	$1CD7D0,$A
Tbl_Psylocke6:	; format not established; never read in the corpus; jt[2264] used by loc_15918A
	incrom	$1CD7DA,$10
Tbl_Psylocke7:	; format not established; never read in the corpus; jt[2265] used by loc_1590E4
	incrom	$1CD7EA,$A
Tbl_Psylocke8:	; format not established; never read in the corpus; jt[2266] used by loc_15918A
	incrom	$1CD7F4,$10
Tbl_PsylockeAnim9:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[2267] used by loc_1590DA, loc_15910C
	incrom	$1CD804,$A
Tbl_PsylockeAnim10:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2268] used by loc_159180, loc_1591B2
	incrom	$1CD80E,$10
Tbl_PsylockeAnim11:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2269] used by loc_1590C6, loc_15910C
	incrom	$1CD81E,$A
Tbl_PsylockeAnim12:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep; jt[2270] used by loc_15916C, loc_1591B2
	incrom	$1CD828,$10
Tbl_PsylockeAnim13:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2271] used by loc_1590C6, loc_159120
	incrom	$1CD838,$A
Tbl_PsylockeAnim14:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep; jt[2272] used by loc_15916C, loc_1591C6
	incrom	$1CD842,$10
Tbl_PsylockeAnim15:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2273] used by sub_1CE34E
	incrom	$1CD852,$C
Tbl_Psylocke9:	; format not established; never read in the corpus; jt[2274] used by sub_1CE34E
	incrom	$1CD85E,$C
Tbl_Psylocke10:	; format not established; never read in the corpus; jt[2275] used by sub_1CE34E
	incrom	$1CD86A,$C
Tbl_Psylocke11:	; format not established; never read in the corpus; jt[2276] used by sub_1CE34E
	incrom	$1CD876,$C
Tbl_PsylockeAnim16:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2277] used by MagnetoBoss_StateOutro
	incrom	$1CD882,$14
Tbl_PsylockeAnim17:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 6 of 8 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2278] used by MagnetoBoss_StateOutroLoop
	incrom	$1CD896,$8
Tbl_PsylockeAnim18:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2279] used by sub_1580B2
	incrom	$1CD89E,$A
Tbl_PsylockeAnim19:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2280] used by sub_1580B2
	incrom	$1CD8A8,$A
Tbl_Psylocke12:	; format not established; never read in the corpus; jt[2281] used by sub_1580B2
	incrom	$1CD8B2,$A
Tbl_Psylocke13:	; format not established; never read in the corpus; jt[2282] used by sub_1580B2
	incrom	$1CD8BC,$A
Tbl_PsylockeAnim20:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2283] used by sub_1580B2
	incrom	$1CD8C6,$A
Tbl_PsylockeAnim21:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2284] used by sub_158E32, sub_158FE4
	incrom	$1CD8D0,$E
Tbl_PsylockeAnim22:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 12 of 14 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2285] used by sub_158E78, sub_159030
	incrom	$1CD8DE,$14
Tbl_PsylockeAnim23:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 34 of 36 bytes used at runtime; read by Anim_ApplyStep, sub_158536, sub_158992; jt[2286] used by sub_158F32
	incrom	$1CD8F2,$36
Tbl_PsylockeAnim24:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 2E of 2E bytes used at runtime; read by Anim_ApplyStep, sub_158536, sub_158992; jt[2287,2288] used by sub_158474, sub_158536
	incrom	$1CD928,$2E
Tbl_PsylockeAnim25:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1A of 46 bytes used at runtime; read by Anim_ApplyStep, sub_158536, sub_158992; jt[2289,2290] used by sub_1583D6, sub_158992, sub_158C0E
	incrom	$1CD956,$46
	incrom	$1CD99C,$5E
Art_PsylockeTiles:	; uncompressed 4bpp tiles DMA'd to VRAM; 20 of 20 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $8400-8420; jt[2292] used by sub_158536, sub_158992
	incrom	$1CD9FA,$20
Art_PsylockeTiles2:	; uncompressed 4bpp tiles DMA'd to VRAM; 20 of 20 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $83E0-8400; jt[2293] used by sub_158536, sub_158992
	incrom	$1CDA1A,$20
	include "src/f/1CDA3A.asm"
	include "src/f/1CDA48.asm"
	include "src/f/1CDB32.asm"
	include "src/f/1CDCE8.asm"
	include "src/f/1CDDA4.asm"
	include "src/f/1CDEB2.asm"
	include "src/f/1CDFD2.asm"
	include "src/f/1CE05E.asm"
	include "src/f/1CE0F2.asm"
	include "src/f/1CE19A.asm"
	include "src/f/1CE22C.asm"
	include "src/f/1CE2CE.asm"
	include "src/f/1CE34E.asm"
	include "src/f/1CE618.asm"
	include "src/f/1CE646.asm"
	include "src/f/1CE674.asm"
	include "src/f/1CE73E.asm"
	include "src/f/1CE778.asm"
	include "src/f/1CE826.asm"
	include "src/f/1CE902.asm"
	include "src/f/1CE982.asm"
	include "src/f/1CEA2E.asm"
	include "src/f/1CEADA.asm"
	include "src/f/1CEB18.asm"
	include "src/f/1CEBCC.asm"
	include "src/f/1CEC28.asm"
	include "src/f/1CEC38.asm"
	include "src/f/1CEC42.asm"
Tbl_Anim_1CEC4A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$1CEC4A,$12
Tbl_Anim_1CEC5C:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1A of 3A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2311] used by loc_06758E
	incrom	$1CEC5C,$3A
Tbl_Anim_1CEC96:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2312] used by sub_1CEF7C
	incrom	$1CEC96,$A
Tbl_Anim_1CECA0:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2313] used by sub_1CEF7C
	incrom	$1CECA0,$A
Tbl_Anim_1CECAA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 5 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2314] used by sub_1CEF7C
	incrom	$1CECAA,$A
Tbl_Anim_1CECB4:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_AdvanceByDistance, Anim_ApplyStep, Anim_Advance; jt[2315] used by sub_1CEF7C
	incrom	$1CECB4,$A
Tbl_Anim_1CECBE:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 50 of 6C bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2316] used by loc_067478
	incrom	$1CECBE,$6C
Tbl_Anim_1CED2A:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2317] used by sub_1CFB56 -> Obj_SetAnim
	incrom	$1CED2A,$20
Tbl_Anim_1CED4A:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2318] used by sub_1CFB56 -> Obj_SetAnim
	incrom	$1CED4A,$20
Tbl_Anim_1CED6A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1E of 20 bytes used at runtime; read by Anim_ApplyStep; jt[2319] used by sub_1CFB56
	incrom	$1CED6A,$20
Tbl_Anim_1CED8A:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2320] used by sub_1CFB56 -> Obj_SetAnim
	incrom	$1CED8A,$20
Tbl_Anim_1CEDAA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 1E of 20 bytes used at runtime; read by Anim_ApplyStep; jt[2321] used by sub_1D0058, sub_1D04C4
	incrom	$1CEDAA,$20
Tbl_Anim_1CEDCA:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2322] used by sub_1CFE26 -> Obj_SetAnim
	incrom	$1CEDCA,$10
Tbl_Anim_1CEDDA:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2323] used by sub_1CFE26 -> Obj_SetAnim
	incrom	$1CEDDA,$10
Tbl_Anim_1CEDEA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); E of 10 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2324] used by sub_1CFE26
	incrom	$1CEDEA,$10
Tbl_Anim_1CEDFA:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2325] used by sub_1CFE26 -> Obj_SetAnim
	incrom	$1CEDFA,$10
Tbl_Anim_1CEE0A:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2326] used by sub_1CFE26 -> Obj_SetAnim
	incrom	$1CEE0A,$10
Tbl_Anim_1CEE1A:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 5 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2327] used by sub_1CFB56
	incrom	$1CEE1A,$A
Tbl_Anim_1CEE24:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2328] used by sub_1CFB56
	incrom	$1CEE24,$A
Tbl_Anim_1CEE2E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2329] used by sub_1CFB56
	incrom	$1CEE2E,$A
Tbl_Anim_1CEE38:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2330] used by sub_1CFB56
	incrom	$1CEE38,$A
Tbl_Anim_1CEE42:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of 22 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2331] used by sub_1D0148
	incrom	$1CEE42,$22
	incrom	$1CEE64,$10A
	include "src/f/1CEF6E.asm"
	include "src/f/1CEF7C.asm"
	include "src/f/1CF070.asm"
	include "src/f/1CF0E2.asm"
	include "src/f/1CF1B6.asm"
	include "src/f/1CF1EC.asm"
	include "src/f/1CF36E.asm"
Sw_1CF36E:	; switch table of sub at $1CF36E: 5 word offsets from Sw_1CF36E-2
	dc.w	loc_1CF3AE-(Sw_1CF36E-2), loc_1CF3C0-(Sw_1CF36E-2), loc_1CF3C4-(Sw_1CF36E-2), loc_1CF3C8-(Sw_1CF36E-2)
	dc.w	loc_1CF3DE-(Sw_1CF36E-2)
	include "src/f/1CF3AE.asm"
	include "src/f/1CF3C0.asm"
	include "src/f/1CF3E2.asm"
	include "src/f/1CF432.asm"
Sw_1CF432:	; switch table of sub at $1CF432: 4 word offsets from Sw_1CF432-2
	dc.w	loc_1CF74E-(Sw_1CF432-2), loc_1CF752-(Sw_1CF432-2), loc_1CF758-(Sw_1CF432-2), loc_1CF75C-(Sw_1CF432-2)
	include "src/f/1CF74E.asm"
	include "src/f/1CF7E6.asm"
	include "src/f/1CF7FA.asm"
	include "src/f/1CF84A.asm"
	include "src/f/1CFA48.asm"
	include "src/f/1CFA90.asm"
	include "src/f/1CFAD8.asm"
	include "src/f/1CFB14.asm"
	include "src/f/1CFB56.asm"
	include "src/f/1CFE26.asm"
	include "src/f/1CFF7E.asm"
	include "src/f/1CFFEA.asm"
	include "src/f/1D0058.asm"
	include "src/f/1D011E.asm"
	include "src/f/1D0148.asm"
	include "src/f/1D0182.asm"
	include "src/f/1D01A4.asm"
	include "src/f/1D01C6.asm"
	include "src/f/1D01E8.asm"
	include "src/f/1D020A.asm"
	include "src/f/1D022C.asm"
	include "src/f/1D024E.asm"
	include "src/f/1D0270.asm"
	include "src/f/1D029E.asm"
	include "src/f/1D041E.asm"
	include "src/f/1D04C4.asm"
	include "src/f/1D052A.asm"
	include "src/f/1D0560.asm"
	include "src/f/1D059C.asm"
	include "src/f/1D06AE.asm"
	include "src/f/1D073C.asm"
	include "src/f/1D0744.asm"
	include "src/f/1D0754.asm"
Art_EvilGambitSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 4C00 of 64DC bytes used at runtime; read by VDP_FlushDmaQueue, Spr_RenderToBitmap_Loop; DMA to VRAM $7CC0-C700; jt[2352] used by EvilGambit_Init, Gambit_SelectSpriteDef, Player_CalcMaxTiles
	incrom	$1D075E,$64DC
Art_PlayerSpr8:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 36A0 of 4962 bytes used at runtime; read by VDP_FlushDmaQueue; DMA to VRAM $7CC0-C740; jt[2353] used by Player_CalcMaxTiles, sub_1D041E
	incrom	$1D6C3A,$4962
Art_PlayerSpr9:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 2880 of 5E6E bytes used at runtime; read by VDP_FlushDmaQueue, Spr_EmitStream; DMA to VRAM $7CC0-A2A0; jt[2354] used by Player_CalcMaxTiles, sub_1D041E
	incrom	$1DB59C,$5E6E
Art_GambitSpr:	; sprite definition (type $19, Nemesis-compressed tiles): $24-byte header, $14-byte frame records, pieces, tiles; 189 of 18A bytes used at runtime; read by Spr_PreloadTiles, Nem_DecodeLoop, VDP_FlushDmaQueue; jt[2355] used by sub_1D029E
	incrom	$1E140A,$18A
Art_GambitSpr2:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 60 of 60 bytes used at runtime; read by Nem_DecodeLoop, Spr_PreloadTiles, VDP_WriteWords; jt[2356] used by sub_1D029E
	incrom	$1E1594,$60
	include "src/f/1E15F4.asm"
	include "src/f/1E1604.asm"
	include "src/f/1E16BC.asm"
	incrom	$1E16CC,$8
	include "src/f/1E16D4.asm"
	incrom	$1E1768,$6
	include "src/f/1E176E.asm"
	include "src/f/1E177A.asm"
	incrom	$1E1902,$14
	include "src/f/1E1916.asm"
	include "src/f/1E1928.asm"
Tbl_Anim_1E19B8:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 10 of 12 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance
	incrom	$1E19B8,$12
Tbl_Anim_1E19CA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 19C of 27E bytes used at runtime; read by Anim_ApplyStep; jt[2360] used by loc_06758E
	incrom	$1E19CA,$27E
Tbl_Anim_1E1C48:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 13 of 18 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2361] used by sub_1E39B8
	incrom	$1E1C48,$18
Tbl_Anim_1E1C60:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 2A of 30 bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance; jt[2362] used by loc_067478
	incrom	$1E1C60,$30
Tbl_Anim_1E1C90:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2363] used by sub_1E3594
	incrom	$1E1C90,$E
Tbl_Anim_1E1C9E:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2364] used by sub_1E3594
	incrom	$1E1C9E,$E
Tbl_Anim_1E1CAC:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2365] used by sub_1E3594
	incrom	$1E1CAC,$E
Tbl_Anim_1E1CBA:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); C of E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2366] used by sub_1E3594
	incrom	$1E1CBA,$E
Tbl_Anim_1E1CC8:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2367] used by sub_1E3278 -> Obj_SetAnim, sub_1E3892 -> Obj_SetAnim
	incrom	$1E1CC8,$A
Tbl_Anim_1E1CD2:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); 8 of A bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2368] used by sub_1E3322
	incrom	$1E1CD2,$A
Tbl_Anim_1E1CDC:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2369] used by sub_1E3322 -> Obj_SetAnim
	incrom	$1E1CDC,$A
Tbl_Anim_1E1CE6:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2370] used by sub_1E3322 -> Obj_SetAnim
	incrom	$1E1CE6,$A
Tbl_Anim_1E1CF0:	; animation script (NOTES: Animation scripts); never read in the corpus; jt[2371] used by sub_1E3322 -> Obj_SetAnim
	incrom	$1E1CF0,$A
	incrom	$1E1CFA,$98A
Tbl_1E2684:	; format not established; never read in the corpus; jt[2379] used by sub_1E2CFC
	incrom	$1E2684,$5C
	incrom	$1E26E0,$A8
Tbl_1E2788:	; format not established; never read in the corpus; jt[2376] used by sub_1E2CFC, sub_1E3322 -> sub_1E2CFC
	incrom	$1E2788,$54
Tbl_1E27DC:	; format not established; never read in the corpus; jt[2375] used by sub_1E2CFC, sub_1E3322 -> sub_1E2CFC
	incrom	$1E27DC,$12C
Tbl_1E2908:	; format not established; never read in the corpus; jt[2374] used by sub_1E2CFC, sub_1E3322 -> sub_1E2CFC
	incrom	$1E2908,$12C
Tbl_Anim_1E2A34:	; animation script (byte flags, byte steps, ..., 2-byte steps from +6); A of 1E bytes used at runtime; read by Anim_ApplyStep, Anim_AdvanceByDistance, Anim_Advance; jt[2373] used by sub_1E2CFC, sub_1E3322
	incrom	$1E2A34,$1E
	incrom	$1E2A52,$5E
	include "src/f/1E2AB0.asm"
	include "src/f/1E2ABE.asm"
	include "src/f/1E2B48.asm"
	include "src/f/1E2C1A.asm"
	include "src/f/1E2C3E.asm"
	include "src/f/1E2CBC.asm"
	include "src/f/1E2CFC.asm"
	include "src/f/1E2F24.asm"
	include "src/f/1E2F46.asm"
	include "src/f/1E31BA.asm"
	include "src/f/1E3214.asm"
	include "src/f/1E3246.asm"
	include "src/f/1E3278.asm"
	include "src/f/1E32EC.asm"
	include "src/f/1E3322.asm"
	include "src/f/1E34BA.asm"
	include "src/f/1E3526.asm"
	include "src/f/1E3594.asm"
	include "src/f/1E3892.asm"
	include "src/f/1E3966.asm"
	include "src/f/1E3988.asm"
	include "src/f/1E39B8.asm"
	include "src/f/1E39F2.asm"
	include "src/f/1E3A14.asm"
	include "src/f/1E3A36.asm"
	include "src/f/1E3A58.asm"
	include "src/f/1E3A7A.asm"
	include "src/f/1E3A9C.asm"
	include "src/f/1E3ABE.asm"
	include "src/f/1E3BB0.asm"
	include "src/f/1E3BF2.asm"
	include "src/f/1E3C52.asm"
	include "src/f/1E3C5A.asm"
	include "src/f/1E3C6A.asm"
Art_CyclopsSpr:	; sprite definition (type $18, raw 4bpp tiles): $24-byte header, $14-byte frame records, pieces, tiles; 8060 of A138 bytes used at runtime; read by VDP_FlushDmaQueue, Spr_RenderToBitmap_Loop; DMA to VRAM $6CA0-C8A0; jt[2404] used by Cyclops_SelectSpriteDef, EvilCyclops_Init, Player_CalcMaxTiles
	incrom	$1E3C74,$A138
Tbl_CyclopsVdp:	; words copied to the VDP data port by VDP_WriteWords; CD7 of D70 bytes used at runtime; read by VDP_WriteWords; jt[2405] used by sub_1E2CFC
	incrom	$1EDDAC,$D70
Tbl_CyclopsVdp2:	; words copied to the VDP data port by VDP_WriteWords; 58A of C58 bytes used at runtime; read by VDP_WriteWords; jt[2406] used by sub_1E2CFC
	incrom	$1EEB1C,$C58
Tbl_CyclopsVdp3:	; words copied to the VDP data port by VDP_WriteWords; 2F4 of 8E8 bytes used at runtime; read by VDP_WriteWords; jt[2407] used by sub_1E2CFC
	incrom	$1EF774,$8E8
	include "src/f/1F005C.asm"
	include "src/f/1F00E8.asm"
	include "src/f/1F00F6.asm"
	include "src/f/1F0188.asm"
	include "src/f/1F01F4.asm"
	include "src/f/1F01FE.asm"
	include "src/f/1F0222.asm"
	include "src/f/1F022C.asm"
	include "src/f/1F0250.asm"
	include "src/f/1F0280.asm"
	include "src/f/1F02A4.asm"
	include "src/f/1F02C8.asm"
	include "src/f/1F02EC.asm"
	include "src/f/1F0310.asm"
	include "src/f/1F0334.asm"
	include "src/f/1F039A.asm"
	include "src/f/1F0430.asm"
	include "src/f/1F049E.asm"
	include "src/f/1F0542.asm"
	include "src/f/1F0582.asm"
	include "src/f/1F074E.asm"
	include "src/f/1F07CA.asm"
	include "src/f/1F0834.asm"
	include "src/f/1F0930.asm"
	include "src/f/1F0998.asm"
	include "src/f/1F09D6.asm"
	include "src/f/1F0A48.asm"
	include "src/f/1F0A94.asm"
	include "src/f/1F1372.asm"
	include "src/f/1F13D0.asm"
	include "src/f/1F1424.asm"
	include "src/f/1F1478.asm"
	include "src/f/1F1504.asm"
	include "src/f/1F153A.asm"
	include "src/f/1F1644.asm"
	include "src/f/1F196E.asm"
	include "src/f/1F1A2E.asm"
	include "src/f/1F1C06.asm"
	include "src/f/1F1CD4.asm"
	include "src/f/1F1D88.asm"
	include "src/f/1F1DE2.asm"
	include "src/f/1F1DEC.asm"
	include "src/f/1F1FEE.asm"
	include "src/f/1F20D0.asm"
	include "src/f/1F20D8.asm"
	include "src/f/1F20EA.asm"
	include "src/f/1F2126.asm"
	include "src/f/1F21C0.asm"
	include "src/f/1F220E.asm"
	include "src/f/1F2216.asm"
	include "src/f/1F221E.asm"
	include "src/f/1F2234.asm"
	include "src/f/1F2306.asm"
	include "src/f/1F2376.asm"
	include "src/f/1F241C.asm"
	include "src/f/1F2520.asm"
	include "src/f/1F2572.asm"
	include "src/f/1F26F2.asm"
	include "src/f/1F272E.asm"
	include "src/f/1F2736.asm"
	include "src/f/1F27EA.asm"
	include "src/f/1F285A.asm"
	include "src/f/1F28CA.asm"
	include "src/f/1F293A.asm"
	include "src/f/1F2972.asm"
	include "src/f/1F2AEA.asm"
	include "src/f/1F2B8E.asm"
	include "src/f/1F2C6E.asm"
	include "src/f/1F2D74.asm"
	include "src/f/1F2E56.asm"
	include "src/f/1F2F0C.asm"
	include "src/f/1F2FAC.asm"
	include "src/f/1F3044.asm"
	include "src/f/1F30DC.asm"
	include "src/f/1F31F0.asm"
	include "src/f/1F3226.asm"
	include "src/f/1F3282.asm"
	include "src/f/1F32D0.asm"
	include "src/f/1F3342.asm"
	include "src/f/1F33D0.asm"
	include "src/f/1F35DC.asm"
	include "src/f/1F364E.asm"
	include "src/f/1F37F2.asm"
	include "src/f/1F383A.asm"
	include "src/f/1F39C4.asm"
	include "src/f/1F3ADE.asm"
	include "src/f/1F3C7C.asm"
	include "src/f/1F3CD6.asm"
	include "src/f/1F3CE4.asm"
	include "src/f/1F3D20.asm"
	include "src/f/1F3D36.asm"
	include "src/f/1F3DB4.asm"
	include "src/f/1F3EC0.asm"
Sw_1F3EC0:	; switch table of sub at $1F3EC0: 4 word offsets from Sw_1F3EC0-2
	dc.w	XClimber_CheckGrab_Case0-(Sw_1F3EC0-2), loc_1F3FDE-(Sw_1F3EC0-2), loc_1F3FD2-(Sw_1F3EC0-2), loc_1F3FD2-(Sw_1F3EC0-2)
	include "src/f/1F3FCC.asm"
	include "src/f/1F401C.asm"
	include "src/f/1F4136.asm"
	include "src/f/1F413E.asm"
	include "src/f/1F41C2.asm"
	include "src/f/1F4208.asm"
	include "src/f/1F423A.asm"
	include "src/f/1F426C.asm"
	include "src/f/1F429E.asm"
	include "src/f/1F42D0.asm"
	include "src/f/1F4302.asm"
	include "src/f/1F4334.asm"
	include "src/f/1F43AE.asm"
Boot_SetupValues:	; Sega ICD_BLK4 boot setup table read by EntryPoint (lea into a5): init words, hardware port addresses, VDP register values, Z80 init program, PSG mute bytes
	incrom	$1F443C,$6C
	include "src/f/1F44A8.asm"
	include "src/f/1F45AE.asm"
RegionCheck_Data:	; Sega region-lockout data for Boot_RegionCheck: region code letters (J/U/E/B/S), "DEVELOPED FOR USE ONLY WITH ... SYSTEMS" message strings, then a 1bpp 8x8 font (ASCII $20-$5A) to print them
	incrom	$1F45E4,$4
Tbl_RegionCodePairs:	; word pairs {region letter, flag} for the region check, ending with a 0 word (Boot_RegionCheck)
	incrom	$1F45E8,$14
Str_RegionMsgDeveloped:	; length-prefixed text "DEVELOPED FOR USE ONLY WITH" (Boot_RegionCheck lockout screen)
	incrom	$1F45FC,$1D
Str_RegionMsgSystemsPos:	; 2 bytes before "SYSTEMS.": text position/length data used by Boot_RegionCheck
	incrom	$1F4619,$3
Str_RegionMsgSystems:	; length-prefixed text "SYSTEMS." then the console names (NTSC MEGA DRIVE, NTSC GENESIS, PAL AND FRENCH SECAM MEGA DRIVE)
	incrom	$1F461C,$4A
Art_RegionFont:	; 1bpp 8x8 font, ASCII $20 up (blank first), 8 bytes per glyph, for the region lockout text
	incrom	$1F4666,$1D8
	include "src/f/1F483E.asm"
	include "src/f/1F4854.asm"
	include "src/f/1F485A.asm"
	include "src/f/1F4860.asm"
	include "src/f/1F4870.asm"
	incrom	$1F4880,$10
	include "src/f/1F4890.asm"
Tbl_A5WorldInfo:	; 20 bytes: longs $3CE6 (size of the A5 globals area below $200 = $FFC51A..$FFFFFF), 0, 0, $04EC, $25413569; pointer returned by unk_Sys_1F4890
	incrom	$1F4896,$14
	include "src/f/1F48AA.asm"
	incrom	$1F48F6,$A
	include "src/f/1F4900.asm"
	incrom	$1F4956,$A
Tbl_AvalonA3New:	; table read by Cam_New; 30 of 46 bytes used at runtime; read by Cam_New, Cam_Init, SiberiaB1_InitWind; jt[2483] used by AvalonA3_InitCamera, AvalonA4_InitCamera, AvalonB1_InitCamera
	incrom	$1F4960,$46
	incrom	$1F49A6,$74
	include "src/f/1F4A1A.asm"
	include "src/f/1F4A40.asm"
	include "src/f/1F4BA2.asm"
	include "src/f/1F4C56.asm"
	include "src/f/1F4EFC.asm"
	include "src/f/1F5228.asm"
	include "src/f/1F523E.asm"
	include "src/f/1F5254.asm"
	include "src/f/1F5340.asm"
	include "src/f/1F53CC.asm"
	include "src/f/1F5500.asm"
	include "src/f/1F553C.asm"
	include "src/f/1F5594.asm"
	include "src/f/1F5612.asm"
	include "src/f/1F5788.asm"
Str_RowTableTags:	; two empty C strings: Mem_StackAlloc tags of the BG ($1F5EFC) and FG ($1F5EFE) row-offset tables (Level_LoadMaps)
	incrom	$1F5EFC,$2
Str_RowTableTagFg:	; empty C string: Mem_StackAlloc tag of the FG row-offset table (Level_LoadMaps)
	incrom	$1F5EFE,$2
Str_APlaneTilesNoB:	; C string "A PLANE TILES -- NO B" (used by Level_LoadMaps)
	incrom	$1F5F00,$16
Str_BTilesTag:	; empty C string: Mem_StackAlloc tag of the BG block table (Level_LoadMaps)
	incrom	$1F5F16,$2
Str_APlaneTiles:	; C string "A PLANE TILES" (used by Level_LoadMaps)
	incrom	$1F5F18,$E
Str_AbTilesSharing:	; C string "AB TILES -- SHARING" (used by Level_LoadMaps)
	incrom	$1F5F26,$14
Str_MapBufTags:	; three empty C strings: Mem_StackAlloc tags of the FG block table ($1F5F3A), BG layout ($1F5F3C) and FG layout ($1F5F3E) buffers (Level_LoadMaps)
	incrom	$1F5F3A,$2
Str_MapBufTagBg:	; empty C string: Mem_StackAlloc tag of the BG layout buffer (Level_LoadMaps)
	incrom	$1F5F3C,$2
Str_MapBufTagFg:	; empty C string: Mem_StackAlloc tag of the FG layout buffer (Level_LoadMaps)
	incrom	$1F5F3E,$2
	include "src/f/1F5F40.asm"
	include "src/f/1F5F5A.asm"
	include "src/f/1F5F78.asm"
	include "src/f/1F60E4.asm"
	include "src/f/1F6258.asm"
	include "src/f/1F626A.asm"
	include "src/f/1F6296.asm"
	include "src/f/1F62C0.asm"
	include "src/f/1F6334.asm"
	include "src/f/1F638A.asm"
	include "src/f/1F6420.asm"
	include "src/f/1F64B4.asm"
	include "src/f/1F6530.asm"
	include "src/f/1F669A.asm"
	include "src/f/1F66F0.asm"
	include "src/f/1F6774.asm"
	include "src/f/1F67C8.asm"
	include "src/f/1F6816.asm"
	include "src/f/1F684E.asm"
	include "src/f/1F6886.asm"
	include "src/f/1F68B2.asm"
	include "src/f/1F68C0.asm"
	include "src/f/1F68CE.asm"
	include "src/f/1F690E.asm"
	include "src/f/1F694A.asm"
	include "src/f/1F6A32.asm"
	include "src/f/1F6B56.asm"
	include "src/f/1F6B9C.asm"
	include "src/f/1F6BD2.asm"
	include "src/f/1F6C04.asm"
Str_Empty_1F6D74:	; C string "" (used by Seg_LoadList)
Str_SegGridTag:	; empty C string: Mem_StackAlloc mark tag in Seg_LoadList
	incrom	$1F6D74,$2
	include "src/f/1F6D76.asm"
Sw_1F6D76:	; switch table of sub at $1F6D76: 36 word offsets from Sw_1F6D76-2
	dc.w	loc_1F6E5A-(Sw_1F6D76-2), loc_1F6E78-(Sw_1F6D76-2), loc_1F6E42-(Sw_1F6D76-2), loc_1F6E4C-(Sw_1F6D76-2)
	dc.w	loc_1F6EBA-(Sw_1F6D76-2), loc_1F6EBA-(Sw_1F6D76-2), loc_1F6EBA-(Sw_1F6D76-2), loc_1F6EBA-(Sw_1F6D76-2)
	dc.w	loc_1F6EBA-(Sw_1F6D76-2), loc_1F6EBA-(Sw_1F6D76-2), loc_1F6EBA-(Sw_1F6D76-2), loc_1F6EBA-(Sw_1F6D76-2)
	dc.w	loc_1F6EBA-(Sw_1F6D76-2), loc_1F6E42-(Sw_1F6D76-2), loc_1F6E42-(Sw_1F6D76-2), loc_1F6EA6-(Sw_1F6D76-2)
	dc.w	loc_1F6EA6-(Sw_1F6D76-2), loc_1F6EA6-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2)
	dc.w	loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2)
	dc.w	loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2), loc_1F6E48-(Sw_1F6D76-2)
	dc.w	loc_1F6EA6-(Sw_1F6D76-2), loc_1F6EA6-(Sw_1F6D76-2), loc_1F6EA6-(Sw_1F6D76-2), loc_1F6EA6-(Sw_1F6D76-2)
	dc.w	loc_1F6E42-(Sw_1F6D76-2), loc_1F6E4C-(Sw_1F6D76-2), loc_1F6E78-(Sw_1F6D76-2), loc_1F6E5A-(Sw_1F6D76-2)
	incrom	$1F6E40,$2
	include "src/f/1F6E42.asm"
	include "src/f/1F6EA6.asm"
	include "src/f/1F6EC4.asm"
Sw_1F6EC4:	; switch table of sub at $1F6EC4: 34 word offsets from Sw_1F6EC4-2
	dc.w	loc_1F6FC4-(Sw_1F6EC4-2), loc_1F6FAC-(Sw_1F6EC4-2), loc_1F6F80-(Sw_1F6EC4-2), loc_1F6FDA-(Sw_1F6EC4-2)
	dc.w	loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6FEA-(Sw_1F6EC4-2)
	dc.w	loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6FEA-(Sw_1F6EC4-2)
	dc.w	loc_1F6FEA-(Sw_1F6EC4-2), loc_1F6F80-(Sw_1F6EC4-2), loc_1F6F80-(Sw_1F6EC4-2), loc_1F6FDA-(Sw_1F6EC4-2)
	dc.w	loc_1F6FDA-(Sw_1F6EC4-2), loc_1F6FDA-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2)
	dc.w	loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2)
	dc.w	loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2), loc_1F6FD6-(Sw_1F6EC4-2)
	dc.w	loc_1F6FDA-(Sw_1F6EC4-2), loc_1F6FDA-(Sw_1F6EC4-2), loc_1F6FDA-(Sw_1F6EC4-2), loc_1F6FDA-(Sw_1F6EC4-2)
	dc.w	loc_1F6F80-(Sw_1F6EC4-2), loc_1F6F92-(Sw_1F6EC4-2)
	include "src/f/1F6F80.asm"
	include "src/f/1F6F92.asm"
	include "src/f/1F6FD6.asm"
	include "src/f/1F6FDA.asm"
	include "src/f/1F6FF4.asm"
Sw_1F6FF4:	; switch table of sub at $1F6FF4: 36 word offsets from Sw_1F6FF4-2
	dc.w	loc_1F714E-(Sw_1F6FF4-2), loc_1F719C-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70FE-(Sw_1F6FF4-2)
	dc.w	loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2)
	dc.w	loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2)
	dc.w	loc_1F71E8-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2)
	dc.w	loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2)
	dc.w	loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2)
	dc.w	loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2), loc_1F70A4-(Sw_1F6FF4-2)
	dc.w	loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2), loc_1F71E8-(Sw_1F6FF4-2)
	dc.w	loc_1F70A4-(Sw_1F6FF4-2), loc_1F70FE-(Sw_1F6FF4-2), loc_1F719C-(Sw_1F6FF4-2), loc_1F714E-(Sw_1F6FF4-2)
	incrom	$1F70A0,$4
	include "src/f/1F70A4.asm"
	include "src/f/1F71E8.asm"
	include "src/f/1F71F2.asm"
Sw_1F71F2:	; switch table of sub at $1F71F2: 36 word offsets from Sw_1F71F2-2
	dc.w	loc_1F72CC-(Sw_1F71F2-2), loc_1F72E2-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72B6-(Sw_1F71F2-2)
	dc.w	loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2)
	dc.w	loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2)
	dc.w	loc_1F72F6-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2)
	dc.w	loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2)
	dc.w	loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2)
	dc.w	loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2), loc_1F72A0-(Sw_1F71F2-2)
	dc.w	loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2), loc_1F72F6-(Sw_1F71F2-2)
	dc.w	loc_1F72A0-(Sw_1F71F2-2), loc_1F72B6-(Sw_1F71F2-2), loc_1F72E2-(Sw_1F71F2-2), loc_1F72CC-(Sw_1F71F2-2)
	incrom	$1F729E,$2
	include "src/f/1F72A0.asm"
	include "src/f/1F72B6.asm"
	include "src/f/1F72F6.asm"
	include "src/f/1F7300.asm"
	include "src/f/1F7628.asm"
Sw_1F7628:	; switch table of sub at $1F7628: 16 word offsets from Sw_1F7628-2
	dc.w	loc_1F7936-(Sw_1F7628-2), loc_1F76D6-(Sw_1F7628-2), loc_1F76D6-(Sw_1F7628-2), loc_1F76D6-(Sw_1F7628-2)
	dc.w	loc_1F76D6-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2)
	dc.w	loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2)
	dc.w	loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2), loc_1F7686-(Sw_1F7628-2), loc_1F7936-(Sw_1F7628-2)
	incrom	$1F7682,$4
	include "src/f/1F7686.asm"
	include "src/f/1F76D6.asm"
Sw_1F76D6:	; switch table of sub at $1F76D6: 32 word offsets from Sw_1F76D6-2
	dc.w	loc_1F7874-(Sw_1F76D6-2), loc_1F78A0-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F7848-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2)
	dc.w	loc_1F78CA-(Sw_1F76D6-2), loc_1F78CA-(Sw_1F76D6-2), loc_1F78A0-(Sw_1F76D6-2), loc_1F7874-(Sw_1F76D6-2)
	incrom	$1F7844,$4
	include "src/f/1F7848.asm"
	include "src/f/1F78CA.asm"
	include "src/f/1F7940.asm"
	include "src/f/1F7956.asm"
	include "src/f/1F79A2.asm"
Sw_1F79A2:	; switch table of sub at $1F79A2: 10 word offsets from Sw_1F79A2-2
	dc.w	loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2)
	dc.w	loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2)
	dc.w	loc_1F7A7C-(Sw_1F79A2-2), loc_1F7A7C-(Sw_1F79A2-2)
	include "src/f/1F7A7C.asm"
	include "src/f/1F7A82.asm"
	include "src/f/1F7A9E.asm"
	include "src/f/1F7AF8.asm"
Sw_1F7AF8:	; switch table of sub at $1F7AF8: 10 word offsets from Sw_1F7AF8-2
	dc.w	loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2)
	dc.w	loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2)
	dc.w	loc_1F7B36-(Sw_1F7AF8-2), loc_1F7B36-(Sw_1F7AF8-2)
	include "src/f/1F7B36.asm"
	include "src/f/1F7B3C.asm"
	include "src/f/1F7BB6.asm"
	include "src/f/1F7C0A.asm"
	include "src/f/1F7C6A.asm"
	include "src/f/1F7CFE.asm"
	include "src/f/1F7D5E.asm"
	include "src/f/1F7DAE.asm"
	include "src/f/1F7F38.asm"
	include "src/f/1F80CA.asm"
	include "src/f/1F82CC.asm"
	include "src/f/1F8454.asm"
	include "src/f/1F8494.asm"
	include "src/f/1F84BE.asm"
	include "src/f/1F85B6.asm"
	include "src/f/1F87B2.asm"
	include "src/f/1F883A.asm"
	incrom	$1F895C,$48
	include "src/f/1F89A4.asm"
	include "src/f/1F8ACA.asm"
	include "src/f/1F8AD6.asm"
	include "src/f/1F8AEE.asm"
	incrom	$1F8AF8,$4A
	include "src/f/1F8B42.asm"
	include "src/f/1F8EF6.asm"
	include "src/f/1F8F4C.asm"
	include "src/f/1F8FA2.asm"
	include "src/f/1F9122.asm"
	include "src/f/1F91E8.asm"
	include "src/f/1F9422.asm"
	include "src/f/1F944E.asm"
	include "src/f/1F945C.asm"
	include "src/f/1F9464.asm"
	include "src/f/1F949E.asm"
	include "src/f/1F94A6.asm"
	include "src/f/1F94B6.asm"
	include "src/f/1F94C4.asm"
	include "src/f/1F97A4.asm"
	include "src/f/1F97DE.asm"
	include "src/f/1F9804.asm"
	include "src/f/1F9850.asm"
	include "src/f/1F98A8.asm"
	include "src/f/1F9C60.asm"
	include "src/f/1F9C92.asm"
	include "src/f/1F9D04.asm"
	include "src/f/1F9D1E.asm"
	include "src/f/1F9D38.asm"
	include "src/f/1F9D52.asm"
	include "src/f/1F9DE8.asm"
	include "src/f/1F9E46.asm"
	include "src/f/1F9F0E.asm"
	include "src/f/1FA05A.asm"
	include "src/f/1FA0AE.asm"
	include "src/f/1FA124.asm"
	include "src/f/1FA6FE.asm"
	include "src/f/1FA7E8.asm"
Str_Empty_1FA876:	; C string "" (used by ClassList_InitAll)
	incrom	$1FA876,$2
	include "src/f/1FA878.asm"
	include "src/f/1FA8C4.asm"
	include "src/f/1FA8CC.asm"
	include "src/f/1FA8D4.asm"
	include "src/f/1FA8DC.asm"
	include "src/f/1FA924.asm"
Str_FreeMe:	; C string 'FREE ME': tag stored in a freed Mem_StackAlloc block header that is not at the top (Mem_StackFree)
	incrom	$1FA94E,$8
	include "src/f/1FA956.asm"
	include "src/f/1FA99C.asm"
	include "src/f/1FA9D2.asm"
	include "src/f/1FAA08.asm"
	include "src/f/1FAD08.asm"
Str_EmptyTag:	; empty C string: allocation tag used by Spr_PreloadToHeap for its Mem_StackAlloc mark block
	incrom	$1FAD42,$2
	include "src/f/1FAD44.asm"
	include "src/f/1FB026.asm"
	include "src/f/1FB126.asm"
	include "src/f/1FB142.asm"
	include "src/f/1FB178.asm"
	include "src/f/1FB1C2.asm"
	include "src/f/1FB346.asm"
	include "src/f/1FB592.asm"
Tbl_SprWidthLinked:	; 16 words: pixel width per hardware sprite size code 0-15 (((s>>2)+1)*8), mirrors x for h-flip in Spr_EmitPreLinked
	incrom	$1FB696,$20
Tbl_SprHeightLinked:	; 16 words: pixel height per sprite size code (((s&3)+1)*8), mirrors y for v-flip in Spr_EmitPreLinked
	incrom	$1FB6B6,$20
	include "src/f/1FB6D6.asm"
	include "src/f/1FB75A.asm"
Tbl_SprWidthPre:	; 16 words: pixel width per sprite size code, h-flip mirroring in Spr_EmitPre
	incrom	$1FB834,$20
Tbl_SprHeightPre:	; 16 words: pixel height per sprite size code, v-flip mirroring in Spr_EmitPre
	incrom	$1FB854,$20
	include "src/f/1FB874.asm"
	include "src/f/1FB8A2.asm"
Tbl_SprWidthPreClip:	; 16 words: pixel width per sprite size code, h-flip mirroring in Spr_EmitPreClip
	incrom	$1FB978,$20
Tbl_SprHeightPreClip:	; 16 words: pixel height per sprite size code, v-flip mirroring in Spr_EmitPreClip
	incrom	$1FB998,$20
	include "src/f/1FB9B8.asm"
	include "src/f/1FBA0C.asm"
Tbl_SprWidthStream:	; 16 words: pixel width per sprite size code, h-flip mirroring in Spr_EmitStream
	incrom	$1FBACE,$20
Tbl_SprHeightStream:	; 16 words: pixel height per sprite size code, v-flip mirroring in Spr_EmitStream
	incrom	$1FBAEE,$20
Tbl_SprTilesStream:	; 16 words: tiles per sprite size code (w*h/64), advances the tile number per piece in Spr_EmitStream
	incrom	$1FBB0E,$20
	include "src/f/1FBB2E.asm"
	include "src/f/1FBB5E.asm"
Tbl_SprWidthStreamClip:	; 16 words: pixel width per sprite size code, h-flip mirroring in Spr_EmitStreamClip
	incrom	$1FBC16,$20
Tbl_SprHeightStreamClip:	; 16 words: pixel height per sprite size code, v-flip mirroring in Spr_EmitStreamClip
	incrom	$1FBC36,$20
Tbl_SprTilesStreamClip:	; 16 words: tiles per sprite size code, tile advance in Spr_EmitStreamClip
	incrom	$1FBC56,$20
	include "src/f/1FBC76.asm"
	include "src/f/1FBCCE.asm"
Tbl_SprWidthStreamLinked:	; 16 words: pixel width per sprite size code, h-flip mirroring in Spr_EmitStreamLinked
	incrom	$1FBDBA,$20
Tbl_SprHeightStreamLinked:	; 16 words: pixel height per sprite size code, v-flip mirroring in Spr_EmitStreamLinked
	incrom	$1FBDDA,$20
Tbl_SprTilesStreamLinked:	; 16 words: tiles per sprite size code, tile advance in Spr_EmitStreamLinked
	incrom	$1FBDFA,$20
	include "src/f/1FBE1A.asm"
	include "src/f/1FBE96.asm"
Tbl_PixelPairExpand:	; 256 words: a byte of two 4bpp pixels hl -> word (h*$11, l*$11), each pixel doubled into a full byte; Spr_RenderToBitmap writes the non-zero bytes into a chunky pixel buffer
	incrom	$1FBFCC,$200
	include "src/f/1FC1CC.asm"
	include "src/f/1FC1FA.asm"
	include "src/f/1FC2A6.asm"
	include "src/f/1FC2E8.asm"
	include "src/f/1FC35C.asm"
Tbl_SizeCodePixels:	; 4 bytes 8,16,24,32: pixel extent per 2-bit sprite size field, used by Spr_RenderToBitmap to mirror flipped pieces
	incrom	$1FC462,$4
	include "src/f/1FC466.asm"
	include "src/f/1FC5FE.asm"
Str_ScalerData:	; C string "SCALER DATA" (used by sub_1FC5FE)
	incrom	$1FC6BE,$C
	include "src/f/1FC6CA.asm"
	include "src/f/1FC6F6.asm"
	include "src/f/1FC708.asm"
Tbl_1FC8FE:	; format not established; never read in the corpus; referenced by sub_1FC708
	incrom	$1FC8FE,$5A0
	include "src/f/1FCE9E.asm"
	include "src/f/1FD43E.asm"
	include "src/f/1FD520.asm"
Tbl_GridWidthBits:	; 4 bytes 0,4,8,12: (columns-1) << 2, or-ed with (rows-1) to form a sprite size code in sub_1FD520
	incrom	$1FD58C,$4
Tbl_SprSizeTilesGrid:	; 16 bytes: tiles per sprite size code (w*h/64), tile advance per piece in sub_1FD520
	incrom	$1FD590,$10
	include "src/f/1FD5A0.asm"
	include "src/f/1FD61E.asm"
	include "src/f/1FD720.asm"
	include "src/f/1FD72C.asm"
	include "src/f/1FD77E.asm"
	include "src/f/1FD8D2.asm"
	include "src/f/1FD998.asm"
	include "src/f/1FD9E8.asm"
	include "src/f/1FDA56.asm"
	include "src/f/1FDAEC.asm"
Sw_1FDAEC:	; switch table of sub at $1FDAEC: 4 word offsets from Sw_1FDAEC-2
	dc.w	loc_1FDB6A-(Sw_1FDAEC-2), loc_1FDB76-(Sw_1FDAEC-2), loc_1FDBC4-(Sw_1FDAEC-2), loc_1FDBD0-(Sw_1FDAEC-2)
	include "src/f/1FDB6A.asm"
	include "src/f/1FDB76.asm"
	include "src/f/1FDBC4.asm"
	include "src/f/1FDBD0.asm"
	include "src/f/1FDBDC.asm"
	include "src/f/1FDC18.asm"
	include "src/f/1FDC5C.asm"
	include "src/f/1FDC90.asm"
	include "src/f/1FDCCA.asm"
	include "src/f/1FDD0C.asm"
	include "src/f/1FDD26.asm"
	include "src/f/1FDD4C.asm"
Tbl_FadeBlack:	; palette fade table for Pal_StartFade/Pal_ApplyFade: 8 levels x 8 bytes, level L maps 3-bit component c to max(0, c-(7-L)) (level 0 black, 7 identity); reached as jt 2596 data (lea $5142(a5)) by the screen fades in Cerebro_Run/Failure_RunScene
	incrom	$1FDD56,$40
Tbl_FadeInvertWhite:	; palette fade table: 8 levels x 8 bytes, level L maps c to min(7, 7-c+L) (level 0 = inverted colours, level 7 = white); jt 2597 data, used once by SentinelsB2_FrameHook
	incrom	$1FDD96,$40
Tbl_ButtonConfigs:	; 6 control layouts x 8 bytes of joypad masks per action: a permutation of $20/$40/$10 (C/A/B), then $01 $02 $04 $08 (Up Down Left Right), 0; Pad_ConfigButtonMask(action) indexes it with the layout word -$38A6; jt 2598 data
	incrom	$1FDDD6,$30
Tbl_SprSizeTiles:	; 16 bytes: tiles per hardware sprite size code 0-15 (w*h/64), read by Spr_UploadFrame / Spr_PreloadTiles (jt 2599 data)
	incrom	$1FDE06,$10
Tbl_SprSizeWidth:	; 16 bytes: pixel width per sprite size code (((s>>2)+1)*8); jt 2600 data (sub_15AE48, sub_1CF432)
	incrom	$1FDE16,$10
Tbl_SprSizeHeight:	; 16 bytes: pixel height per sprite size code (((s&3)+1)*8); jt 2601 data
	incrom	$1FDE26,$10
Tbl_SineQuarter:	; 90 words: sin(0..89 deg) * $10000 (0 and 90 are special-cased in Math_SinDeg/Math_CosDeg)
	incrom	$1FDE36,$B4
	include "src/f/1FDEEA.asm"
	include "src/f/1FDEF8.asm"
	include "src/f/1FDF6C.asm"
	include "src/f/1FDFCE.asm"
	include "src/f/1FDFE8.asm"
	include "src/f/1FE002.asm"
	include "src/f/1FE018.asm"
	include "src/f/1FE01E.asm"
	include "src/f/1FE03C.asm"
	include "src/f/1FE052.asm"
	include "src/f/1FE05C.asm"
	include "src/f/1FE0EC.asm"
	include "src/f/1FE17A.asm"
	include "src/f/1FE28C.asm"
	include "src/f/1FE316.asm"
	include "src/f/1FE3D8.asm"
	include "src/f/1FE3EC.asm"
	include "src/f/1FE3F6.asm"
	include "src/f/1FE434.asm"
	include "src/f/1FE44E.asm"
	include "src/f/1FE48E.asm"
	include "src/f/1FE4B6.asm"
	include "src/f/1FE4FE.asm"
	include "src/f/1FE50A.asm"
	include "src/f/1FE518.asm"
	include "src/f/1FE528.asm"
	include "src/f/1FE544.asm"
	include "src/f/1FE584.asm"
	include "src/f/1FE5A2.asm"
	incrom	$1FE5B2,$2
	include "src/f/1FE5B4.asm"
	incrom	$1FE5C4,$2
	include "src/f/1FE5C6.asm"
	include "src/f/1FE5DC.asm"
	include "src/f/1FE5F2.asm"
	incrom	$1FE608,$10
	include "src/f/1FE618.asm"
	include "src/f/1FE630.asm"
	incrom	$1FE642,$2
	include "src/f/1FE644.asm"
Snd_Z80Driver:	; Z80 sound driver image: Z80_LoadDriver copies $1FE66C-$1FFED2 to Z80 RAM $A00000 (end address referenced as Snd_Z80Driver+$1867)
	incrom	$1FE66C,$1867
Snd_Z80DriverEnd:	; end marker of Snd_Z80Driver (Z80_LoadDriver copies up to here); one $00 byte
	incrom	$1FFED3,$1
Pad_RomEnd:	; $FF fill to the end of the 2 MB ROM (A5Params $204 points here)
	incrom	$1FFED4,$12C
