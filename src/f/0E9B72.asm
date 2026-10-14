; ---------------------------------------------------------------------------
; sub_0E9B72	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9B72:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0E9BC2
	moveq	#$0,d3
	movea.l	$9E(a3),a0
	move.w	$4E(a4),d0
	cmp.w	$C(a0),d0
	ble.s	loc_0E9BBE
	move.w	$12(a3),d0
	ext.l	d0
	moveq	#$40,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bge.s	loc_0E9BBE
	moveq	#$1,d3
loc_0E9BBE:
	move.b	d3,d0
	bra.s	loc_0E9BC4
loc_0E9BC2:
	moveq	#$1,d0
loc_0E9BC4:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
