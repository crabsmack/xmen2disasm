; ---------------------------------------------------------------------------
; AvalonB1_RunScene - scene function for 'AvalonB1 Exterior': load the level, place the players, run the camera intro and the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry for 'AvalonB1 Exterior'; sub_1F98A8 level load, Players_PlaceAtStart(0,0), AvalonB1_InstallTileHooks, AvalonB1_InitCamera, level loop sub_1FA6FE
; ---------------------------------------------------------------------------
AvalonB1_RunScene:
	link.w	a6,#$FFE0
	move.l	a4,-(a7)
	lea.l	-$20(a6),a4
	move.l	a4,-$3B14(a5)
	lea.l	$AA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$5C,d0
	move.l	d0,-(a7)
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$9A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	move.b	#$1,-$38B4(a5)
	clr.w	-$3496(a5)
	clr.w	-$3498(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	AvalonB1_InstallTileHooks(pc)
	lea.l	AvalonB1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	clr.b	-$38DE(a5)
	clr.w	-$3CDC(a5)
	clr.w	-$3CE0(a5)
	clr.w	-$3CDE(a5)
	clr.w	-$3CE2(a5)
	clr.w	-$3CE6(a5)
	clr.w	-$3CE4(a5)
	jsr	AvalonB1_InitCamera(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	move.b	#$1,g_SndMute(a5)
	jsr	$5002(a5)	; -> sub_1FA6FE
	clr.b	g_SndMute(a5)
	jsr	$5242(a5)	; -> Snd_StopAll
	movea.l	-$24(a6),a4
	unlk	a6
	rts
