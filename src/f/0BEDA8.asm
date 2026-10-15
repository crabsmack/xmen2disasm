; ---------------------------------------------------------------------------
; SporeMine_Nop6A - vtable +$6A: empty hook for SPOREMINE
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SPOREMINE descriptor $0BF580; never runs in the corpus
; ---------------------------------------------------------------------------
SporeMine_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
