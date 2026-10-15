; ---------------------------------------------------------------------------
; ControlBox_Nop6A - vtable +$6A: empty hook for CONTROLBOX
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the CONTROLBOX descriptor $0DDA02; never runs in the corpus
; ---------------------------------------------------------------------------
ControlBox_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
