; ---------------------------------------------------------------------------
; sub_10B9D0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_10B9D0:
	link.w	a6,#$0
	lea.l	$2A62(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$3E,d0
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
	lea.l	$2A52(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A6A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A6A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A5A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A5A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	clr.w	g_PalBase(a5)
	move.b	#$1,-$38B4(a5)
	clr.b	-$3AB4(a5)
	clr.w	-$3498(a5)
	move.w	#$100,-$3496(a5)
	clr.b	-$38DE(a5)
	unlk	a6
	rts
