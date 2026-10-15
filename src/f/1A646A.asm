; ---------------------------------------------------------------------------
; sub_1A646A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A646A:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A648A
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A6492
loc_1A648A:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A6492:
	beq.s	loc_1A64A8
	clr.w	$6C(a4)
	lea.l	sub_1A646A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A64BA
loc_1A64A8:
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A64BA:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
