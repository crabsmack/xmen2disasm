; ---------------------------------------------------------------------------
; EvilMaker_Nop6A - vtable +$6A: empty hook for EVILMAKER
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the EVILMAKER descriptor $094BAC; never runs in the corpus
; ---------------------------------------------------------------------------
EvilMaker_Nop6A:
	link.w	a6,#$0
	jsr	EvilMaker_NopStatic(pc)
	unlk	a6
	rts
