; ---------------------------------------------------------------------------
; sub_038BAC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_038BAC:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	lea.l	$8BA(a5),a0
	move.l	a0,-$3A48(a5)
	move.w	#$7BE,-$1D42(a5)
	move.w	#$42,-$1D44(a5)
	move.w	g_VdpReg11(a5),d0
	addq.w	#$3,d0
	move.w	d0,($C00004).l
	moveq	#$0,d7
	move.l	#$1C0,d3
loc_038BDC:
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_HScrollBuf(a5),a0
	clr.w	(a0,d0.w)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_038BDC
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
