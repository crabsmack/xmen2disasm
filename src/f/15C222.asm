; ---------------------------------------------------------------------------
; Math_LDivS - signed 32-bit divide (compiler runtime, 68020 divs.l path or 68000 fallback)
; In:  d0 = dividend, d1 = divisor
; Out: d0 = quotient
; Evidence: lea/jmp -2(a0,a1) selects the 68000 path (a1 = 2) over an embedded divs.l d1,d1:d0; fallback Math_DivModS then move.l d1,d0; DrawList_Add uses it to turn a node pointer into an index
; ---------------------------------------------------------------------------
Math_LDivS:
	lea.l	$15C22E(pc),a0
	movea.w	#$2,a1
	dc.w	$4EF0,$92FE	; insn: jmp -$2(a0, a1.w)
