; ---------------------------------------------------------------------------
; FloatBubbleExplode_Nop6A - vtable +$6A: empty hook for FLOATBUBBLEEXPLODE (only calls the empty FloatBubbleExplode_NopStatic)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the FLOATBUBBLEEXPLODE descriptor $0AC1B8; never runs in the corpus
; ---------------------------------------------------------------------------
FloatBubbleExplode_Nop6A:
	link.w	a6,#$0
	jsr	FloatBubbleExplode_NopStatic(pc)
	unlk	a6
	rts
