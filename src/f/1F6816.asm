; ---------------------------------------------------------------------------
; sub_1F6816	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F6816:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	lea.l	-$13E8(a5),a4
	clr.b	d7
	moveq	#$40,d3
loc_1F6826:
	ext.w	d7
	move.l	d7,d0
	add.w	d0,d0
	lea.l	-$3980(a5),a0
	ext.w	d7
	move.l	d7,d1
	add.w	d1,d1
	move.w	(a0,d0.w),(a4,d1.w)
	move.b	d7,d0
	addq.b	#$1,d7
	cmp.b	d7,d3
	bgt.s	loc_1F6826
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
