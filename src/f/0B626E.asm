; ---------------------------------------------------------------------------
; SavageA4_LoadLevel - SavageA4: load the Chamber level (Level_Load with the class list jt[$1E8A]) and set the parallax factors
; In:  none
; Out: none
; Evidence: TAS 33301
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_LoadLevel:
	link.w	a6,#$0
	lea.l	$1C8A(a5),a0
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
	lea.l	$1C7A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1C92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1C92(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1C82(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1C82(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.b	#$1,-$38B4(a5)
	clr.b	g_BgWrapY(a5)
	clr.w	g_BgScrollFactorX(a5)
	move.w	#$100,g_BgScrollFactorY(a5)
	clr.w	g_FgScrollBaseY(a5)
	move.w	#$64,g_BgScrollBaseY(a5)
	clr.w	g_FgScrollBaseX(a5)
	clr.w	g_BgScrollBaseX(a5)
	unlk	a6
	rts
