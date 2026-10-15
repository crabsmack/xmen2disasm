; ---------------------------------------------------------------------------
; AvalonA4_ResetEffectCounters - reset the AvalonA4 stage-effect counters used by sub_034D7A
; In:  none
; Out: none
; Evidence: called by AvalonA4_RunScene; byte -$3CB0 = 0, -$3B32 = 5, -$3B3A = 0, -$3B34 = 4, -$3B3C = 0
; ---------------------------------------------------------------------------
AvalonA4_ResetEffectCounters:
	link.w	a6,#$0
	jsr	AvalonA4_NopStatic(pc)
	clr.b	-$3CB0(a5)
	move.w	#$5,-$3B32(a5)
	clr.w	-$3B3A(a5)
	move.w	#$4,-$3B34(a5)
	clr.w	-$3B3C(a5)
	unlk	a6
	rts
