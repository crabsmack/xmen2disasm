; ---------------------------------------------------------------------------
; SmallBrood_Nop6A - vtable +$6A: empty hook for SMALLBROOD
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SMALLBROOD descriptor $0840FE; never runs in the corpus
; ---------------------------------------------------------------------------
SmallBrood_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
