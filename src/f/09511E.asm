; ---------------------------------------------------------------------------
; EvilDrop_NopStatic - empty non-virtual helper (called from EVILDROP's ClassInit/Nop6A)
; Out: none
; Evidence: only callers are EVILDROP methods; TAS frames 49269-49269 (1 frames active)
; ---------------------------------------------------------------------------
EvilDrop_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
