; ---------------------------------------------------------------------------
; CapedAcolyte_Nop6A - vtable +$6A: empty hook for CAPEDACOLYTE
; In:  8(a6) = this (CAPEDACOLYTE object)
; Out: none
; Evidence: class descriptor CAPEDACOLYTE slot +$6A (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
CapedAcolyte_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
