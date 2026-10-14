; ---------------------------------------------------------------------------
; loc_1FDBDC
; ---------------------------------------------------------------------------
loc_1FDBDC:
	move.l	d7,d0
	asl.w	#$2,d0
	moveq	#$0,d1
	move.l	d1,(a3,d0.w)
	addq.l	#$8,a4
	move.w	d7,d0
	addq.w	#$1,d7
loc_1FDBEC:
	cmp.w	-$2(a6),d7
	blt.w	loc_1FDB46
	clr.w	d7
	move.w	#$1C0,d3
loc_1FDBFA:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	-$BC6(a5),a0
	clr.w	(a0,d0.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1FDBFA
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
