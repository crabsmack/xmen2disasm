; ---------------------------------------------------------------------------
; Apocalypse_Nop6A - vtable +$6A: empty hook for APOCALYPSE (only calls Apocalypse_CallNopStatics)
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor APOCALYPSE slot +$6A; jt 345
; ---------------------------------------------------------------------------
Apocalypse_Nop6A:
	link.w	a6,#$0
	jsr	Apocalypse_CallNopStatics(pc)
	unlk	a6
	rts
