; ---------------------------------------------------------------------------
; Hologram_Nop66 - Hologram: no-op override of virtual slot 24 (+$66)
; In:  8(a6) = this (unused)
; Out: none
; Evidence: method 24 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_Nop66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
