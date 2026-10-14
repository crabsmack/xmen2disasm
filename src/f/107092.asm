; ---------------------------------------------------------------------------
; loc_107092
; ---------------------------------------------------------------------------
loc_107092:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1070A6
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1070AE
loc_1070A6:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1070AE:
	beq.s	loc_1070B6
	move.w	d7,$16(a4)
	bra.s	loc_1070DE
loc_1070B6:
	tst.b	$9D(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1070CA
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1070D2
loc_1070CA:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_1070D2:
	beq.s	loc_1070DE
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_1070DE:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
