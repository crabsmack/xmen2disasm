; ---------------------------------------------------------------------------
; FloatBubble_Nop6A - vtable +$6A: empty hook for FLOATBUBBLE
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the FLOATBUBBLE descriptor $0AB496; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
FloatBubble_Nop6A:
	link.w	a6,#$0
	jsr	FloatBubble_NopStatic(pc)
	unlk	a6
	rts
