; ---------------------------------------------------------------------------
; SavageBigBio_GetSize - vtable +$06: return sizeof(SAVAGEBIGBIO) = $B8 bytes
; In:  none
; Out: d0 = $B8
; Evidence: slot +$6 of the SAVAGEBIGBIO descriptor $0BD30C; never runs in the corpus
; ---------------------------------------------------------------------------
SavageBigBio_GetSize:
	link.w	a6,#$0
	move.l	#$B8,d0
	unlk	a6
	rts
