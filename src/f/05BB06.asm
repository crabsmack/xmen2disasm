; ---------------------------------------------------------------------------
; Boulder_Nop6A - vtable +$6A: empty hook for BOULDER
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$6A (tools/classes.py); TAS frames 20323-20323 (1 active)
; ---------------------------------------------------------------------------
Boulder_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
