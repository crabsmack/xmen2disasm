; ---------------------------------------------------------------------------
; PerimeterDoor_Nop66 - vtable +$66: empty (loads `this` into a4 and returns; every class has this body)
; In:  8(a6) = this
; Out: none
; Evidence: slot +$66 of the PERIMETERDOOR descriptor $0AC3B2; never runs in the corpus
; ---------------------------------------------------------------------------
PerimeterDoor_Nop66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
