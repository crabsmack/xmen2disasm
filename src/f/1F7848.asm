; ---------------------------------------------------------------------------
; loc_1F7848	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_1F7848:
	tst.w	$4(a3)
	bge.s	loc_1F7858
	tst.w	$16(a4)
	bge.s	loc_1F7858
	clr.w	$16(a4)
loc_1F7858:
	tst.w	$4(a3)
	ble.s	loc_1F7868
	tst.w	$16(a4)
	ble.s	loc_1F7868
	clr.w	$16(a4)
loc_1F7868:
	tst.w	$18(a4)
	bge.s	loc_1F78CA
	clr.w	$18(a4)
	bra.s	loc_1F78CA
loc_1F7874:
	tst.w	$4(a3)
	bge.s	loc_1F7884
	tst.w	$18(a4)
	bge.s	loc_1F7884
	clr.w	$18(a4)
loc_1F7884:
	tst.w	$4(a3)
	ble.s	loc_1F7894
	tst.w	$18(a4)
	ble.s	loc_1F7894
	clr.w	$18(a4)
loc_1F7894:
	tst.w	$16(a4)
	bge.s	loc_1F78CA
	clr.w	$16(a4)
	bra.s	loc_1F78CA
loc_1F78A0:
	tst.w	$4(a3)
	ble.s	loc_1F78B0
	tst.w	$18(a4)
	bge.s	loc_1F78B0
	clr.w	$18(a4)
loc_1F78B0:
	tst.w	$4(a3)
	bge.s	loc_1F78C0
	tst.w	$18(a4)
	ble.s	loc_1F78C0
	clr.w	$18(a4)
loc_1F78C0:
	tst.w	$16(a4)
	ble.s	loc_1F78CA
	clr.w	$16(a4)
