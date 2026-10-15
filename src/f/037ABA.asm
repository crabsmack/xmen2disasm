; ---------------------------------------------------------------------------
; ThronePhone_Nop6A - vtable +$6A: empty hook for THRONEPHONE
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor THRONEPHONE slot +$6A; jt 250; body is link/unlk/rts
; ---------------------------------------------------------------------------
ThronePhone_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
