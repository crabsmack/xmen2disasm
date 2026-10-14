; ---------------------------------------------------------------------------
; sub_1F3226	[jt 2460]
; ---------------------------------------------------------------------------
sub_1F3226:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2A(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$23(a0),d0
	move.w	d0,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1F31F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
