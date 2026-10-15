; ---------------------------------------------------------------------------
; Level_Load - load a level: clear VRAM, set music, palettes, maps, floor segments, spawn records and reset all per-level systems
; In:  8(a6) = FG map blob   $C(a6) = FG tileset blob   $10(a6) = BG map blob   $14(a6) = BG tileset   $18(a6)/$1C(a6) = floor-segment lists for FG/BG (Seg_LoadList)   $20..$2C(a6) = flags   $32(a6) = word: class-init arg   $36(a6) = word: music track (-1 none)   $3A/$3E(a6) = words: x/y cell-size shifts of the level grid (cell counts at $FFCD7E/$FFCD7C, read by Seg_GridCell)   $40(a6) = byte: spawn list from BG map   $44(a6) = class list
; Out: none
; Evidence: display off, VDP_ClearVram/VDP_ClearVsram, g_HeapTop = $FF0000; Snd_SetParam(0, track/$7F), Music_Play; g_PalBase line 0/1 from map +$10 palette offsets (16 words); Level_LoadMaps; map size words +2/+4 (cells); Seg_LoadList; spawn list at map +$12 (word count, 16-byte entries) -> Spawn_InitRecords; window limits for spawn/activate; DrawList_Init, Timer_InitAll; reads ROM level headers (data reader)
; ---------------------------------------------------------------------------
Level_Load:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.b	$2B(a6),d6
	andi.w	#$FFBF,g_VdpReg1(a5)
	move.w	g_VdpReg1(a5),($C00004).l
	jsr	$5182(a5)	; -> VDP_ClearVram
	jsr	$518A(a5)	; -> VDP_ClearVsram
	move.l	#$FF0000,g_HeapTop(a5)
	move.l	$8(a6),-$CAE(a5)
	move.l	$10(a6),-$CB2(a5)
	move.b	#$1,-$13F0(a5)
	clr.b	-$13EE(a5)
	clr.b	-$35CA(a5)
	clr.b	-$3BBA(a5)
	movea.l	-$38E8(a5),a0
	jsr	(a0)
	move.w	$36(a6),g_MusicTrack(a5)
	moveq	#-$1,d0
	cmp.w	g_MusicTrack(a5),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F990C
	moveq	#$7F,d0
	bra.s	loc_1F9910
loc_1F990C:
	move.w	g_MusicTrack(a5),d0
loc_1F9910:
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#-$1,d0
	cmp.w	g_MusicTrack(a5),d0
	lea.l	$10(a7),a7
	beq.s	loc_1F9942
	move.w	g_MusicTrack(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Music_Play(pc)
	addq.w	#$4,a7
loc_1F9942:
	move.l	$44(a6),g_ClassList(a5)
	move.l	$8(a6),d7
	movea.l	d7,a0
	moveq	#$0,d0
	move.w	$10(a0),d0
	tst.l	d0
	movea.l	d0,a3
	adda.l	d7,a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_1F995E:
	move.l	d7,d0
	add.l	d0,d0
	add.l	a3,d0
	movea.l	d0,a0
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a1
	move.w	(a0),(a1,d0.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_1F995E
	tst.l	$10(a6)
	beq.s	loc_1F99B6
	tst.b	d6
	beq.s	loc_1F99B6
	move.l	$10(a6),d5
	movea.l	d5,a0
	moveq	#$0,d0
	move.w	$10(a0),d0
	tst.l	d0
	movea.l	d0,a3
	adda.l	d5,a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_1F999A:
	move.l	d7,d0
	add.l	d0,d0
	add.l	a3,d0
	movea.l	d0,a0
	move.l	d7,d0
	add.w	d0,d0
	lea.l	-$3940(a5),a1
	move.w	(a0),(a1,d0.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_1F999A
loc_1F99B6:
	moveq	#$0,d0
	move.b	$2F(a6),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	d6,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$27(a6),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$23(a6),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	$4E1A(a5)	; -> Level_LoadMaps
	moveq	#$0,d0
	move.l	d0,g_CamShake(a5)
	move.w	-$3A9E(a5),g_VramTileCursor(a5)
	move.w	#$2,-$388A(a5)
	moveq	#$0,d7
	moveq	#$25,d3
	lea.l	$28(a7),a7
loc_1F9A08:
	move.l	d7,d0
	asl.w	#$2,d0
	lea.l	g_SegTypeHooks(a5),a0
	moveq	#$0,d1
	move.l	d1,(a0,d0.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_1F9A08
	lea.l	$4FA2(a5),a0
	move.l	a0,-$135E(a5)
	clr.w	g_SpriteDefCount(a5)
	lea.l	g_SpriteDefs(a5),a4
	moveq	#$0,d7
	moveq	#$23,d3
loc_1F9A32:
	moveq	#$1,d0
	move.l	d0,$2(a4)
	clr.w	$6(a4)
	lea.l	$14(a4),a4
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_1F9A32
	move.w	$3A(a6),-$347E(a5)
	move.w	$3E(a6),-$3480(a5)
	tst.l	$18(a6)
	beq.s	loc_1F9A90
	move.l	$8(a6),d7
	movea.l	d7,a0
	move.w	$2(a0),d0
	ext.l	d0
	asl.l	#$3,d0
	subq.l	#$1,d0
	move.w	-$347E(a5),d1
	asr.l	d1,d0
	addq.w	#$1,d0
	move.w	d0,-$3482(a5)
	movea.l	d7,a0
	move.w	$4(a0),d0
	ext.l	d0
	asl.l	#$3,d0
	subq.l	#$1,d0
	move.w	-$3480(a5),d1
	asr.l	d1,d0
	addq.w	#$1,d0
	move.w	d0,-$3484(a5)
	bra.s	loc_1F9AC4
loc_1F9A90:
	move.l	$10(a6),d7
	movea.l	d7,a0
	move.w	$2(a0),d0
	ext.l	d0
	asl.l	#$3,d0
	subq.l	#$1,d0
	move.w	-$347E(a5),d1
	asr.l	d1,d0
	addq.w	#$1,d0
	move.w	d0,-$3482(a5)
	movea.l	d7,a0
	move.w	$4(a0),d0
	ext.l	d0
	asl.l	#$3,d0
	subq.l	#$1,d0
	move.w	-$3480(a5),d1
	asr.l	d1,d0
	addq.w	#$1,d0
	move.w	d0,-$3484(a5)
loc_1F9AC4:
	jsr	$4ECA(a5)	; -> sub_1F6BD2
	tst.l	$18(a6)
	beq.s	loc_1F9ADC
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$18(a6),-(a7)
	jsr	$4ED2(a5)	; -> Seg_LoadList
	addq.w	#$8,a7
loc_1F9ADC:
	tst.l	$1C(a6)
	beq.s	loc_1F9AF0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$1C(a6),-(a7)
	jsr	$4ED2(a5)	; -> Seg_LoadList
	addq.w	#$8,a7
loc_1F9AF0:
	move.w	$32(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$401A(a5)	; -> Obj_AllocPool
	tst.b	$43(a6)
	addq.w	#$4,a7
	beq.s	loc_1F9B0A
	movea.l	$10(a6),a4
	bra.s	loc_1F9B0E
loc_1F9B0A:
	movea.l	$8(a6),a4
loc_1F9B0E:
	movea.l	a4,a3
	moveq	#$0,d0
	move.w	$12(a3),d0
	tst.l	d0
	adda.l	d0,a4
	movea.l	a4,a3
	move.w	(a3)+,g_SpawnRecCount(a5)
	move.l	a3,g_PlacementList(a5)
	jsr	$4132(a5)	; -> Spawn_InitRecords
	jsr	$4FB2(a5)	; -> Scene_ClearActivateHook
	jsr	ClassList_CallSlot5A(pc)
	move.b	#$1,-$38B4(a5)
	clr.b	-$3ABA(a5)
	move.b	#$1,-$3890(a5)
	move.b	#$1,-$3894(a5)
	clr.w	-$3896(a5)
	moveq	#$0,d0
	move.l	d0,-$38A0(a5)
	clr.b	-$35C8(a5)
	clr.w	d7
	moveq	#$8,d3
loc_1F9B58:
	move.l	d7,d0
	asl.w	#$2,d0
	lea.l	-$3AF8(a5),a0
	moveq	#$0,d1
	move.l	d1,(a0,d0.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F9B58
	move.w	#$A0,-$389C(a5)
	moveq	#$0,d0
	move.l	d0,g_Camera(a5)
	clr.b	-$3892(a5)
	move.l	d0,g_ParallaxDesc(a5)
	lea.l	$510A(a5),a0
	move.l	a0,-$3A48(a5)
	lea.l	sub_1F9E46(pc),a0
	move.l	a0,-$3A4C(a5)
	move.l	d0,-$38CA(a5)
	move.l	d0,-$38CE(a5)
	move.w	#$FFFF,-$38D0(a5)
	move.l	d0,g_FrameCounter(a5)
	move.b	#$1,-$38DE(a5)
	clr.b	-$38B8(a5)
	lea.l	$4EFA(a5),a0
	move.l	a0,-$3488(a5)
	lea.l	$4FAA(a5),a0
	move.l	a0,g_SceneFrameHook(a5)
	lea.l	$4F82(a5),a0
	move.l	a0,-$38F4(a5)
	jsr	$4F62(a5)	; -> DrawList_Init
	move.b	d0,d7
	move.w	#$FF80,-$35A6(a5)
	move.w	#$1C0,-$35A8(a5)
	move.w	#$FF80,-$35A4(a5)
	move.w	#$160,-$35AA(a5)
	move.w	#$FF00,-$35AE(a5)
	move.w	#$240,-$35B0(a5)
	move.w	#$FF00,-$35AC(a5)
	move.w	#$1E0,-$35B2(a5)
	move.w	#$FF9C,-$35C0(a5)
	move.w	#$1A4,-$35C2(a5)
	move.w	#$FFCE,-$35C4(a5)
	move.w	#$13A,-$35C6(a5)
	move.w	#$FFA6,-$35B8(a5)
	move.w	#$19A,-$35BA(a5)
	move.w	#$FFD8,-$35BC(a5)
	move.w	#$130,-$35BE(a5)
	clr.b	-$38BA(a5)
	moveq	#$0,d0
	move.l	d0,-$CA6(a5)
	lea.l	$3FB2(a5),a0
	move.l	a0,g_PauseHandler(a5)
	clr.b	-$1662(a5)
	move.b	#$1,-$1660(a5)
	jsr	Timer_InitAll(pc)
	jsr	$405A(a5)	; -> HitList_Init
	movea.l	-$38EC(a5),a0
	jsr	(a0)
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
