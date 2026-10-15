; ---------------------------------------------------------------------------
; SavageBioBase_ClassInit - vtable +$5E: per-level class setup for SAVAGEBIOBASE
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SAVAGEBIOBASE descriptor $0BD27C; TAS frames 33387-33387 (1 frames active)
; ---------------------------------------------------------------------------
SavageBioBase_ClassInit:
	link.w	a6,#$0
	jsr	sub_0BD274(pc)
	unlk	a6
	rts
