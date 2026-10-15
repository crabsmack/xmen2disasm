; ---------------------------------------------------------------------------
; FarAcolyte_Nop6A - vtable +$6A: empty hook for FARACOLYTE
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor FARACOLYTE slot +$6A (tools/classes.py); jt 89; body is link/unlk/rts
; ---------------------------------------------------------------------------
FarAcolyte_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
