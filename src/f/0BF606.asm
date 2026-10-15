; ---------------------------------------------------------------------------
; sub_0BF606	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BF606:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$8C(a4),d0
	move.l	g_FrameCounter(a5),d1
	sub.l	d0,d1
	moveq	#$0,d0
	move.b	$8D(a4),d0
	move.l	d0,d7
	and.l	d1,d7
	moveq	#$0,d0
	move.b	$8E(a4),d0
	cmp.l	d7,d0
	shi.b	d3
	neg.b	d3
	beq.s	loc_0BF63A
	moveq	#$1,d0
	bra.s	loc_0BF63C
loc_0BF63A:
	moveq	#$0,d0
loc_0BF63C:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
