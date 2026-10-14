; ---------------------------------------------------------------------------
; sub_15DEAE	[jt 2055]
; ---------------------------------------------------------------------------
sub_15DEAE:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	-$164E(a5),a3
	movea.l	a3,a4
	moveq	#$0,d0
	move.l	d0,-$1652(a5)
	move.l	d0,-$1656(a5)
	move.l	d0,-$165A(a5)
	move.l	d0,-$165E(a5)
	clr.w	d7
	moveq	#$32,d3
loc_15DED2:
	moveq	#$0,d0
	move.l	d0,$8(a4)
	lea.l	$C(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_15DED2
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
