; ---------------------------------------------------------------------------
; ControlBox_GetSize - vtable +$06: return sizeof(CONTROLBOX) = $A4 bytes
; In:  none
; Out: d0 = $A4
; Evidence: slot +$6 of the CONTROLBOX descriptor $0DDA02; never runs in the corpus
; ---------------------------------------------------------------------------
ControlBox_GetSize:
	link.w	a6,#$0
	move.l	#$A4,d0
	unlk	a6
	rts
