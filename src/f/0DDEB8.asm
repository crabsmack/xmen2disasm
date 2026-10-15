; ---------------------------------------------------------------------------
; ControlPanel_GetSize - vtable +$06: return sizeof(CONTROLPANEL) = $A4 bytes
; In:  none
; Out: d0 = $A4
; Evidence: slot +$6 of the CONTROLPANEL descriptor $0DE48E; never runs in the corpus
; ---------------------------------------------------------------------------
ControlPanel_GetSize:
	link.w	a6,#$0
	move.l	#$A4,d0
	unlk	a6
	rts
