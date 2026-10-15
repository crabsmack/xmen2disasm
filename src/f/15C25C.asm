; ---------------------------------------------------------------------------
; Math_DivModS - signed 32-bit divide with remainder (sign-fixing wrapper over Math_DivModU)
; In:  d0 = dividend, d1 = divisor
; Out: d1 = quotient, d0 = remainder (sign of the dividend)
; Evidence: negates negative operands, calls Math_DivModU, negates quotient/remainder as C requires
; ---------------------------------------------------------------------------
Math_DivModS:
	tst.l	d0
	bmi.s	loc_15C274
	tst.l	d1
	bmi.s	loc_15C26A
	jsr	Math_DivModU(pc)
	rts
loc_15C26A:
	neg.l	d1
	jsr	Math_DivModU(pc)
	neg.l	d1
	rts
loc_15C274:
	neg.l	d0
	tst.l	d1
	bmi.s	loc_15C284
	jsr	Math_DivModU(pc)
	neg.l	d0
	neg.l	d1
	rts
loc_15C284:
	neg.l	d1
	jsr	Math_DivModU(pc)
	neg.l	d0
	rts
