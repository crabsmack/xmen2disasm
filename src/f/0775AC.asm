; ---------------------------------------------------------------------------
; CloneA1_LoadLevel - load the CloneA1 (Factory Floor 1) level
; In:  none
; Out: none
; Evidence: Level_Load level load (class list jt $74994); byte g_BgWrapY = 0; -$3298 = $100
; ---------------------------------------------------------------------------
CloneA1_LoadLevel:
	link.w	a6,#$0
	lea.l	$108A(a5),a0
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
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$107A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1092(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1092(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1082(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1082(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.b	g_BgWrapY(a5)
	move.w	#$100,g_BgScrollFactorY(a5)
	clr.w	g_BgScrollFactorX(a5)
	move.b	#$1,g_HudOn(a5)
	clr.b	g_TwoPlayerStep(a5)
	unlk	a6
	rts
