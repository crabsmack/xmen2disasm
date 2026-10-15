; ---------------------------------------------------------------------------
; Tuskette_Nop6A - vtable +$6A: empty hook for TUSKETTE
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor TUSKETTE slot +$6A; jt 430; body is link/unlk/rts
; ---------------------------------------------------------------------------
Tuskette_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
