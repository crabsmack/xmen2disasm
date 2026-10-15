; ---------------------------------------------------------------------------
; Synchronizer_Nop26 - Synchronizer: empty method 8 (+$26)
; In:  none
; Out: none
; Evidence: method 8 of SYNCHRONIZER; body is link/unlk/rts
; ---------------------------------------------------------------------------
Synchronizer_Nop26:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	-$4(a6),a4
	unlk	a6
	rts
