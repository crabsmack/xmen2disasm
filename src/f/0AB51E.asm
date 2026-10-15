; ---------------------------------------------------------------------------
; FloatBubble_NopStatic - empty non-virtual helper (called from FLOATBUBBLE's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are FLOATBUBBLE methods; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
FloatBubble_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
