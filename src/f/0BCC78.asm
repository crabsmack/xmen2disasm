; ---------------------------------------------------------------------------
; SavageMediumBio_ClassInit - per-level class setup that does nothing: only the parent's (SavageBioBase_ClassInit, which calls the empty SavageBio_NopStatic) (SAVAGEMEDIUMBIO override of slot +$5E ClassInit)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the SAVAGEMEDIUMBIO descriptor $0BD39C; TAS frames 33387-33387 (1 frames active)
; ---------------------------------------------------------------------------
SavageMediumBio_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$207A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$5E(a0),a1
	jsr	(a1)
	unlk	a6
	rts
