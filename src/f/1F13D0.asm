; ---------------------------------------------------------------------------
; sub_1F13D0	[jt 2423]
; ---------------------------------------------------------------------------
sub_1F13D0:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$10(a6),a4
	move.l	a4,d0
	beq.s	loc_1F1418
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F13F4
	move.w	$A(a4),d0
	bra.s	loc_1F13F8
loc_1F13F4:
	move.w	$E(a4),d0
loc_1F13F8:
	move.w	d0,d7
	movea.l	$8(a6),a0
	move.w	$4C(a0),d0
	ext.l	d0
	move.w	$E(a6),d1
	ext.l	d1
	sub.l	d1,d0
	ext.l	d7
	cmp.l	d0,d7
	sgt.b	d3
	neg.b	d3
	move.b	d3,d0
	bra.s	loc_1F141A
loc_1F1418:
	moveq	#$0,d0
loc_1F141A:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
