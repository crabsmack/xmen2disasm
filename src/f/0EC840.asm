; ---------------------------------------------------------------------------
; CoreElevator_Nop66 - CoreElevator: no-op override of virtual slot 24 (+$66)
; In:  8(a6) = this (unused)
; Out: none
; Evidence: method 24 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_Nop66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
