; ---------------------------------------------------------------------------
; sub_0B0484	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B0484:
	link.w	a6,#$0
	lea.l	$1C6A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$70,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$1C5A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A8A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A8A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1ABA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1C62(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	clr.w	-$3980(a5)
	move.b	#$1,-$38B4(a5)
	clr.b	-$38DE(a5)
	clr.b	-$3AB6(a5)
	subi.w	#$60,-$3A92(a5)
	move.w	-$3A92(a5),-$3A9A(a5)
	move.w	#$140,-$3496(a5)
	move.w	#$120,-$3498(a5)
	unlk	a6
	rts
