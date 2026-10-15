; ---------------------------------------------------------------------------
; SavageBioBase_ClassInit - vtable +$5E: per-level class setup for SAVAGEBIOBASE (calls the empty SavageBio_NopStatic)
; Evidence: TAS 33387
; ---------------------------------------------------------------------------
SavageBioBase_ClassInit:
	link.w	a6,#$0
	jsr	SavageBio_NopStatic(pc)
	unlk	a6
	rts
