; ---------------------------------------------------------------------------
; BaniMazaA1_LoadLevel - load the BaniMazaA1 (Moving Blocks) level
; In:  none
; Out: none
; Evidence: Level_Load level load (class list jt $4383A); -$3298/-$3296 = $100/$100; byte g_BgWrapX = 1
; ---------------------------------------------------------------------------
BaniMazaA1_LoadLevel:
	link.w	a6,#$0
	lea.l	$92A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$6,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$91A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$932(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$932(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$922(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$922(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.w	#$100,g_BgScrollFactorY(a5)
	move.w	#$100,g_BgScrollFactorX(a5)
	move.b	#$1,g_BgWrapX(a5)
	move.b	#$1,g_TwoPlayerStep(a5)
	clr.b	g_TwoPlayerStep(a5)
	move.b	#$1,g_HudOn(a5)
	unlk	a6
	rts
