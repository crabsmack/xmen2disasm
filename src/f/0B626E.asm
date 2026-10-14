; ---------------------------------------------------------------------------
; sub_0B626E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B626E:
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
	jsr	$4FCA(a5)	; -> sub_1F98A8
	move.b	#$1,-$38B4(a5)
	clr.b	-$3AB6(a5)
	clr.w	-$3496(a5)
	move.w	#$100,-$3498(a5)
	clr.w	-$349E(a5)
	move.w	#$64,-$34A0(a5)
	clr.w	-$349A(a5)
	clr.w	-$349C(a5)
	unlk	a6
	rts
