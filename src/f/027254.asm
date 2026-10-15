; ---------------------------------------------------------------------------
; Zapper_Nop6A - vtable +$6A: empty hook for ZAPPER
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor ZAPPER slot +$6A; jt 176; body is link/unlk/rts
; ---------------------------------------------------------------------------
Zapper_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
