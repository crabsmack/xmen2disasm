; ---------------------------------------------------------------------------
; Blast_Nop6A - vtable +$6A: empty hook for BLAST
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the BLAST descriptor $0DD0E8; never runs in the corpus
; ---------------------------------------------------------------------------
Blast_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
