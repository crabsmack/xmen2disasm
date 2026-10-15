; ---------------------------------------------------------------------------
; SavageBigBio_ClassInit - vtable +$5E: per-level class setup for SAVAGEBIGBIO
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SAVAGEBIGBIO descriptor $0BD30C; TAS frames 33387-33387 (1 frames active); calls parent SAVAGEBIOBASE slot +$5E
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
