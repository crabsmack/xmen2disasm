; ---------------------------------------------------------------------------
; sub_0BD79A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BD79A:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$12(a6),d7
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BD7CC
	add.w	d7,$9E(a4)
	move.w	$9E(a4),d0
	cmp.w	$C(a3),d0
	ble.s	loc_0BD7E0
	move.w	$C(a3),$9E(a4)
	bra.s	loc_0BD7E0
loc_0BD7CC:
	sub.w	d7,$9E(a4)
	move.w	$9E(a4),d0
	cmp.w	$8(a3),d0
	bge.s	loc_0BD7E0
	move.w	$8(a3),$9E(a4)
loc_0BD7E0:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
