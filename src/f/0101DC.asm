; ---------------------------------------------------------------------------
; BigAcolyte_Nop6A - vtable +$6A: empty hook for BIGACOLYTE (only calls BigAcolyte_NopStatic)
; In:  8(a6) = this (BIGACOLYTE object)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$6A (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
BigAcolyte_Nop6A:
	link.w	a6,#$0
	jsr	BigAcolyte_NopStatic(pc)
	unlk	a6
	rts
