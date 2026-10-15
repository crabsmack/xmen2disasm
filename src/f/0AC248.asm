; ---------------------------------------------------------------------------
; FloatBubbleExplode_NopStatic - empty non-virtual helper (called from FLOATBUBBLEEXPLODE's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are FLOATBUBBLEEXPLODE methods; never runs in the corpus
; ---------------------------------------------------------------------------
FloatBubbleExplode_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
