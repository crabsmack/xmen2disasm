; ---------------------------------------------------------------------------
; AvalonB2_RunScene - scene function for 'AvalonB2 InnerShell': load the level, place the players, hooks, camera, sprite timer, run the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry for 'AvalonB2 InnerShell' (also attract demo 2); Snd_StopAll, Level_Load load, Players_PlaceAtStart, CAMERA New with AvalonB2_CamHook, Timer_Create/Timer_Start, level loop Level_Run
; ---------------------------------------------------------------------------
AvalonB2_RunScene:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	$5242(a5)	; -> Snd_StopAll
	lea.l	$4E2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
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
	lea.l	$4D2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_BgScrollFactorX(a5)
	clr.w	g_BgScrollFactorY(a5)
	move.b	#$1,-$38B4(a5)
	lea.l	AvalonB2_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	clr.b	g_TwoPlayerStep(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	AvalonB2_NopStatic(pc)
	jsr	AvalonB2_InstallTileHooks(pc)
	jsr	AvalonB2_InitSprite(pc)
	pea.l	AvalonB2_CamHook(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	AvalonB2_AnimSprite(pc)
	moveq	#$3C,d1
	move.l	d1,-(a7)
	pea.l	$3F32(a5)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	jsr	$5002(a5)	; -> Level_Run
	jsr	$5242(a5)	; -> Snd_StopAll
	movea.l	-$4(a6),a4
	unlk	a6
	rts
