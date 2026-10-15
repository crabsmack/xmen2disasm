; ---------------------------------------------------------------------------
; Math_LDivS_Sel - Math_LDivS CPU-path selector: bra to the 68000 path (an embedded 68020 divs.l follows)
; In:  as Math_LDivS
; Out: as Math_LDivS
; Evidence: bra Math_LDivS_68000 then dc.w $4C41,$0801 (divs.l) / rts
; ---------------------------------------------------------------------------
Math_LDivS_Sel:
	bra.s	Math_LDivS_68000
