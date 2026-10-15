; ---------------------------------------------------------------------------
; AvalonA4_NopStatic - empty helper called by AvalonA4_ResetEffectCounters
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA4_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
