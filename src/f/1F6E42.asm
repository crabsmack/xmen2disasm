; ---------------------------------------------------------------------------
; Seg_ApplyObjPos_Cases - Seg_ApplyObjPos switch cases (vertical, sloped, reversed and flat segment types)
; In:  a3 = object, a4 = segment, d5/d6 = x1/y1, d7 = position, d0 = slope * position
; Out: d5/d6 = new x/y
; Evidence: targets of Sw_1F6D76 entries 0-3, 13, 14, 18-27, 32-35
; ---------------------------------------------------------------------------
Seg_ApplyObjPos_Cases:
	add.w	d4,d6
	add.w	d7,d5
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E48:
	add.w	d7,d5
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E4C:
	move.w	$C(a4),d5
	sub.w	d7,d5
	move.w	$E(a4),d6
	sub.w	d4,d6
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E5A:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	ble.s	loc_1F6E72
	move.w	d7,d6
	add.w	$E(a4),d6
	move.w	d4,d5
	add.w	$C(a4),d5
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E72:
	add.w	d7,d6
	add.w	d4,d5
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E78:
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	bne.s	loc_1F6E8A
	move.w	$E(a4),d6
	sub.w	d7,d6
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E8A:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	ble.s	loc_1F6E9A
	sub.w	d7,d6
	sub.w	d4,d5
	bra.s	Seg_ApplyObjPos_Store
loc_1F6E9A:
	move.w	$E(a4),d6
	sub.w	d7,d6
	move.w	$C(a4),d5
	sub.w	d4,d5
