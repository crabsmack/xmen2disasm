; ---------------------------------------------------------------------------
; BaniMazaA2_LoadLevel - load the BaniMazaA2 (Apocalypse boss) level and install its frame and draw hooks
; In:  none
; Out: none
; Evidence: Level_Load level load (class list jt $44A78); g_SceneFrameHook = BaniMazaA2_FrameHook, -$38F4 = BaniMazaA2_DrawHook
; ---------------------------------------------------------------------------
BaniMazaA2_LoadLevel:
	link.w	a6,#$0
	lea.l	$94A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$40,d0
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
	lea.l	$93A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$952(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$952(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$942(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$942(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.w	#$100,g_BgScrollFactorY(a5)
	move.w	#$100,g_BgScrollFactorX(a5)
	move.b	#$1,g_HudOn(a5)
	clr.b	g_TwoPlayerStep(a5)
	lea.l	BaniMazaA2_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	lea.l	BaniMazaA2_DrawHook(pc),a0
	move.l	a0,g_SceneDrawHook(a5)
	unlk	a6
	rts
