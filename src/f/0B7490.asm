; ---------------------------------------------------------------------------
; loc_0B7490
; ---------------------------------------------------------------------------
loc_0B7490:
	tst.w	$16(a4)
	ble.s	loc_0B749E
	move.w	#$FF40,$1E(a4)
	bra.s	loc_0B74AA
loc_0B749E:
	tst.w	$16(a4)
	bge.s	loc_0B74AA
	move.w	#$C0,$1E(a4)
loc_0B74AA:
	tst.w	$18(a4)
	ble.s	loc_0B74B8
	move.w	#$FF40,$1E(a4)
	bra.s	loc_0B74C4
loc_0B74B8:
	tst.w	$18(a4)
	bge.s	loc_0B74C4
	move.w	#$C0,$1E(a4)
loc_0B74C4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
