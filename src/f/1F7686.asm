; ---------------------------------------------------------------------------
; loc_1F7686	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1F7686:
	tst.w	$16(a4)
	ble.s	loc_1F7696
	movea.l	$10(a6),a0
	tst.b	$3(a0)
	blt.s	loc_1F76A6
loc_1F7696:
	tst.w	$16(a4)
	bge.s	loc_1F76AA
	movea.l	$10(a6),a0
	tst.b	$3(a0)
	ble.s	loc_1F76AA
loc_1F76A6:
	clr.w	$16(a4)
loc_1F76AA:
	tst.w	$18(a4)
	ble.s	loc_1F76BA
	movea.l	$10(a6),a0
	tst.b	$4(a0)
	blt.s	loc_1F76CE
loc_1F76BA:
	tst.w	$18(a4)
	bge.w	loc_1F78CA
	movea.l	$10(a6),a0
	tst.b	$4(a0)
	ble.w	loc_1F78CA
loc_1F76CE:
	clr.w	$18(a4)
	bra.w	loc_1F78CA
