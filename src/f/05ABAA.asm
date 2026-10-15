; ---------------------------------------------------------------------------
; BaniMazaB2_LoadLevel - load the BaniMazaB2 (Exterior) level
; In:  none
; Out: none
; Evidence: Level_Load level load (class list jt $5958E); -$3898/-$389A = $B8/$C0
; ---------------------------------------------------------------------------
BaniMazaB2_LoadLevel:
	link.w	a6,#$0
	lea.l	$C4A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$C3A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$C52(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$C52(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$C42(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$C42(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_BgScrollFactorY(a5)
	clr.w	g_BgScrollFactorX(a5)
	move.w	#$B8,g_LevelLoadWord3898(a5)
	move.w	#$C0,g_StartCamOffsetY(a5)
	move.b	#$1,g_HudOn(a5)
	clr.b	g_TwoPlayerStep(a5)
	unlk	a6
	rts
