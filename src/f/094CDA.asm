; ---------------------------------------------------------------------------
; EvilDrop_Nop6A - vtable +$6A: empty hook for EVILDROP
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the EVILDROP descriptor $095126; never runs in the corpus
; ---------------------------------------------------------------------------
EvilDrop_Nop6A:
	link.w	a6,#$0
	jsr	EvilDrop_NopStatic(pc)
	unlk	a6
	rts
