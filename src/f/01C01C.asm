; ---------------------------------------------------------------------------
; YoyoAcolyte_Nop6A - vtable +$6A: empty hook for YOYOACOLYTE
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor YOYOACOLYTE slot +$6A; jt 128; body is link/unlk/rts
; ---------------------------------------------------------------------------
YoyoAcolyte_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
