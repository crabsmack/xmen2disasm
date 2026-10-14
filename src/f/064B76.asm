; ---------------------------------------------------------------------------
; sub_064B76	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064B76:
	link.w	a6,#$0
	movem.l	d3/d6-d7,-(a7)
	move.w	$A(a6),d6
	cmpi.w	#$FFFF,d6
	beq.s	loc_064BE4
	move.w	d6,d7
	subq.w	#$1,d7
	moveq	#$0,d3
	bra.s	loc_064BB2
loc_064B90:
	movea.l	-$3B28(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064BB0
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064BB0
	move.w	d7,d0
	bra.s	loc_064BE6
loc_064BB0:
	subq.w	#$1,d7
loc_064BB2:
	cmp.w	d7,d3
	ble.s	loc_064B90
	move.w	-$3B0E(a5),d7
	subq.w	#$1,d7
	bra.s	loc_064BE0
loc_064BBE:
	movea.l	-$3B28(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064BDE
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),d0
	ext.w	d0
	cmp.w	d7,d0
	beq.s	loc_064BDE
	move.w	d7,d0
	bra.s	loc_064BE6
loc_064BDE:
	subq.w	#$1,d7
loc_064BE0:
	cmp.w	d7,d6
	blt.s	loc_064BBE
loc_064BE4:
	move.w	d6,d0
loc_064BE6:
	movem.l	-$C(a6),d3/d6-d7
	unlk	a6
	rts
