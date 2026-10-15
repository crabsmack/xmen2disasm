; ---------------------------------------------------------------------------
; ControlPanel_Nop6A - vtable +$6A: empty hook for CONTROLPANEL
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the CONTROLPANEL descriptor $0DE48E; never runs in the corpus
; ---------------------------------------------------------------------------
ControlPanel_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
