; ---------------------------------------------------------------------------
; loc_1F3FCC	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1F3FCC:
	clr.w	$A6(a4)
	bra.s	loc_1F4020
loc_1F3FD2:
	move.w	#$14,$A6(a4)
	move.l	a3,$BC(a4)
	bra.s	loc_1F4020
loc_1F3FDE:
	moveq	#$0,d0
	move.w	$C0(a4),d0
	move.w	#$80,d1
	and.w	d0,d1
	beq.s	loc_1F4016
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F4000
	move.w	-$3B9E(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F4008
loc_1F4000:
	move.w	-$3B9E(a5),d0
	and.w	-$3A38(a5),d0
loc_1F4008:
	beq.s	loc_1F4016
	move.w	#$14,$A6(a4)
	move.l	a3,$BC(a4)
	bra.s	loc_1F4020
loc_1F4016:
	clr.w	$A6(a4)
	bra.s	loc_1F4020
