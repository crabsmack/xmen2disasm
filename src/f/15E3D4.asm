; ---------------------------------------------------------------------------
; sub_15E3D4	[jt 2061]
; ---------------------------------------------------------------------------
sub_15E3D4:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	cmp.w	$4E(a4),d7
	ble.s	loc_15E404
	cmp.w	$52(a4),d7
	bge.s	loc_15E404
	cmp.w	$4C(a4),d6
	ble.s	loc_15E404
	cmp.w	$50(a4),d6
	bge.s	loc_15E404
	moveq	#$1,d0
	bra.s	loc_15E406
loc_15E404:
	moveq	#$0,d0
loc_15E406:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
