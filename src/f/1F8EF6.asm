; ---------------------------------------------------------------------------
; sub_1F8EF6	[jt 2536]
; ---------------------------------------------------------------------------
sub_1F8EF6:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	-$134C(a5),a3
	move.l	a3,-$1358(a5)
	movea.l	a3,a4
	moveq	#$0,d7
	moveq	#$1E,d3
loc_1F8F0C:
	moveq	#$0,d0
	move.l	d0,$4(a4)
	move.l	d0,(a4)
	move.l	d0,$8(a4)
	move.l	d0,$C(a4)
	move.w	#$5FF,$10(a4)
	clr.w	$12(a4)
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$14(a4),a4
	cmp.l	d7,d3
	bgt.s	loc_1F8F0C
	moveq	#$0,d0
	move.l	d0,-$1354(a5)
	move.l	d0,-$1350(a5)
	clr.b	-$135A(a5)
	moveq	#$0,d0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
