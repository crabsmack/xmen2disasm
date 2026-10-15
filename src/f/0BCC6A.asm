; ---------------------------------------------------------------------------
; SavageMediumBio_GetSize - vtable +$06: return sizeof(SAVAGEMEDIUMBIO) = $B2 bytes
; In:  none
; Out: d0 = $B2
; Evidence: slot +$6 of the SAVAGEMEDIUMBIO descriptor $0BD39C; never runs in the corpus
; ---------------------------------------------------------------------------
SavageMediumBio_GetSize:
	link.w	a6,#$0
	move.l	#$B2,d0
	unlk	a6
	rts
