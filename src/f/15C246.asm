; ---------------------------------------------------------------------------
; Math_LModS - signed 32-bit remainder (compiler runtime, 68020 divs.l path or 68000 fallback)
; In:  d0 = dividend, d1 = divisor
; Out: d0 = remainder
; Evidence: same dispatch as Math_LDivS; 68020 path divs.l then exg d1,d0; 68000 path Math_DivModS which leaves the remainder in d0
; ---------------------------------------------------------------------------
Math_LModS:
	lea.l	Math_LModS_68000(pc),a0
	movea.w	#$2,a1
	dc.w	$4EF0,$92FE	; insn: jmp -$2(a0, a1.w)
