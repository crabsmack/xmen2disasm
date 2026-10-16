; ---------------------------------------------------------------------------
; Level_LoadMaps - set up the FG/BG plane maps and their tiles: decode Enigma layouts and block tables, load the used tiles, assign block slots, set initial scroll
; In:  8(a6) = FG map   $C(a6) = FG tileset (0 = same)   $10(a6) = BG map   $14(a6) = BG tileset   $18/$1C(a6) = words: start x, y   $20..$27(a6) = bytes: priority/palette/no-wrap flags
; Out: none
; Evidence: map blob: +1 high nibble = compressed, +2/+4 width/height in cells (>>2 = 32-px blocks), +$A Enigma block layout, tileset +6 tile count, +8 block count, +$C Enigma block definitions (4x4 tile words), +$E tiles (raw: VDP_WriteWords; compressed: Level_LoadUsedTiles); Eni_Decode into Mem_StackAlloc blocks; row-offset tables per map; writes plane scroll to VRAM $F400/VSRAM; calls the plane draw hook $FFC7B0
; ---------------------------------------------------------------------------
Level_LoadMaps:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	beq.s	loc_1F57B0
	tst.l	$14(a6)
	beq.s	loc_1F57B0
	cmpa.l	$14(a6),a3
	bne.s	loc_1F57B0
	move.b	#$1,-$1(a6)
	bra.s	loc_1F57B4
loc_1F57B0:
	clr.b	-$1(a6)
loc_1F57B4:
	jsr	Scroll_Init(pc)
	move.b	$2F(a6),d7
	move.b	d7,g_BgWrapX(a5)
	move.b	d7,g_BgWrapY(a5)
	move.l	a4,d0
	beq.s	loc_1F57CE
	move.b	#$1,g_FgMapPresent(a5)
loc_1F57CE:
	move.l	a3,d0
	bne.s	loc_1F57D4
	movea.l	a4,a3
loc_1F57D4:
	move.w	$1A(a6),d0
	sub.w	g_StartCamOffsetX(a5),d0
	move.w	d0,g_CameraX(a5)
	move.w	$1E(a6),d0
	sub.w	g_StartCamOffsetY(a5),d0
	move.w	d0,g_CameraY(a5)
	tst.b	g_FgMapPresent(a5)
	beq.s	loc_1F5854
	move.l	a4,d6
	movea.l	d6,a0
	move.w	$2(a0),d7
	movea.l	d6,a0
	move.w	$4(a0),d5
	ext.l	d7
	move.l	d7,d6
	move.l	d6,d0
	moveq	#$40,d1
	sub.l	d1,d0
	lsl.l	#$3,d0
	move.w	d0,g_FgMapExtraW(a5)
	ext.l	d5
	move.l	d5,d4
	move.l	d4,d0
	moveq	#$20,d2
	sub.l	d2,d0
	lsl.l	#$3,d0
	move.w	d0,g_FgMapExtraH(a5)
	move.l	d6,d0
	moveq	#$28,d1
	sub.l	d1,d0
	lsl.l	#$3,d0
	move.w	d0,g_CamMaxX(a5)
	clr.w	g_CamMinX(a5)
	move.l	d4,d0
	moveq	#$1C,d1
	sub.l	d1,d0
	lsl.l	#$3,d0
	move.w	d0,g_CamMaxY(a5)
	clr.w	g_CamMinY(a5)
	move.w	g_CamMaxX(a5),g_CamMaxXTarget(a5)
	clr.w	g_CamMinXTarget(a5)
	move.w	g_CamMaxY(a5),g_CamMaxYTarget(a5)
	clr.w	g_CamMinYTarget(a5)
loc_1F5854:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMaxX(a5),d0
	ble.s	loc_1F5864
	move.w	g_CamMaxX(a5),g_CameraX(a5)
loc_1F5864:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMinX(a5),d0
	bge.s	loc_1F5874
	move.w	g_CamMinX(a5),g_CameraX(a5)
loc_1F5874:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMaxY(a5),d0
	ble.s	loc_1F5884
	move.w	g_CamMaxY(a5),g_CameraY(a5)
loc_1F5884:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMinY(a5),d0
	bge.s	loc_1F5894
	move.w	g_CamMinY(a5),g_CameraY(a5)
loc_1F5894:
	lea.l	Cam_SetPosScaled(pc),a0
	cmpa.l	g_CamSetPosHook(a5),a0
	bne.s	loc_1F58C2
	move.w	g_FgScrollFactorX(a5),d0
	muls.w	g_CameraX(a5),d0
	asr.l	#$8,d0
	add.w	g_FgScrollBaseX(a5),d0
	move.w	d0,g_FgScrollX(a5)
	move.w	g_FgScrollFactorY(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	g_FgScrollBaseY(a5),d0
	move.w	d0,g_FgScrollY(a5)
loc_1F58C2:
	tst.b	g_BgLockToObj(a5)
	beq.s	loc_1F5902
	movea.l	g_BgLockObj(a5),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	g_BgOffsetX(a5),d1
	sub.w	d0,d1
	move.w	d1,g_BgScrollX(a5)
	movea.l	g_BgLockObj(a5),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	g_BgOffsetY(a5),d1
	sub.w	d0,d1
	move.w	d1,g_BgScrollY(a5)
	bra.s	loc_1F595C
loc_1F5902:
	move.w	g_BgScrollFactorX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Math_MulFix8(pc)
	move.w	d0,g_BgScrollX(a5)
	lea.l	Cam_SetPosScaled(pc),a0
	cmpa.l	g_CamSetPosHook(a5),a0
	addq.w	#$8,a7
	bne.s	loc_1F593A
	move.w	g_BgScrollFactorY(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	g_BgScrollBaseY(a5),d0
	move.w	d0,g_BgScrollY(a5)
	bra.s	loc_1F595C
loc_1F593A:
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.w	g_FgScrollBaseY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	g_BgScrollFactorY(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> Math_LMul
	asr.l	#$8,d0
	add.w	g_BgScrollBaseY(a5),d0
	move.w	d0,g_BgScrollY(a5)
loc_1F595C:
	tst.b	g_BgWrapX(a5)
	beq.s	loc_1F5968
	andi.w	#$1FF,g_BgScrollX(a5)
loc_1F5968:
	tst.b	g_BgWrapY(a5)
	beq.s	loc_1F5974
	andi.w	#$FF,g_BgScrollY(a5)
loc_1F5974:
	move.w	g_FgScrollX(a5),d0
	ext.l	d0
	move.w	#$FFE0,d1
	and.w	d0,d1
	sub.w	#$60,d1
	move.w	d1,g_FgStreamX(a5)
	bge.s	loc_1F598E
	clr.w	g_FgStreamX(a5)
loc_1F598E:
	move.w	g_FgScrollY(a5),d0
	ext.l	d0
	move.w	#$FFF8,d1
	and.w	d0,d1
	subq.w	#$8,d1
	move.w	d1,g_FgStreamY(a5)
	bge.s	loc_1F59A6
	clr.w	g_FgStreamY(a5)
loc_1F59A6:
	move.w	g_BgScrollX(a5),d0
	ext.l	d0
	move.w	#$FFE0,d1
	and.w	d0,d1
	sub.w	#$60,d1
	move.w	d1,g_BgStreamX(a5)
	bge.s	loc_1F59C0
	clr.w	g_BgStreamX(a5)
loc_1F59C0:
	move.w	g_BgScrollY(a5),d0
	ext.l	d0
	move.w	#$FFF8,d1
	and.w	d0,d1
	subq.w	#$8,d1
	move.w	d1,g_BgStreamY(a5)
	bge.s	loc_1F59D8
	clr.w	g_BgStreamY(a5)
loc_1F59D8:
	move.l	a4,d0
	beq.w	loc_1F5D2C
	lea.l	$40F2(a5),a0
	move.l	a0,g_MapRowHook(a5)
	lea.l	$40FA(a5),a0
	move.l	a0,g_MapColHook(a5)
	move.l	a4,g_LoadedFgMap(a5)
	move.w	$2(a4),d0
	asr.w	#$2,d0
	move.w	d0,g_FgMapW(a5)
	move.w	$4(a4),d0
	asr.w	#$2,d0
	move.w	d0,g_FgMapH(a5)
	move.w	$6(a3),d5
	move.b	$1(a4),d0
	ext.w	d0
	move.w	#$F0,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	tst.l	d0
	bne.s	loc_1F5A5C
	moveq	#$0,d0
	move.w	$A(a4),d0
	add.l	a4,d0
	move.l	d0,g_FgBlockMap(a5)
	moveq	#$0,d0
	move.w	$C(a3),d0
	add.l	a3,d0
	move.l	d0,g_FgBlockDefs(a5)
	move.l	#$40000000,($C00004).l
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.w	$E(a3),d0
	add.l	a3,d0
	move.l	d0,-(a7)
	jsr	$519A(a5)	; -> VDP_WriteWords
	addq.w	#$8,a7
	bra.w	loc_1F5CD2
loc_1F5A5C:
	pea.l	Str_MapBufTagFg(pc)
	move.w	g_FgMapW(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.w	g_FgMapH(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> Math_LMul
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_FgBlockMap(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	g_FgBlockMap(a5),-(a7)
	moveq	#$0,d1
	move.w	$A(a4),d1
	add.l	a4,d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	tst.l	$10(a6)
	lea.l	$14(a7),a7
	beq.w	loc_1F5B22
	move.w	#$80,g_MapFirstTile(a5)
	move.b	#$1,g_BgMapPresent(a5)
	movea.l	$10(a6),a0
	move.w	$2(a0),d0
	asr.w	#$2,d0
	move.w	d0,g_BgMapW(a5)
	moveq	#$10,d0
	cmp.w	g_BgMapW(a5),d0
	ble.s	loc_1F5AC6
	move.b	#$1,g_BgNarrow(a5)
loc_1F5AC6:
	movea.l	$10(a6),a0
	move.w	$4(a0),d0
	asr.w	#$2,d0
	move.w	d0,g_BgMapH(a5)
	tst.l	$14(a6)
	bne.s	loc_1F5AE0
	move.l	$10(a6),$14(a6)
loc_1F5AE0:
	pea.l	Str_MapBufTagBg(pc)
	move.w	g_BgMapW(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.w	g_BgMapH(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> Math_LMul
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_BgBlockMap(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	g_BgBlockMap(a5),-(a7)
	movea.l	$10(a6),a0
	moveq	#$0,d1
	move.w	$A(a0),d1
	add.l	$10(a6),d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	lea.l	$14(a7),a7
	bra.s	loc_1F5B2C
loc_1F5B22:
	move.w	#$80,g_MapFirstTile(a5)
	clr.b	g_BgMapPresent(a5)
loc_1F5B2C:
	moveq	#$20,d0
	and.b	(a4),d0
	beq.s	loc_1F5B36
	moveq	#$0,d0
	bra.s	loc_1F5B38
loc_1F5B36:
	moveq	#$1,d0
loc_1F5B38:
	move.b	d0,d7
	move.w	$8(a3),g_FgBlockCount(a5)
	move.l	g_HeapTop(a5),-$6(a6)
	pea.l	Str_MapBufTags(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	g_HeapTop(a5),g_FgBlockDefs(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	moveq	#$0,d1
	move.w	$C(a3),d1
	add.l	a3,d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	tst.b	-$1(a6)
	beq.s	loc_1F5B78
	moveq	#$0,d0
	bra.s	loc_1F5B7E
loc_1F5B78:
	moveq	#$0,d0
	move.b	d7,d0
	tst.l	d0
loc_1F5B7E:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	move.l	g_FgBlockMap(a5),-(a7)
	move.w	g_MapFirstTile(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	Level_LoadUsedTiles(pc)
	move.w	d0,d5
	move.w	g_UsedBlockCount(a5),g_FgBlockCount(a5)
	move.w	g_MapFirstTile(a5),d0
	add.w	d5,d0
	move.w	d0,g_FgTilesEnd(a5)
	ext.l	d5
	move.l	d5,-(a7)
	move.l	g_FgBlockDefs(a5),-(a7)
	move.l	g_FgBlockMap(a5),-(a7)
	move.l	a4,-(a7)
	jsr	Level_AssignBlockSlots(pc)
	move.w	d0,d7
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$4,d0
	add.w	d0,d5
	tst.l	$10(a6)
	lea.l	$3C(a7),a7
	beq.w	loc_1F5CC0
	tst.b	-$1(a6)
	beq.s	loc_1F5C06
	move.w	g_FgBlockCount(a5),g_BgBlockCount(a5)
	move.l	g_FgBlockDefs(a5),g_BgBlockDefs(a5)
	move.w	d5,d6
	move.w	d6,d4
	move.w	g_MapFirstTile(a5),d0
	add.w	d6,d0
	move.w	d0,g_BgTilesEnd(a5)
	lea.l	Str_AbTilesSharing(pc),a0
	movea.l	-$6(a6),a1
	move.l	a0,$4(a1)
	bra.w	loc_1F5C9C
loc_1F5C06:
	movea.l	-$6(a6),a0
	move.l	g_HeapTop(a5),(a0)
	lea.l	Str_APlaneTiles(pc),a0
	movea.l	-$6(a6),a1
	move.l	a0,$4(a1)
	movea.l	-$6(a6),a0
	move.l	(a0),-$6(a6)
	pea.l	Str_BTilesTag(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	$14(a6),a0
	move.w	$8(a0),g_BgBlockCount(a5)
	move.l	g_HeapTop(a5),g_BgBlockDefs(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	g_BgBlockDefs(a5),-(a7)
	movea.l	$14(a6),a0
	moveq	#$0,d1
	move.w	$C(a0),d1
	add.l	$14(a6),d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	g_BgBlockDefs(a5),-(a7)
	move.l	g_BgBlockMap(a5),-(a7)
	ext.l	d5
	move.w	g_MapFirstTile(a5),d1
	ext.l	d1
	add.l	d5,d1
	move.l	d1,-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	jsr	Level_LoadUsedTiles(pc)
	move.w	d0,d4
	move.w	g_UsedBlockCount(a5),g_BgBlockCount(a5)
	ext.l	d5
	ext.l	d4
	move.l	d5,d0
	add.l	d4,d0
	move.w	g_MapFirstTile(a5),d1
	add.w	d0,d1
	move.w	d1,g_BgTilesEnd(a5)
	lea.l	$2C(a7),a7
loc_1F5C9C:
	ext.l	d4
	move.l	d4,-(a7)
	move.l	g_BgBlockDefs(a5),-(a7)
	move.l	g_BgBlockMap(a5),-(a7)
	move.l	$10(a6),-(a7)
	jsr	Level_AssignBlockSlots(pc)
	move.w	d0,d7
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$4,d0
	add.w	d0,d4
	lea.l	$10(a7),a7
	bra.s	loc_1F5CD2
loc_1F5CC0:
	clr.w	g_BgBlockCount(a5)
	clr.w	d4
	lea.l	Str_APlaneTilesNoB(pc),a0
	movea.l	-$6(a6),a1
	move.l	a0,$4(a1)
loc_1F5CD2:
	movea.l	-$6(a6),a0
	move.l	g_HeapTop(a5),(a0)
	moveq	#$7,d0
	cmp.w	g_FgMapH(a5),d0
	bge.s	loc_1F5CEA
	addi.w	#$100,g_FgStreamY(a5)
	bra.s	loc_1F5CF0
loc_1F5CEA:
	addi.w	#$E0,g_FgStreamY(a5)
loc_1F5CF0:
	pea.l	Str_RowTableTagFg(pc)
	move.w	g_FgMapH(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_FgRowTable(a5)
	clr.w	d6
	clr.w	d7
	addq.w	#$8,a7
	bra.s	loc_1F5D24
loc_1F5D0E:
	ext.l	d7
	movea.l	g_FgRowTable(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	d6,(a0,d0.l)
	add.w	g_FgMapW(a5),d6
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F5D24:
	cmp.w	g_FgMapH(a5),d7
	blt.s	loc_1F5D0E
	bra.s	loc_1F5D32
loc_1F5D2C:
	move.w	#$80,g_MapFirstTile(a5)
loc_1F5D32:
	tst.l	$10(a6)
	bne.s	loc_1F5D52
	clr.b	g_BgMapPresent(a5)
	move.w	g_MapFirstTile(a5),d0
	add.w	d5,d0
	move.w	d0,g_MapTilesEnd(a5)
	clr.w	g_BgScrollX(a5)
	clr.w	g_BgScrollY(a5)
	bra.w	loc_1F5DFE
loc_1F5D52:
	tst.l	$14(a6)
	bne.s	loc_1F5D5E
	move.l	$10(a6),$14(a6)
loc_1F5D5E:
	move.b	#$1,g_BgMapPresent(a5)
	movea.l	$10(a6),a0
	move.w	$2(a0),d0
	asr.w	#$2,d0
	move.w	d0,g_BgMapW(a5)
	movea.l	$10(a6),a0
	move.w	$4(a0),d0
	asr.w	#$2,d0
	move.w	d0,g_BgMapH(a5)
	tst.b	-$1(a6)
	beq.s	loc_1F5D9E
	move.w	g_MapFirstTile(a5),-$8(a6)
	move.w	-$8(a6),g_BgFirstTile(a5)
	move.w	-$8(a6),d0
	add.w	d4,d0
	move.w	d0,g_MapTilesEnd(a5)
	bra.s	loc_1F5DAE
loc_1F5D9E:
	move.w	g_MapFirstTile(a5),d0
	add.w	d5,d0
	move.w	d0,g_BgFirstTile(a5)
	add.w	d4,d0
	move.w	d0,g_MapTilesEnd(a5)
loc_1F5DAE:
	moveq	#$7,d0
	cmp.w	g_BgMapH(a5),d0
	bge.s	loc_1F5DBE
	addi.w	#$100,g_BgStreamY(a5)
	bra.s	loc_1F5DC4
loc_1F5DBE:
	addi.w	#$E0,g_BgStreamY(a5)
loc_1F5DC4:
	pea.l	Str_RowTableTags(pc)
	move.w	g_BgMapH(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_BgRowTable(a5)
	clr.w	d6
	clr.w	d7
	addq.w	#$8,a7
	bra.s	loc_1F5DF8
loc_1F5DE2:
	ext.l	d7
	movea.l	g_BgRowTable(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	d6,(a0,d0.l)
	add.w	g_BgMapW(a5),d6
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F5DF8:
	cmp.w	g_BgMapH(a5),d7
	blt.s	loc_1F5DE2
loc_1F5DFE:
	move.w	g_MapFirstTile(a5),g_FgTileAttr(a5)
	tst.b	g_FgMapPresent(a5)
	beq.s	loc_1F5E1C
	tst.b	-$1(a6)
	bne.s	loc_1F5E1C
	move.w	g_MapFirstTile(a5),d0
	add.w	d5,d0
	move.w	d0,g_BgTileAttr(a5)
	bra.s	loc_1F5E22
loc_1F5E1C:
	move.w	g_MapFirstTile(a5),g_BgTileAttr(a5)
loc_1F5E22:
	tst.b	$23(a6)
	beq.s	loc_1F5E2E
	ori.w	#$8000,g_FgTileAttr(a5)
loc_1F5E2E:
	tst.b	$27(a6)
	beq.s	loc_1F5E3A
	ori.w	#$8000,g_BgTileAttr(a5)
loc_1F5E3A:
	tst.b	$2B(a6)
	beq.s	loc_1F5E46
	addi.w	#$4000,g_BgTileAttr(a5)
loc_1F5E46:
	move.l	#$74000003,($C00004).l
	move.w	#$1FF,d0
	and.w	g_FgScrollX(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	neg.l	d1
	move.w	d1,($C00000).l
	move.l	#$40000010,($C00004).l
	move.w	#$FF,d0
	and.w	g_FgScrollY(a5),d0
	move.w	d0,($C00000).l
	move.l	#$74020003,($C00004).l
	move.w	#$1FF,d0
	and.w	g_BgScrollX(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	neg.l	d1
	move.w	d1,($C00000).l
	move.l	#$40020010,($C00004).l
	move.w	#$FF,d0
	and.w	g_BgScrollY(a5),d0
	move.w	d0,($C00000).l
	clr.b	g_BgWrapX(a5)
	clr.b	g_BgWrapY(a5)
	tst.b	$2F(a6)
	beq.s	loc_1F5ED2
	clr.w	g_BgStreamX(a5)
	move.w	#$100,g_BgStreamY(a5)
	clr.w	g_BgScrollX(a5)
	clr.w	g_BgScrollY(a5)
loc_1F5ED2:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	g_MapRowHook(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	$2F(a6),d5
	move.b	d5,g_BgWrapX(a5)
	move.b	d5,g_BgWrapY(a5)
	move.l	g_HeapTop(a5),g_MapsHeapEnd(a5)
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
