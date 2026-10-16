; ---------------------------------------------------------------------------
; Cerebro_Run - run a Cerebro screen: load the Cerebro level, optionally play the intro, run the text script at g_SceneVar3B14, optionally run player select
; In:  g_SceneVar3B14 = text script (0 = none), g_SceneVar3B0C = play intro, g_SceneVar3B0A = run player select
; Out: none
; Evidence: called by every Cerebro*_RunScene; Level_Load level load; Cerebro_PlayIntro, Cerebro_RunTextScript, PlayerSelect_Run; copies g_P1Health/g_P2Health into the players afterwards
; ---------------------------------------------------------------------------
Cerebro_Run:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	moveq	#$9,d6
	moveq	#$0,d0
	move.b	g_ScnCredits(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_066B3E
	moveq	#-$1,d6
loc_066B3E:
	cmpi.w	#$FFFF,d6
	beq.s	loc_066B48
	jsr	$5242(a5)	; -> Snd_StopAll
loc_066B48:
	lea.l	$DD2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$6,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$DC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$DC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$DCA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$DCA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.b	g_HudOn(a5)
	clr.w	g_BgScrollFactorX(a5)
	clr.w	g_BgScrollFactorY(a5)
	jsr	Cerebro_LoadSpriteTiles(pc)
	lea.l	Cerebro_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	clr.b	g_TwoPlayerStep(a5)
	jsr	Cerebro_LoadFonts(pc)
	move.w	#$2,g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B3C(a5)
	move.w	#$1,g_SceneVar3B44(a5)
	move.w	#$2,g_SceneVar3B36(a5)
	clr.w	g_SceneVar3B3E(a5)
	move.w	#$1,g_SceneVar3B46(a5)
	move.w	#$2,g_SceneVar3B38(a5)
	clr.w	g_SceneVar3B40(a5)
	move.w	#$1,g_SceneVar3B48(a5)
	move.w	#$3,g_TextWinTop(a5)
	move.w	#$5,g_TextWinLeft(a5)
	move.w	#$16,g_TextWinBottom(a5)
	move.w	#$22,g_TextWinRight(a5)
	move.w	g_TextWinTop(a5),g_SceneVar3B04(a5)
	move.w	g_TextWinLeft(a5),g_SceneVar3B06(a5)
	clr.w	g_SceneExitTimer(a5)
	moveq	#$0,d0
	move.l	d0,g_VBlankCount(a5)
	clr.w	g_DemoStepFrame(a5)
	clr.w	g_LevelFrame(a5)
	clr.b	g_SceneIndexSet(a5)
	move.w	g_VramTileCursor(a5),g_LevelVramStart(a5)
	jsr	$5042(a5)	; -> Spr_InitLinks
	jsr	$50FA(a5)	; -> Pad_Update
	ori.w	#$40,g_VdpReg1(a5)
	move.w	g_VdpReg1(a5),($C00004).l
	move.w	#$9100,($C00004).l
	move.w	#$929C,($C00004).l
	clr.b	g_PalBaseDirty(a5)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	moveq	#$0,d0
	move.b	g_ScnFinalText(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	lea.l	$4C(a7),a7
	bne.s	loc_066CA2
	clr.w	g_TextWinTop(a5)
	clr.w	g_TextWinLeft(a5)
	move.w	#$1F,g_TextWinBottom(a5)
	move.w	#$27,g_TextWinRight(a5)
	jsr	Cerebro_ClearTextWindow(pc)
	addq.w	#$2,g_TextWinTop(a5)
	addq.w	#$2,g_TextWinLeft(a5)
	subq.w	#$2,g_TextWinBottom(a5)
	subq.w	#$2,g_TextWinRight(a5)
	moveq	#$A,d6
	bra.s	loc_066CB2
loc_066CA2:
	moveq	#$0,d0
	move.b	g_ScnFailure(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_066CB2
	jsr	Cerebro_ClearScreen(pc)
loc_066CB2:
	tst.w	g_SceneVar3B0C(a5)
	beq.s	loc_066D24
	bra.s	loc_066CBE
loc_066CBA:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066CBE:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_066CBA
	jsr	Cerebro_ClearScreen(pc)
	jsr	Cerebro_PlayIntro(pc)
	tst.l	g_SceneVar3B14(a5)
	bne.s	loc_066CD8
	tst.w	g_SceneVar3B0A(a5)
	beq.s	loc_066D24
loc_066CD8:
	clr.w	d7
	lea.l	g_PalBase+$20(a5),a4
	moveq	#$30,d3
	bra.s	loc_066CEA
loc_066CE2:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_066CEA:
	cmp.w	d7,d3
	bgt.s	loc_066CE2
	move.b	#$1,g_PalBaseDirty(a5)
	move.b	#$1,g_DmaFlushReq(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	jsr	Cerebro_ClearScreen(pc)
	jsr	Cerebro_ClearTextWindow(pc)
	lea.l	$3E72(a5),a0
	movea.l	$2(a0),a4
	lea.l	g_PalBase+$20(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_066D16:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_066D16
	jsr	Cerebro_LoadFonts(pc)
loc_066D24:
	tst.l	g_SceneVar3B14(a5)
	beq.s	loc_066D90
	cmpi.w	#$FFFF,d6
	beq.s	loc_066D4C
	jsr	$5242(a5)	; -> Snd_StopAll
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	bra.s	loc_066D4C
loc_066D48:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066D4C:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_066D48
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
	jsr	Cerebro_RunTextScript(pc)
loc_066D90:
	tst.w	g_SceneVar3B0A(a5)
	beq.w	loc_066E38
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$8,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$8,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	bra.s	loc_066DB4
loc_066DB0:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066DB4:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_066DB0
	jsr	Cerebro_ClearTextWindow(pc)
	move.w	#$A0,g_PalBase+$7E(a5)
	move.w	#$80,g_PalBase+$7C(a5)
	move.w	#$A,g_PalBase+$7A(a5)
	move.w	#$8,g_PalBase+$78(a5)
	move.w	#$A0,g_PalBase+$76(a5)
	move.w	#$80,g_PalBase+$74(a5)
	move.w	#$A,g_PalBase+$72(a5)
	move.w	#$8,g_PalBase+$70(a5)
	clr.w	g_PalBase+$62(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	moveq	#-$1,d7
	tst.w	g_P1Health(a5)
	beq.s	loc_066E0C
	move.l	g_Player1(a5),-(a7)
	jsr	$42(a5)	; -> Player_CharIndexOf
	move.w	d0,d7
	addq.w	#$4,a7
loc_066E0C:
	moveq	#-$1,d6
	tst.w	g_P2Health(a5)
	beq.s	loc_066E20
	move.l	g_Player2(a5),-(a7)
	jsr	$42(a5)	; -> Player_CharIndexOf
	move.w	d0,d6
	addq.w	#$4,a7
loc_066E20:
	move.b	d7,g_P1CharIndex(a5)
	move.b	d6,g_P2CharIndex(a5)
	clr.w	g_Player1+$4(a5)
	clr.w	g_Player2+$4(a5)
	jsr	PlayerSelect_Run(pc)
	jsr	$5242(a5)	; -> Snd_StopAll
loc_066E38:
	clr.b	g_PalBaseDirty(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_066E60
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	lea.l	$C(a7),a7
	bra.s	loc_066E60
loc_066E5C:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066E60:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_066E5C
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_P1Health(a5),g_Player1+$68(a5)
	move.w	g_P2Health(a5),g_Player2+$68(a5)
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
