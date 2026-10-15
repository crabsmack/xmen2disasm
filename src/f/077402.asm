; ---------------------------------------------------------------------------
; CloneA1_ResetPalCycle - reset the CloneA1 palette-cycle counters
; In:  none
; Out: none
; Evidence: clears -$3B32/-$3B42/-$3B3A and -$3B34/-$3B44/-$3B3C
; ---------------------------------------------------------------------------
CloneA1_ResetPalCycle:
	link.w	a6,#$0
	clr.w	-$3B32(a5)
	clr.w	-$3B42(a5)
	clr.w	-$3B3A(a5)
	clr.w	-$3B34(a5)
	clr.w	-$3B44(a5)
	clr.w	-$3B3C(a5)
	unlk	a6
	rts
