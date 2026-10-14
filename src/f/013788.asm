; ---------------------------------------------------------------------------
; loc_013788
; ---------------------------------------------------------------------------
loc_013788:
	tst.w	$16(a4)
	ble.s	loc_013796
	move.w	#$FF72,$1E(a4)
	bra.s	loc_0137A2
loc_013796:
	tst.w	$16(a4)
	bge.s	loc_0137A2
	move.w	#$8E,$1E(a4)
loc_0137A2:
	tst.w	$18(a4)
	ble.s	loc_0137B0
	move.w	#$FF72,$1E(a4)
	bra.s	loc_0137BC
loc_0137B0:
	tst.w	$18(a4)
	bge.s	loc_0137BC
	move.w	#$8E,$1E(a4)
loc_0137BC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
