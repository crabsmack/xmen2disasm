; ---------------------------------------------------------------------------
; Failure_RunScene - scene 'CerebroScreen Failure' (game over): failure text, then the Game Over picture for 20 s or until a button, then a new game
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Cerebro_Run with script jt $FB2; draws a tilemap, fades in (Pal_StartFade), waits $4B0 frames or pad buttons $F0, fades out, Game_ResetPlayers; scenario game-over shows the Failure text then 'Game Over'
; ---------------------------------------------------------------------------
Failure_RunScene:
	link.w	a6,#$FFC0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	lea.l	-$38(a6),a3
	clr.w	g_SceneVar3B0C(a5)
	clr.w	g_SceneVar3B0A(a5)
	lea.l	$FB2(a5),a0
	move.l	$2(a0),g_SceneVar3B14(a5)
	jsr	Cerebro_Run(pc)
	jsr	Cerebro_ClearScreen(pc)
	clr.w	g_TextWinTop(a5)
	clr.w	g_TextWinLeft(a5)
	move.w	#$1F,g_TextWinBottom(a5)
	move.w	#$27,g_TextWinRight(a5)
	jsr	Cerebro_ClearTextWindow(pc)
	clr.w	d7
	lea.l	g_PalBase(a5),a4
	moveq	#$40,d3
	bra.s	loc_067070
loc_067068:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_067070:
	cmp.w	d7,d3
	bgt.s	loc_067068
	move.b	#$1,g_PalBaseDirty(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_VramTileCursor(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$E72(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$50DA(a5)	; -> Art_LoadNemToVram
	lea.l	$3E72(a5),a0
	move.l	$2(a0),-$40(a6)
	lea.l	g_PalBase+$40(a5),a0
	move.l	a0,-$3C(a6)
	moveq	#$0,d6
	moveq	#$10,d3
	addq.w	#$8,a7
loc_0670AA:
	movea.l	-$40(a6),a0
	addq.l	#$2,-$40(a6)
	movea.l	-$3C(a6),a1
	addq.l	#$2,-$3C(a6)
	move.w	(a0),(a1)
	move.l	d6,d0
	addq.l	#$1,d6
	cmp.l	d6,d3
	bgt.s	loc_0670AA
	move.w	#$4000,d5
	or.w	g_VramTileCursor(a5),d5
	moveq	#$1C,d6
	move.l	d6,d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	lea.l	$E6A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	clr.w	d7
	lea.l	(a3),a4
	lea.l	$C(a7),a7
	bra.s	loc_0670F4
loc_0670EC:
	add.w	d5,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_0670F4:
	cmp.w	d7,d6
	bgt.s	loc_0670EC
	moveq	#$40,d0
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$E,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	pea.l	($59A).w
	jsr	$413A(a5)	; -> VDP_WriteTileRect
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	move.w	#$4B0,d7
	lea.l	$20(a7),a7
	bra.s	loc_067144
loc_06712C:
	subq.w	#$1,d7
	move.w	g_Pad2Raw(a5),d0
	or.w	g_Pad1Raw(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_067140
	clr.w	d7
loc_067140:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_067144:
	tst.w	d7
	bne.s	loc_06712C
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	lea.l	$C(a7),a7
	bra.s	loc_067166
loc_067162:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_067166:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_067162
	jsr	$32(a5)	; -> Game_ResetPlayers
	clr.w	g_ProgressFlags(a5)
	movem.l	-$58(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
