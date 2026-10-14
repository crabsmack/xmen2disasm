; ---------------------------------------------------------------------------
; sub_0C1258	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C1258:
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
	jsr	$4FCA(a5)	; -> sub_1F98A8
	move.w	#$100,-$3498(a5)
	move.w	#$8C,-$3496(a5)
	clr.w	-$34A0(a5)
	move.b	#$1,-$3AB4(a5)
	clr.b	-$3AB6(a5)
	move.b	#$1,-$38DE(a5)
	clr.b	-$38DE(a5)
	move.b	#$1,-$38B4(a5)
	unlk	a6
	rts
