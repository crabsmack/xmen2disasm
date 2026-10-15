; ---------------------------------------------------------------------------
; Math_LDivS_68000 - 68000 path of Math_LDivS: Math_DivModS and return the quotient
; In:  d0 = dividend, d1 = divisor
; Out: d0 = quotient
; Evidence: jsr Math_DivModS; move.l d1,d0
; ---------------------------------------------------------------------------
Math_LDivS_68000:
	jsr	Math_DivModS(pc)
	move.l	d1,d0
	rts
