; ---------------------------------------------------------------------------
; SentinelsA1_ResetPalCycles - SentinelsA1: zero the palette-cycle timers/indices
; In:  none
; Out: none
; Evidence: clears the counter triples passed to sub_159FD6 by SentinelsA1_CyclePalettes
; ---------------------------------------------------------------------------
SentinelsA1_ResetPalCycles:
	link.w	a6,#$0
	clr.w	-$3B32(a5)
	clr.w	-$3B42(a5)
	clr.w	-$3B3A(a5)
	clr.w	-$3B34(a5)
	clr.w	-$3B44(a5)
	clr.w	-$3B3C(a5)
	clr.w	-$3B36(a5)
	clr.w	-$3B46(a5)
	clr.w	-$3B3E(a5)
	clr.w	-$3B38(a5)
	clr.w	-$3B48(a5)
	clr.w	-$3B40(a5)
	clr.w	-$3BE8(a5)
	clr.w	-$3BEA(a5)
	clr.w	-$3BEC(a5)
	clr.w	-$3BEE(a5)
	clr.w	-$3BF0(a5)
	clr.w	-$3BF2(a5)
	unlk	a6
	rts
