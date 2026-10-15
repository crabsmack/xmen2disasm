; ---------------------------------------------------------------------------
; Barrier_Nop6A - vtable +$6A: empty hook for BARRIER
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the BARRIER descriptor $0DCAAA; never runs in the corpus
; ---------------------------------------------------------------------------
Barrier_Nop6A:
	link.w	a6,#$0
	jsr	Barrier_NopStatic(pc)
	unlk	a6
	rts
