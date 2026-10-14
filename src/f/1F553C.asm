; ---------------------------------------------------------------------------
; sub_1F553C	[jt 2494]
; ---------------------------------------------------------------------------
sub_1F553C:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.w	$16(a6),d6
	move.w	$E(a6),d0
	ext.l	d0
	move.w	$12(a6),d1
	ext.l	d1
	add.l	d0,d1
	subq.l	#$1,d1
	lsl.l	#$4,d1
	add.l	d1,d1
	movea.l	d1,a4
	adda.l	$8(a6),a4
	moveq	#$3,d0
	and.w	d6,d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$D,d0
	lsl.l	d0,d1
	move.w	d1,d6
	clr.w	d7
	moveq	#$10,d3
loc_1F5574:
	move.w	#$9FFF,d0
	and.w	(a4),d0
	move.w	d6,d1
	or.w	d0,d1
	move.w	d1,(a4)
	addq.w	#$2,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F5574
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
