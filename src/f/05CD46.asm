; ---------------------------------------------------------------------------
; Tusk_Nop6A - vtable +$6A: empty hook for TUSK
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor TUSK slot +$6A; jt 420; body is link/unlk/rts
; ---------------------------------------------------------------------------
Tusk_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
