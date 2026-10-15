; ---------------------------------------------------------------------------
; SiberiaB1_ResetPalCycles - SiberiaB1: zero the palette-cycle counters
; In:  none
; Out: none
; Evidence: counters passed to sub_159FD6
; ---------------------------------------------------------------------------
SiberiaB1_ResetPalCycles:
	link.w	a6,#$0
	clr.w	-$3B34(a5)
	clr.w	-$3B44(a5)
	clr.w	-$3B3C(a5)
	unlk	a6
	rts
