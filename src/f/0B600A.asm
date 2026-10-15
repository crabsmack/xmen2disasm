; ---------------------------------------------------------------------------
; SavageA4_ResetPalCycles - SavageA4: reset the six palette-cycle counters
; In:  none
; Out: none
; Evidence: -$3B34/-$3B44/-$3B3C/-$3B36/-$3B46/-$3B3E := 0; caller SavageA4_InstallHooks
; ---------------------------------------------------------------------------
SavageA4_ResetPalCycles:
	link.w	a6,#$0
	clr.w	-$3B34(a5)
	clr.w	-$3B44(a5)
	clr.w	-$3B3C(a5)
	clr.w	-$3B36(a5)
	clr.w	-$3B46(a5)
	clr.w	-$3B3E(a5)
	unlk	a6
	rts
