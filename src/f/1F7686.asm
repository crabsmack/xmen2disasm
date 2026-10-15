; ---------------------------------------------------------------------------
; Seg_ApplyPushOut_Block - Seg_ApplyPushOut case for solid blocks (types $13-$1C): cancel velocity toward the push direction on each axis
; In:  a3 = contact, a4 = object
; Out: none
; Evidence: target of Sw_1F7628 entries 5-14
; ---------------------------------------------------------------------------
Seg_ApplyPushOut_Block:
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
	bge.w	Seg_ApplyPushOut_Move
	movea.l	$10(a6),a0
	tst.b	$4(a0)
	ble.w	Seg_ApplyPushOut_Move
loc_1F76CE:
	clr.w	$18(a4)
	bra.w	Seg_ApplyPushOut_Move
