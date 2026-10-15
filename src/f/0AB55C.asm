; ---------------------------------------------------------------------------
; loc_0AB55C	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_0AB55C:
	clr.w	$1E(a4)
	move.w	#$FFF8,$20(a4)
	clr.w	$16(a4)
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB57C
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_0AB584
loc_0AB57C:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB584:
	neg.l	d0
	move.w	d0,$18(a4)
	bra.w	loc_0AB750
loc_0AB58E:
	move.w	#$FFF8,$1E(a4)
	move.w	#$FFF8,$20(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB5AC
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0AB5B4
loc_0AB5AC:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB5B4:
	neg.l	d0
	move.w	d0,$16(a4)
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB5CC
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_0AB5D4
loc_0AB5CC:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB5D4:
	neg.l	d0
	move.w	d0,$18(a4)
	bra.w	loc_0AB750
