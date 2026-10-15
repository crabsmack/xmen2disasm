; ---------------------------------------------------------------------------
; Math_LModS_68000 - 68000 path of Math_LModS: branch to Math_DivModS
; In:  d0 = dividend, d1 = divisor
; Out: d0 = remainder
; Evidence: bra Math_DivModS
; ---------------------------------------------------------------------------
Math_LModS_68000:
	bra.s	Math_DivModS
