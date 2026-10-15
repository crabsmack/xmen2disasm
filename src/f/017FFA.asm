; ---------------------------------------------------------------------------
; ShootAcolyte_Nop6A - vtable +$6A: empty hook for SHOOTACOLYTE
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor SHOOTACOLYTE slot +$6A; jt 103; body is link/unlk/rts
; ---------------------------------------------------------------------------
ShootAcolyte_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
