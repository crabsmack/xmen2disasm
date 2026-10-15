; ---------------------------------------------------------------------------
; SavageB1_LoadLevel - SavageB1: load the Jungle_2 level (Level_Load with the class list jt[$1CA2]) and parallax factors
; In:  none
; Out: none
; Evidence: TAS 29531
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageB1_LoadLevel:
	link.w	a6,#$0
	lea.l	$1AA2(a5),a0
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
	lea.l	$1A92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2352(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1AAA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2342(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A9A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.w	#$100,g_BgScrollFactorY(a5)
	move.w	#$8C,g_BgScrollFactorX(a5)
	clr.w	g_BgScrollBaseY(a5)
	move.b	#$1,g_BgWrapX(a5)
	clr.b	g_BgWrapY(a5)
	move.b	#$1,g_TwoPlayerStep(a5)
	clr.b	g_TwoPlayerStep(a5)
	move.b	#$1,-$38B4(a5)
	unlk	a6
	rts
