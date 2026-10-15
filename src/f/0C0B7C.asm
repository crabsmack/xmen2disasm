; ---------------------------------------------------------------------------
; SwampFly_Nop6A - vtable +$6A: empty hook for SWAMPFLY
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SWAMPFLY descriptor $0C0CEA; TAS frames 27881-29687 (2 frames active)
; ---------------------------------------------------------------------------
SwampFly_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
