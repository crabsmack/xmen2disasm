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
	move.b	d7,-$3AB4(a5)
	move.b	d7,-$3AB6(a5)
	move.l	a4,d0
	beq.s	loc_1F57CE
	move.b	#$1,-$3A62(a5)
loc_1F57CE:
	move.l	a3,d0
	bne.s	loc_1F57D4
	movea.l	a4,a3
loc_1F57D4:
	move.w	$1A(a6),d0
	sub.w	-$389C(a5),d0
	move.w	d0,g_CameraX(a5)
	move.w	$1E(a6),d0
	sub.w	-$389A(a5),d0
	move.w	d0,g_CameraY(a5)
	tst.b	-$3A62(a5)
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
	move.w	d0,-$3A5E(a5)
	ext.l	d5
	move.l	d5,d4
	move.l	d4,d0
	moveq	#$20,d2
	sub.l	d2,d0
	lsl.l	#$3,d0
	move.w	d0,-$3A60(a5)
	move.l	d6,d0
	moveq	#$28,d1
	sub.l	d1,d0
	lsl.l	#$3,d0
	move.w	d0,-$3A8E(a5)
	clr.w	-$3A90(a5)
	move.l	d4,d0
	moveq	#$1C,d1
	sub.l	d1,d0
	lsl.l	#$3,d0
	move.w	d0,-$3A92(a5)
	clr.w	-$3A94(a5)
	move.w	-$3A8E(a5),-$3A96(a5)
	clr.w	-$3A98(a5)
	move.w	-$3A92(a5),-$3A9A(a5)
	clr.w	-$3A9C(a5)
loc_1F5854:
	move.w	g_CameraX(a5),d0
	cmp.w	-$3A8E(a5),d0
	ble.s	loc_1F5864
	move.w	-$3A8E(a5),g_CameraX(a5)
loc_1F5864:
	move.w	g_CameraX(a5),d0
	cmp.w	-$3A90(a5),d0
	bge.s	loc_1F5874
	move.w	-$3A90(a5),g_CameraX(a5)
loc_1F5874:
	move.w	g_CameraY(a5),d0
	cmp.w	-$3A92(a5),d0
	ble.s	loc_1F5884
	move.w	-$3A92(a5),g_CameraY(a5)
loc_1F5884:
	move.w	g_CameraY(a5),d0
	cmp.w	-$3A94(a5),d0
	bge.s	loc_1F5894
	move.w	-$3A94(a5),g_CameraY(a5)
loc_1F5894:
	lea.l	sub_1F60E4(pc),a0
	cmpa.l	-$38F8(a5),a0
	bne.s	loc_1F58C2
	move.w	-$3492(a5),d0
	muls.w	g_CameraX(a5),d0
	asr.l	#$8,d0
	add.w	-$349A(a5),d0
	move.w	d0,-$3AC2(a5)
	move.w	-$3494(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	-$349E(a5),d0
	move.w	d0,-$3AC4(a5)
loc_1F58C2:
	tst.b	-$3ABA(a5)
	beq.s	loc_1F5902
	movea.l	-$3AFE(a5),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	-$3ABC(a5),d1
	sub.w	d0,d1
	move.w	d1,-$3AC6(a5)
	movea.l	-$3AFE(a5),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	-$3ABE(a5),d1
	sub.w	d0,d1
	move.w	d1,-$3AC8(a5)
	bra.s	loc_1F595C
loc_1F5902:
	move.w	-$3496(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Math_MulFix8(pc)
	move.w	d0,-$3AC6(a5)
	lea.l	sub_1F60E4(pc),a0
	cmpa.l	-$38F8(a5),a0
	addq.w	#$8,a7
	bne.s	loc_1F593A
	move.w	-$3498(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	-$34A0(a5),d0
	move.w	d0,-$3AC8(a5)
	bra.s	loc_1F595C
loc_1F593A:
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.w	-$349E(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	-$3498(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> Math_LMul
	asr.l	#$8,d0
	add.w	-$34A0(a5),d0
	move.w	d0,-$3AC8(a5)
loc_1F595C:
	tst.b	-$3AB4(a5)
	beq.s	loc_1F5968
	andi.w	#$1FF,-$3AC6(a5)
loc_1F5968:
	tst.b	-$3AB6(a5)
	beq.s	loc_1F5974
	andi.w	#$FF,-$3AC8(a5)
loc_1F5974:
	move.w	-$3AC2(a5),d0
	ext.l	d0
	move.w	#$FFE0,d1
	and.w	d0,d1
	sub.w	#$60,d1
	move.w	d1,-$3ACA(a5)
	bge.s	loc_1F598E
	clr.w	-$3ACA(a5)
loc_1F598E:
	move.w	-$3AC4(a5),d0
	ext.l	d0
	move.w	#$FFF8,d1
	and.w	d0,d1
	subq.w	#$8,d1
	move.w	d1,-$3ACC(a5)
	bge.s	loc_1F59A6
	clr.w	-$3ACC(a5)
loc_1F59A6:
	move.w	-$3AC6(a5),d0
	ext.l	d0
	move.w	#$FFE0,d1
	and.w	d0,d1
	sub.w	#$60,d1
	move.w	d1,-$3ACE(a5)
	bge.s	loc_1F59C0
	clr.w	-$3ACE(a5)
loc_1F59C0:
	move.w	-$3AC8(a5),d0
	ext.l	d0
	move.w	#$FFF8,d1
	and.w	d0,d1
	subq.w	#$8,d1
	move.w	d1,-$3AD0(a5)
	bge.s	loc_1F59D8
	clr.w	-$3AD0(a5)
loc_1F59D8:
	move.l	a4,d0
	beq.w	loc_1F5D2C
	lea.l	$40F2(a5),a0
	move.l	a0,-$3A50(a5)
	lea.l	$40FA(a5),a0
	move.l	a0,-$3A54(a5)
	move.l	a4,-$3A80(a5)
	move.w	$2(a4),d0
	asr.w	#$2,d0
	move.w	d0,-$3A6E(a5)
	move.w	$4(a4),d0
	asr.w	#$2,d0
	move.w	d0,-$3A78(a5)
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
	move.l	d0,-$3A84(a5)
	moveq	#$0,d0
	move.w	$C(a3),d0
	add.l	a3,d0
	move.l	d0,-$3AA6(a5)
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
	pea.l	$1F5F3E(pc)
	move.w	-$3A6E(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.w	-$3A78(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> Math_LMul
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3A84(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$3A84(a5),-(a7)
	moveq	#$0,d1
	move.w	$A(a4),d1
	add.l	a4,d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	tst.l	$10(a6)
	lea.l	$14(a7),a7
	beq.w	loc_1F5B22
	move.w	#$80,-$3A66(a5)
	move.b	#$1,-$3A64(a5)
	movea.l	$10(a6),a0
	move.w	$2(a0),d0
	asr.w	#$2,d0
	move.w	d0,-$3A7A(a5)
	moveq	#$10,d0
	cmp.w	-$3A7A(a5),d0
	ble.s	loc_1F5AC6
	move.b	#$1,-$13EE(a5)
loc_1F5AC6:
	movea.l	$10(a6),a0
	move.w	$4(a0),d0
	asr.w	#$2,d0
	move.w	d0,-$3A7C(a5)
	tst.l	$14(a6)
	bne.s	loc_1F5AE0
	move.l	$10(a6),$14(a6)
loc_1F5AE0:
	pea.l	$1F5F3C(pc)
	move.w	-$3A7A(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.w	-$3A7C(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> Math_LMul
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3A88(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$3A88(a5),-(a7)
	movea.l	$10(a6),a0
	moveq	#$0,d1
	move.w	$A(a0),d1
	add.l	$10(a6),d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	lea.l	$14(a7),a7
	bra.s	loc_1F5B2C
loc_1F5B22:
	move.w	#$80,-$3A66(a5)
	clr.b	-$3A64(a5)
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
	move.w	$8(a3),-$3AA8(a5)
	move.l	g_HeapTop(a5),-$6(a6)
	pea.l	$1F5F3A(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	g_HeapTop(a5),-$3AA6(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$3AA6(a5),-(a7)
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
	move.l	-$3AA6(a5),-(a7)
	move.l	-$3A84(a5),-(a7)
	move.w	-$3A66(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	Level_LoadUsedTiles(pc)
	move.w	d0,d5
	move.w	-$3AAC(a5),-$3AA8(a5)
	move.w	-$3A66(a5),d0
	add.w	d5,d0
	move.w	d0,-$3AAE(a5)
	ext.l	d5
	move.l	d5,-(a7)
	move.l	-$3AA6(a5),-(a7)
	move.l	-$3A84(a5),-(a7)
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
	move.w	-$3AA8(a5),-$3AAA(a5)
	move.l	-$3AA6(a5),-$3A8C(a5)
	move.w	d5,d6
	move.w	d6,d4
	move.w	-$3A66(a5),d0
	add.w	d6,d0
	move.w	d0,-$3AB0(a5)
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
	pea.l	$1F5F16(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	$14(a6),a0
	move.w	$8(a0),-$3AAA(a5)
	move.l	g_HeapTop(a5),-$3A8C(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$3A8C(a5),-(a7)
	movea.l	$14(a6),a0
	moveq	#$0,d1
	move.w	$C(a0),d1
	add.l	$14(a6),d1
	move.l	d1,-(a7)
	jsr	$411A(a5)	; -> Eni_Decode
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	-$3A8C(a5),-(a7)
	move.l	-$3A88(a5),-(a7)
	ext.l	d5
	move.w	-$3A66(a5),d1
	ext.l	d1
	add.l	d5,d1
	move.l	d1,-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	jsr	Level_LoadUsedTiles(pc)
	move.w	d0,d4
	move.w	-$3AAC(a5),-$3AAA(a5)
	ext.l	d5
	ext.l	d4
	move.l	d5,d0
	add.l	d4,d0
	move.w	-$3A66(a5),d1
	add.w	d0,d1
	move.w	d1,-$3AB0(a5)
	lea.l	$2C(a7),a7
loc_1F5C9C:
	ext.l	d4
	move.l	d4,-(a7)
	move.l	-$3A8C(a5),-(a7)
	move.l	-$3A88(a5),-(a7)
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
	clr.w	-$3AAA(a5)
	clr.w	d4
	lea.l	Str_APlaneTilesNoB(pc),a0
	movea.l	-$6(a6),a1
	move.l	a0,$4(a1)
loc_1F5CD2:
	movea.l	-$6(a6),a0
	move.l	g_HeapTop(a5),(a0)
	moveq	#$7,d0
	cmp.w	-$3A78(a5),d0
	bge.s	loc_1F5CEA
	addi.w	#$100,-$3ACC(a5)
	bra.s	loc_1F5CF0
loc_1F5CEA:
	addi.w	#$E0,-$3ACC(a5)
loc_1F5CF0:
	pea.l	$1F5EFE(pc)
	move.w	-$3A78(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3A72(a5)
	clr.w	d6
	clr.w	d7
	addq.w	#$8,a7
	bra.s	loc_1F5D24
loc_1F5D0E:
	ext.l	d7
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	d6,(a0,d0.l)
	add.w	-$3A6E(a5),d6
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F5D24:
	cmp.w	-$3A78(a5),d7
	blt.s	loc_1F5D0E
	bra.s	loc_1F5D32
loc_1F5D2C:
	move.w	#$80,-$3A66(a5)
loc_1F5D32:
	tst.l	$10(a6)
	bne.s	loc_1F5D52
	clr.b	-$3A64(a5)
	move.w	-$3A66(a5),d0
	add.w	d5,d0
	move.w	d0,-$3A9E(a5)
	clr.w	-$3AC6(a5)
	clr.w	-$3AC8(a5)
	bra.w	loc_1F5DFE
loc_1F5D52:
	tst.l	$14(a6)
	bne.s	loc_1F5D5E
	move.l	$10(a6),$14(a6)
loc_1F5D5E:
	move.b	#$1,-$3A64(a5)
	movea.l	$10(a6),a0
	move.w	$2(a0),d0
	asr.w	#$2,d0
	move.w	d0,-$3A7A(a5)
	movea.l	$10(a6),a0
	move.w	$4(a0),d0
	asr.w	#$2,d0
	move.w	d0,-$3A7C(a5)
	tst.b	-$1(a6)
	beq.s	loc_1F5D9E
	move.w	-$3A66(a5),-$8(a6)
	move.w	-$8(a6),-$3A68(a5)
	move.w	-$8(a6),d0
	add.w	d4,d0
	move.w	d0,-$3A9E(a5)
	bra.s	loc_1F5DAE
loc_1F5D9E:
	move.w	-$3A66(a5),d0
	add.w	d5,d0
	move.w	d0,-$3A68(a5)
	add.w	d4,d0
	move.w	d0,-$3A9E(a5)
loc_1F5DAE:
	moveq	#$7,d0
	cmp.w	-$3A7C(a5),d0
	bge.s	loc_1F5DBE
	addi.w	#$100,-$3AD0(a5)
	bra.s	loc_1F5DC4
loc_1F5DBE:
	addi.w	#$E0,-$3AD0(a5)
loc_1F5DC4:
	pea.l	$1F5EFC(pc)
	move.w	-$3A7C(a5),d0
	ext.l	d0
	add.l	d0,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3A76(a5)
	clr.w	d6
	clr.w	d7
	addq.w	#$8,a7
	bra.s	loc_1F5DF8
loc_1F5DE2:
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	d6,(a0,d0.l)
	add.w	-$3A7A(a5),d6
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F5DF8:
	cmp.w	-$3A7C(a5),d7
	blt.s	loc_1F5DE2
loc_1F5DFE:
	move.w	-$3A66(a5),-$3A6A(a5)
	tst.b	-$3A62(a5)
	beq.s	loc_1F5E1C
	tst.b	-$1(a6)
	bne.s	loc_1F5E1C
	move.w	-$3A66(a5),d0
	add.w	d5,d0
	move.w	d0,-$3A6C(a5)
	bra.s	loc_1F5E22
loc_1F5E1C:
	move.w	-$3A66(a5),-$3A6C(a5)
loc_1F5E22:
	tst.b	$23(a6)
	beq.s	loc_1F5E2E
	ori.w	#$8000,-$3A6A(a5)
loc_1F5E2E:
	tst.b	$27(a6)
	beq.s	loc_1F5E3A
	ori.w	#$8000,-$3A6C(a5)
loc_1F5E3A:
	tst.b	$2B(a6)
	beq.s	loc_1F5E46
	addi.w	#$4000,-$3A6C(a5)
loc_1F5E46:
	move.l	#$74000003,($C00004).l
	move.w	#$1FF,d0
	and.w	-$3AC2(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	neg.l	d1
	move.w	d1,($C00000).l
	move.l	#$40000010,($C00004).l
	move.w	#$FF,d0
	and.w	-$3AC4(a5),d0
	move.w	d0,($C00000).l
	move.l	#$74020003,($C00004).l
	move.w	#$1FF,d0
	and.w	-$3AC6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	neg.l	d1
	move.w	d1,($C00000).l
	move.l	#$40020010,($C00004).l
	move.w	#$FF,d0
	and.w	-$3AC8(a5),d0
	move.w	d0,($C00000).l
	clr.b	-$3AB4(a5)
	clr.b	-$3AB6(a5)
	tst.b	$2F(a6)
	beq.s	loc_1F5ED2
	clr.w	-$3ACE(a5)
	move.w	#$100,-$3AD0(a5)
	clr.w	-$3AC6(a5)
	clr.w	-$3AC8(a5)
loc_1F5ED2:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	$2F(a6),d5
	move.b	d5,-$3AB4(a5)
	move.b	d5,-$3AB6(a5)
	move.l	g_HeapTop(a5),-$3AA2(a5)
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
