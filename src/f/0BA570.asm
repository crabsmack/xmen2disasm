; ---------------------------------------------------------------------------
; SavageBigBio_ClassInit - vtable +$5E: run the parent's (SAVAGEBIOBASE) class setup
; Evidence: TAS 33387
; ---------------------------------------------------------------------------
SavageBigBio_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$2072(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$5E(a0),a1
	jsr	(a1)
	unlk	a6
	rts
