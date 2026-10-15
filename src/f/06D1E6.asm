; ---------------------------------------------------------------------------
; Brood_Nop6A - vtable +$6A: empty hook for BROOD
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor BROOD slot +$6A; jt 515; body is link/unlk/rts
; ---------------------------------------------------------------------------
Brood_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
