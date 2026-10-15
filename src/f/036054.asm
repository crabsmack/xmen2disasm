; ---------------------------------------------------------------------------
; MagnetoBoss_Nop6A - vtable +$6A: empty hook for MAGNETOBOSS
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor MAGNETOBOSS slot +$6A; jt 237; body is link/unlk/rts
; ---------------------------------------------------------------------------
MagnetoBoss_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
