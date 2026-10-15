; ---------------------------------------------------------------------------
; loc_0AB6D8	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_0AB6D8:
	move.w	#$8,$1E(a4)
	clr.w	$20(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB6F4
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0AB6FC
loc_0AB6F4:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB6FC:
	move.w	d0,$16(a4)
	clr.w	$18(a4)
	bra.s	loc_0AB750
