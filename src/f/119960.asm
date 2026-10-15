; ---------------------------------------------------------------------------
; Synchronizer_Run - Synchronizer per frame: call the state function at +$2C
; In:  8(a6) = this
; Out: none
; Evidence: method 3 of SYNCHRONIZER; TAS 642 frames
; ---------------------------------------------------------------------------
Synchronizer_Run:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	$2C(a4),a0
	jsr	(a0)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
