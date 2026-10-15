; ---------------------------------------------------------------------------
; BigAcolyte_NopStatic - empty non-virtual helper (called from BIGACOLYTE's ClassInit/Nop6A)
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; callers are BIGACOLYTE slot +$6A and +$5E
; ---------------------------------------------------------------------------
BigAcolyte_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
