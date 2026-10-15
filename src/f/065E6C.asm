; ---------------------------------------------------------------------------
; Cerebro_PlayIntro - Cerebro intro: logo pictures and flying Cerebro sprite, title lines; on the LogoAndDemo scene show PRESS START for 10 s
; In:  none
; Out: none
; Evidence: called by Cerebro_Run when -$3B0C; skipped after START (bit 1 of -$3C5E); 'PRESS'/'START' strings; START sets -$3C5E bit 1; uses Cerebro_BigSprite*, Cerebro_PrintText; palette hook Cerebro_IntroPalHook
; ---------------------------------------------------------------------------
Cerebro_PlayIntro:
	link.w	a6,#$FE10
	movem.l	d3-d7/a3-a4,-(a7)
	lea.l	-$1A6(a6),a3
	move.w	g_VramTileCursor(a5),-$16(a6)
	move.w	#$1,-$3B02(a5)
	move.w	#$2710,-$3B0C(a5)
	lea.l	Cerebro_IntroPalHook(pc),a0
	move.l	a0,g_VBlankGameHook(a5)
	jsr	$50A2(a5)	; -> Scaler_InitParams
	pea.l	Tbl_Cerebro11(pc)
	pea.l	($2A56).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_ScaleSrcBitmap(a5)
	pea.l	Tbl_Cerebro10(pc)
	pea.l	($1560).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_ScaleTileBuf(a5)
	clr.w	d7
	lea.l	g_PalBase+$20(a5),a4
	lea.l	$10(a7),a7
	bra.s	loc_065ECA
loc_065EC2:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065ECA:
	cmpi.w	#$30,d7
	blt.s	loc_065EC2
	moveq	#$2,d0
	and.w	-$3C5E(a5),d0
	bne.w	loc_06612E
	move.w	g_VramTileCursor(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$E8A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> Art_LoadNemToVram
	move.w	#$4000,d5
	or.w	g_VramTileCursor(a5),d5
	moveq	#$30,d4
	move.l	d4,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$E82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$14(a7),a7
	bra.s	loc_065F1E
loc_065F16:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065F1E:
	cmp.w	d7,d4
	bgt.s	loc_065F16
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$C,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($51C).w
	jsr	$413A(a5)	; -> VDP_WriteTileRect
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$4142(a5)	; -> Intro_SegaLogoFlash
	jsr	Cerebro_ClearScreen(pc)
	clr.w	d7
	lea.l	g_PalBase+$20(a5),a4
	lea.l	$1C(a7),a7
	bra.s	loc_065F5C
loc_065F54:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065F5C:
	cmpi.w	#$30,d7
	blt.s	loc_065F54
	move.b	#$1,g_PalBaseDirty(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_VramTileCursor(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$E02(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> Art_LoadNemToVram
	move.w	#$4000,d5
	or.w	g_VramTileCursor(a5),d5
	move.w	#$C0,d4
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DFA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$14(a7),a7
	bra.s	loc_065FB4
loc_065FAC:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_065FB4:
	cmp.w	d7,d4
	bgt.s	loc_065FAC
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	moveq	#$10,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($318).w
	jsr	$413A(a5)	; -> VDP_WriteTileRect
	move.w	#$B4,d6
	lea.l	$F7A(a5),a0
	movea.l	$2(a0),a4
	lea.l	$14(a7),a7
	bra.s	loc_066034
loc_065FE0:
	clr.b	g_FrameTick(a5)
	ext.l	d6
	move.l	#$B4,d0
	sub.l	d6,d0
	move.l	d0,d7
	asr.l	#$2,d7
	move.w	d6,d5
	asr.w	#$2,d5
	cmp.w	d7,d5
	sgt.b	d3
	neg.b	d3
	beq.s	loc_066002
	move.w	d7,d0
	bra.s	loc_066004
loc_066002:
	move.w	d5,d0
loc_066004:
	move.w	d0,d7
	cmpi.w	#$7,d7
	ble.s	loc_06600E
	moveq	#$7,d7
loc_06600E:
	ext.l	d7
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a4,d0.l),g_PalBase+$5C(a5)
	ext.l	d7
	move.l	d7,d0
	addq.l	#$8,d0
	add.l	d0,d0
	move.w	(a4,d0.l),g_PalBase+$5A(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066034:
	tst.w	d6
	bne.s	loc_065FE0
	lea.l	$FBA(a5),a0
	move.l	$2(a0),-$1F0(a6)
	jsr	Cerebro_ClearScreen(pc)
	jsr	Cerebro_ClearTextWindow(pc)
	move.w	#$CC,g_PalBase+$7E(a5)
	move.w	#$AA,g_PalBase+$7C(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	-$3C56(a5),-$3B04(a5)
	move.w	-$3C58(a5),d0
	addq.w	#$4,d0
	move.w	d0,-$3B06(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$3,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$1,-$3B06(a5)
	addi.l	#$20,-$1F0(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1F0(a6),-(a7)
	jsr	Cerebro_PrintText(pc)
	move.w	#$B4,d6
	lea.l	$30(a7),a7
	bra.s	loc_066100
loc_0660FA:
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066100:
	tst.w	d6
	bne.s	loc_0660FA
	move.w	#$B4,d6
	bra.s	loc_066126
loc_06610A:
	clr.b	g_FrameTick(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_Pad2Raw(a5),d0
	or.w	g_Pad1Raw(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_066126
	clr.w	d6
loc_066126:
	tst.w	d6
	bne.s	loc_06610A
	jsr	Cerebro_ClearTextWindow(pc)
loc_06612E:
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	Cerebro_ClearScreen(pc)
	clr.w	d7
	lea.l	g_PalBase+$20(a5),a4
	addq.w	#$8,a7
	bra.s	loc_066154
loc_06614C:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_066154:
	cmpi.w	#$30,d7
	blt.s	loc_06614C
	move.b	#$1,g_PalBaseDirty(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_VramTileCursor(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$DF2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> Art_LoadNemToVram
	move.w	#$4000,d5
	or.w	g_VramTileCursor(a5),d5
	move.w	#$9A,d4
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DEA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$14(a7),a7
	bra.s	loc_0661AC
loc_0661A4:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_0661AC:
	cmp.w	d7,d4
	bgt.s	loc_0661A4
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$E,d1
	move.l	d1,-(a7)
	moveq	#$B,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($1AC).w
	jsr	$413A(a5)	; -> VDP_WriteTileRect
	addi.w	#$C0,g_VramTileCursor(a5)
	move.l	g_ScaleParamsPtr(a5),-$1E8(a6)
	move.w	#$AB,-$1E0(a6)
	move.w	g_VramTileCursor(a5),-$1DE(a6)
	move.w	#$1,-$1DC(a6)
	addi.w	#$AB,g_VramTileCursor(a5)
	lea.l	$F72(a5),a0
	movea.l	$2(a0),a4
	lea.l	g_PalBase+$20(a5),a3
	moveq	#$0,d5
	lea.l	$14(a7),a7
loc_0661FC:
	move.w	(a4)+,(a3)+
	move.l	d5,d0
	addq.l	#$1,d5
	moveq	#$10,d0
	cmp.l	d5,d0
	bgt.s	loc_0661FC
	move.w	#$A0,g_PalBase+$7E(a5)
	move.w	#$80,g_PalBase+$7C(a5)
	move.w	#$660,g_PalBase+$7A(a5)
	move.w	#$862,g_PalBase+$78(a5)
	move.w	#$A0,g_PalBase+$76(a5)
	move.w	#$80,g_PalBase+$74(a5)
	move.w	#$A,g_PalBase+$72(a5)
	move.w	#$8,g_PalBase+$70(a5)
	clr.w	g_PalBase+$62(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$DE2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50AA(a5)	; -> Spr_RenderToBitmap
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteInit(pc)
	move.w	#$3C,-$20(a6)
	move.w	#$40,-$1E(a6)
	move.w	#$A0,-$26(a6)
	move.w	#$70,-$24(a6)
	clr.w	-$22(a6)
	clr.w	d7
	movea.l	-$1E8(a6),a0
	move.w	(a0),-$1C(a6)
	move.w	$2(a0),-$1A(a6)
	moveq	#$C,d6
	move.w	-$1C(a6),d0
	ext.l	d0
	move.w	-$22(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1C2(a6)
	move.w	-$1A(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1BE(a6)
	move.w	-$20(a6),d0
	ext.l	d0
	move.w	-$26(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1CA(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	move.w	-$24(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1C6(a6)
	move.w	-$26(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1DA(a6)
	move.w	-$24(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D6(a6)
	move.w	-$22(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D2(a6)
	ext.l	d7
	move.l	d7,d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1CE(a6)
	move.w	#$112,-$3B0C(a5)
	lea.l	$14(a7),a7
	bra.w	loc_06644C
loc_066348:
	moveq	#$0,d0
	move.l	d0,g_VBlankCount(a5)
	jsr	$504A(a5)	; -> Spr_BeginFrame
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.w	$4(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	#$1C,$6(a0)
	clr.b	g_FrameTick(a5)
	move.l	-$1CA(a6),d0
	add.l	d0,-$1DA(a6)
	move.l	-$1C6(a6),d0
	add.l	d0,-$1D6(a6)
	move.l	-$1C2(a6),d0
	add.l	d0,-$1D2(a6)
	move.l	-$1BE(a6),d0
	add.l	d0,-$1CE(a6)
	move.l	-$1D2(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$10(a0)
	move.l	-$1CE(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$12(a0)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDecode(pc)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDraw(pc)
	subq.w	#$1,d6
	tst.w	d6
	addq.w	#$8,a7
	bne.s	loc_066436
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	#$145,$6(a0)
	bra.s	loc_066436
loc_066432:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066436:
	moveq	#$3,d0
	cmp.l	g_VBlankCount(a5),d0
	bgt.s	loc_066432
	jsr	$5052(a5)	; -> Spr_EndFrame
	move.b	#$1,g_DmaFlushReq(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_06644C:
	tst.w	d6
	bne.w	loc_066348
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$1DE(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$DE2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> Spr_Init
	lea.l	$DE2(a5),a0
	movea.l	$2(a0),a3
	move.l	a3,-$1EC(a6)
	lea.l	$24(a3),a3
	move.b	(a3),d0
	ext.w	d0
	neg.w	d0
	move.w	d0,-$18(a6)
	move.b	$1(a3),d0
	ext.w	d0
	neg.w	d0
	move.w	d0,d5
	move.l	g_ScaleParamsPtr(a5),-$1E8(a6)
	move.w	#$2C,-$1E0(a6)
	move.w	g_VramTileCursor(a5),-$1DE(a6)
	move.w	#$2,-$1DC(a6)
	addi.w	#$2C,g_VramTileCursor(a5)
	moveq	#$5A,d6
	lea.l	$1C(a7),a7
	bra.s	loc_0664CA
loc_0664C0:
	clr.b	g_FrameTick(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0664CA:
	tst.w	d6
	bne.s	loc_0664C0
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DE2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50AA(a5)	; -> Spr_RenderToBitmap
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteInit(pc)
	move.w	#$48,-$20(a6)
	move.w	#$95,-$1E(a6)
	move.w	#$A0,-$26(a6)
	move.w	#$95,-$24(a6)
	clr.w	-$22(a6)
	moveq	#$2,d7
	movea.l	-$1E8(a6),a0
	move.w	(a0),-$1C(a6)
	move.w	#$2,-$1A(a6)
	moveq	#$8,d6
	move.w	-$1C(a6),d0
	ext.l	d0
	move.w	-$22(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1C2(a6)
	move.w	-$1A(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1BE(a6)
	move.w	-$20(a6),d0
	ext.l	d0
	move.w	-$26(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1CA(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	move.w	-$24(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1C6(a6)
	move.w	-$26(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1DA(a6)
	move.w	-$24(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D6(a6)
	move.w	-$22(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D2(a6)
	ext.l	d7
	move.l	d7,d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1CE(a6)
	lea.l	$F62(a5),a0
	movea.l	$2(a0),a3
	lea.l	g_PalBase+$40(a5),a4
	moveq	#$0,d4
	lea.l	$14(a7),a7
loc_0665D8:
	move.w	(a3)+,(a4)+
	move.l	d4,d0
	addq.l	#$1,d4
	moveq	#$10,d0
	cmp.l	d4,d0
	bgt.s	loc_0665D8
	move.b	#$1,g_PalBaseDirty(a5)
	bra.w	loc_0666BE
loc_0665EE:
	jsr	$504A(a5)	; -> Spr_BeginFrame
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	#$145,$6(a0)
	clr.b	g_FrameTick(a5)
	ext.l	d5
	move.l	d5,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	-$18(a6),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$508A(a5)	; -> Spr_Draw
	move.l	-$1CA(a6),d0
	add.l	d0,-$1DA(a6)
	move.l	-$1C6(a6),d0
	add.l	d0,-$1D6(a6)
	move.l	-$1C2(a6),d0
	add.l	d0,-$1D2(a6)
	move.l	-$1BE(a6),d0
	add.l	d0,-$1CE(a6)
	move.l	-$1D2(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$10(a0)
	move.l	-$1CE(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$12(a0)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDecode(pc)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDraw(pc)
	subq.w	#$1,d6
	jsr	$5052(a5)	; -> Spr_EndFrame
	move.b	#$1,g_DmaFlushReq(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	lea.l	$14(a7),a7
loc_0666BE:
	tst.w	d6
	bne.w	loc_0665EE
	move.w	#$48,-$20(a6)
	move.w	#$8F,-$1E(a6)
	move.w	#$48,-$26(a6)
	move.w	#$95,-$24(a6)
	movea.l	-$1E8(a6),a0
	move.w	(a0),-$22(a6)
	moveq	#$2,d7
	move.w	(a0),-$1C(a6)
	move.w	$2(a0),-$1A(a6)
	moveq	#$8,d6
	move.w	-$1C(a6),d0
	ext.l	d0
	move.w	-$22(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1C2(a6)
	move.w	-$1A(a6),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1BE(a6)
	move.w	-$20(a6),d0
	ext.l	d0
	move.w	-$26(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1CA(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	move.w	-$24(a6),d1
	ext.l	d1
	sub.l	d1,d0
	swap	d0
	clr.w	d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-$1C6(a6)
	move.w	-$26(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1DA(a6)
	move.w	-$24(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D6(a6)
	move.w	-$22(a6),d0
	ext.l	d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1D2(a6)
	ext.l	d7
	move.l	d7,d0
	swap	d0
	clr.w	d0
	move.l	d0,-$1CE(a6)
	bra.w	loc_066870
loc_0667A0:
	jsr	$504A(a5)	; -> Spr_BeginFrame
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	#$145,$6(a0)
	clr.b	g_FrameTick(a5)
	ext.l	d5
	move.l	d5,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	-$18(a6),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$508A(a5)	; -> Spr_Draw
	move.l	-$1CA(a6),d0
	add.l	d0,-$1DA(a6)
	move.l	-$1C6(a6),d0
	add.l	d0,-$1D6(a6)
	move.l	-$1C2(a6),d0
	add.l	d0,-$1D2(a6)
	move.l	-$1BE(a6),d0
	add.l	d0,-$1CE(a6)
	move.l	-$1D2(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$10(a0)
	move.l	-$1CE(a6),d0
	swap	d0
	ext.l	d0
	movea.l	-$1E8(a6),a0
	move.w	d0,$12(a0)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDecode(pc)
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDraw(pc)
	subq.w	#$1,d6
	jsr	$5052(a5)	; -> Spr_EndFrame
	move.b	#$1,g_DmaFlushReq(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	lea.l	$14(a7),a7
loc_066870:
	tst.w	d6
	bne.w	loc_0667A0
	move.w	#$CC,g_PalBase+$7E(a5)
	move.w	#$AA,g_PalBase+$7C(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.w	-$3C56(a5),d0
	addq.w	#$1,d0
	move.w	d0,-$3B04(a5)
	move.w	-$3C5C(a5),d0
	subq.w	#$1,d0
	move.w	d0,-$3B06(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	Str_DevelopedByHeadgamesInc(pc)
	jsr	Cerebro_PrintText(pc)
	moveq	#$78,d6
	addq.w	#$8,a7
	bra.s	loc_0668B4
loc_0668AE:
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0668B4:
	tst.w	d6
	bne.s	loc_0668AE
	moveq	#$0,d0
	move.b	g_ScnLogoAndDemo(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.w	loc_066A52
	bra.s	loc_0668D0
loc_0668C8:
	clr.b	g_FrameTick(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0668D0:
	moveq	#$40,d0
	cmp.w	g_PalBase+$74(a5),d0
	bne.s	loc_0668C8
	jsr	$504A(a5)	; -> Spr_BeginFrame
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	movea.l	d0,a0
	move.w	#$C0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$4,$2(a0)
	move.w	-$3B10(a5),d0
	add.w	#$2074,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	#$145,$6(a0)
	lea.l	Str_Press(pc),a3
	moveq	#$4A,d4
	move.w	#$C6,-$1EE(a6)
	bra.s	loc_066984
loc_066930:
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	-$1EE(a6),d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	ext.w	d7
	move.w	d7,d0
	sub.w	#$99E0,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
	addq.w	#$1,a3
	addq.w	#$8,d4
loc_066984:
	move.b	(a3),d7
	bne.s	loc_066930
	lea.l	Str_Start(pc),a3
	move.w	#$D2,d4
	move.w	#$C6,-$1EE(a6)
	bra.s	loc_0669EC
loc_066998:
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	-$1EE(a6),d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	ext.w	d7
	move.w	d7,d0
	sub.w	#$99E0,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
	addq.w	#$1,a3
	addq.w	#$8,d4
loc_0669EC:
	move.b	(a3),d7
	bne.s	loc_066998
	ext.l	d5
	move.l	d5,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	-$18(a6),d0
	ext.l	d0
	moveq	#$3C,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$508A(a5)	; -> Spr_Draw
	pea.l	-$1E8(a6)
	jsr	Cerebro_BigSpriteDraw(pc)
	jsr	$5052(a5)	; -> Spr_EndFrame
	move.b	#$1,g_DmaFlushReq(a5)
	move.w	#$258,d6
	lea.l	$10(a7),a7
	bra.s	loc_066A4C
loc_066A2A:
	clr.b	g_FrameTick(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_Pad2Raw(a5),d0
	or.w	g_Pad1Raw(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_066A4C
	ori.w	#$2,-$3C5E(a5)
	clr.w	d6
loc_066A4C:
	tst.w	d6
	bne.s	loc_066A2A
	bra.s	loc_066A78
loc_066A52:
	move.w	#$258,d6
	bra.s	loc_066A74
loc_066A58:
	clr.b	g_FrameTick(a5)
	subq.w	#$1,d6
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_Pad2Raw(a5),d0
	or.w	g_Pad1Raw(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_066A74
	clr.w	d6
loc_066A74:
	tst.w	d6
	bne.s	loc_066A58
loc_066A78:
	jsr	$504A(a5)	; -> Spr_BeginFrame
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.w	$4(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	#$1C,$6(a0)
	clr.b	g_FrameTick(a5)
	jsr	$5052(a5)	; -> Spr_EndFrame
	move.w	-$16(a6),g_VramTileCursor(a5)
	moveq	#$0,d0
	move.l	d0,g_VBlankGameHook(a5)
	move.l	g_ScaleTileBuf(a5),-(a7)
	jsr	$503A(a5)	; -> Mem_StackFree
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	jsr	$503A(a5)	; -> Mem_StackFree
	clr.w	g_Pad1Pressed(a5)
	clr.w	g_Pad2Pressed(a5)
	clr.w	g_Pad1Latch(a5)
	clr.w	g_Pad2Latch(a5)
	addq.w	#$8,a7
	movem.l	-$20C(a6),d3-d7/a3-a4
	unlk	a6
	rts
