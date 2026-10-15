; ---------------------------------------------------------------------------
; Seg_ApplyPushOut_Walls - Seg_ApplyPushOut wall cases: ceiling (type 4), left walls (1/$20) and right walls (2/$1F)
; In:  a3 = contact, a4 = object
; Out: none
; Evidence: targets of Sw_1F76D6 entries 0, 1, 3, 30, 31
; ---------------------------------------------------------------------------
Seg_ApplyPushOut_Walls:
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
	bge.s	Seg_ApplyPushOut_Move
	clr.w	$18(a4)
	bra.s	Seg_ApplyPushOut_Move
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
	bge.s	Seg_ApplyPushOut_Move
	clr.w	$16(a4)
	bra.s	Seg_ApplyPushOut_Move
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
	ble.s	Seg_ApplyPushOut_Move
	clr.w	$16(a4)
