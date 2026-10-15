; ---------------------------------------------------------------------------
; RetractFloor_Nop6A - vtable +$6A: empty hook for RETRACTFLOOR
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor RETRACTFLOOR slot +$6A; jt 167; body is link/unlk/rts
; ---------------------------------------------------------------------------
RetractFloor_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
