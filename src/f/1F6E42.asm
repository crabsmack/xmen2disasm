; ---------------------------------------------------------------------------
; loc_1F6E42	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1F6E42:
	add.w	d4,d6
	add.w	d7,d5
	bra.s	loc_1F6EA6
loc_1F6E48:
	add.w	d7,d5
	bra.s	loc_1F6EA6
loc_1F6E4C:
	move.w	$C(a4),d5
	sub.w	d7,d5
	move.w	$E(a4),d6
	sub.w	d4,d6
	bra.s	loc_1F6EA6
loc_1F6E5A:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	ble.s	loc_1F6E72
	move.w	d7,d6
	add.w	$E(a4),d6
	move.w	d4,d5
	add.w	$C(a4),d5
	bra.s	loc_1F6EA6
loc_1F6E72:
	add.w	d7,d6
	add.w	d4,d5
	bra.s	loc_1F6EA6
loc_1F6E78:
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	bne.s	loc_1F6E8A
	move.w	$E(a4),d6
	sub.w	d7,d6
	bra.s	loc_1F6EA6
loc_1F6E8A:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	ble.s	loc_1F6E9A
	sub.w	d7,d6
	sub.w	d4,d5
	bra.s	loc_1F6EA6
loc_1F6E9A:
	move.w	$E(a4),d6
	sub.w	d7,d6
	move.w	$C(a4),d5
	sub.w	d4,d5
