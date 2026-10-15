; ---------------------------------------------------------------------------
; Level_Run - run a loaded level: display on, fade in, init classes, frame loop until the scene ends, class teardown, fade out
; In:  none
; Out: none
; Evidence: Spr_InitLinks, Pad_Update, reg1 display bit on, Pal_StartFade(0, -1, Tbl_FadeBlack); ClassList_InitAll; Level_FrameLoop; ClassList_CallSlot62; Pal_StartFade(7, -1, Tbl_FadeBlack) and waits for g_PalFadeActive; 23 callers (the <Stage>_RunScene functions)
; ---------------------------------------------------------------------------
Level_Run:
	link.w	a6,#$0
	clr.w	g_SceneExitTimer(a5)
	moveq	#$0,d0
	move.l	d0,g_VBlankCount(a5)
	clr.w	-$3A22(a5)
	clr.w	-$3A24(a5)
	clr.b	-$38C2(a5)
	move.w	-$3598(a5),-$3888(a5)
	tst.l	g_Camera(a5)
	bne.s	loc_1FA744
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	addq.w	#$8,a7
loc_1FA744:
	jsr	$5042(a5)	; -> Spr_InitLinks
	jsr	$50FA(a5)	; -> Pad_Update
	ori.w	#$40,g_VdpReg1(a5)
	move.w	g_VdpReg1(a5),($C00004).l
	tst.b	-$38B4(a5)
	beq.s	loc_1FA764
	jsr	$62(a5)	; -> HUD_Redraw
loc_1FA764:
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
	clr.b	-$38C6(a5)
	move.b	#$1,-$38BE(a5)
	jsr	ClassList_InitAll(pc)
	jsr	Level_FrameLoop(pc)
	jsr	ClassList_CallSlot62(pc)
	clr.b	-$38BE(a5)
	clr.b	g_DemoActive(a5)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	lea.l	$18(a7),a7
	bra.s	loc_1FA7C8
loc_1FA7C4:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_1FA7C8:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_1FA7C4
	tst.l	g_ParallaxDesc(a5)
	beq.s	loc_1FA7DE
	move.w	g_VdpReg11(a5),d0
	move.w	d0,($C00004).l
loc_1FA7DE:
	moveq	#$0,d0
	move.l	d0,g_VBlankGameHook(a5)
	unlk	a6
	rts
