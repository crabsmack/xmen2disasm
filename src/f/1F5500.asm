; ---------------------------------------------------------------------------
; sub_1F5500	[jt 2493]
; ---------------------------------------------------------------------------
sub_1F5500:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
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
	clr.w	d7
	moveq	#$10,d3
loc_1F5526:
	ori.w	#$8000,(a4)+
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F5526
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
