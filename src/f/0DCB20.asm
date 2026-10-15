; ---------------------------------------------------------------------------
; Blast_GetSize - vtable +$06: return sizeof(BLAST) = $9E bytes
; In:  none
; Out: d0 = $9E
; Evidence: slot +$6 of the BLAST descriptor $0DD0E8; never runs in the corpus
; ---------------------------------------------------------------------------
Blast_GetSize:
	link.w	a6,#$0
	move.l	#$9E,d0
	unlk	a6
	rts
