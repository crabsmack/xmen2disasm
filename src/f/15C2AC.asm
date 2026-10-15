; ---------------------------------------------------------------------------
; Math_DivModU - unsigned 32-bit divide with remainder
; In:  d0 = dividend, d1 = divisor
; Out: d1 = quotient, d0 = remainder
; Evidence: 16-bit divisor: two divu.w steps; otherwise a shift-subtract loop (d2/d3 saved)
; ---------------------------------------------------------------------------
Math_DivModU:
	move.w	d1,-(a7)
	swap	d1
	tst.w	d1
	bne.s	loc_15C2D0
	move.l	d0,d1
	clr.w	d1
	swap	d1
	beq.s	loc_15C2C6
	divu.w	(a7),d1
	swap	d1
	swap	d0
	move.w	d1,d0
	swap	d0
loc_15C2C6:
	divu.w	(a7)+,d0
	move.w	d0,d1
	clr.w	d0
	swap	d0
	rts
loc_15C2D0:
	swap	d1
	move.w	d2,(a7)
	move.l	d3,-(a7)
	move.w	d0,d2
	move.l	d1,d3
	moveq	#$1,d1
	clr.w	d0
	swap	d0
	bne.s	loc_15C2EE
	swap	d0
	move.w	d2,d0
	moveq	#$0,d1
	bra.s	loc_15C300
loc_15C2EA:
	add.w	d1,d1
	bcs.s	loc_15C300
loc_15C2EE:
	add.w	d2,d2
	addx.l	d0,d0
	cmp.l	d3,d0
	bcs.s	loc_15C2EA
	sub.l	d3,d0
	add.w	d1,d1
	bset	#$0,d1
	bcc.s	loc_15C2EE
loc_15C300:
	move.l	(a7)+,d3
	move.w	(a7)+,d2
	rts
