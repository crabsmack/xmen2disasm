; ---------------------------------------------------------------------------
; SavageC1_LoadLevel - SavageC1: load the Jungle_1 level (Level_Load with the class list $0CA756) and parallax factors
; In:  none
; Out: none
; Evidence: TAS 27717
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageC1_LoadLevel:
	link.w	a6,#$0
	lea.l	$234A(a5),a0
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
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$233A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2352(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2352(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2342(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2342(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.w	#$100,g_BgScrollFactorY(a5)
	move.w	#$8C,g_BgScrollFactorX(a5)
	move.b	#$1,g_BgWrapX(a5)
	move.b	#$1,g_TwoPlayerStep(a5)
	clr.b	g_TwoPlayerStep(a5)
	move.b	#$1,-$38B4(a5)
	unlk	a6
	rts
