; ---------------------------------------------------------------------------
; SavageBioBase_GetSize - vtable +$06: return sizeof(SAVAGEBIOBASE) = $AE bytes
; In:  none
; Out: d0 = $AE
; Evidence: slot +$6 of the SAVAGEBIOBASE descriptor $0BD27C; never runs in the corpus
; ---------------------------------------------------------------------------
SavageBioBase_GetSize:
	link.w	a6,#$0
	move.l	#$AE,d0
	unlk	a6
	rts
