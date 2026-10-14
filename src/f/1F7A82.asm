; ---------------------------------------------------------------------------
; loc_1F7A82
; ---------------------------------------------------------------------------
loc_1F7A82:
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F7A8E
	move.w	d7,d0
	bra.s	loc_1F7A90
loc_1F7A8E:
	move.w	d6,d0
loc_1F7A90:
	move.w	d0,$6(a4)
loc_1F7A94:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
