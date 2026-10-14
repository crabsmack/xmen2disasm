; ---------------------------------------------------------------------------
; sub_160B0E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_160B0E:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$46(a4),d6
	move.w	$2C(a4),d5
	move.w	$2E(a4),d7
	tst.b	-$3892(a5)
	beq.s	loc_160B44
	clr.b	-$3892(a5)
	move.w	$36(a4),d0
	sub.w	$30(a4),d0
	add.w	d0,d5
	move.w	$34(a4),d0
	sub.w	$32(a4),d0
	add.w	d0,d7
loc_160B44:
	cmp.w	d5,d6
	bge.s	loc_160B4C
	sub.w	d6,d5
	bra.s	loc_160B5E
loc_160B4C:
	ext.l	d5
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	cmp.l	d5,d0
	ble.s	loc_160B5C
	add.w	d6,d5
	bra.s	loc_160B5E
loc_160B5C:
	clr.w	d5
loc_160B5E:
	move.w	d5,$2C(a4)
	cmp.w	d7,d6
	bge.s	loc_160B6A
	sub.w	d6,d7
	bra.s	loc_160B7C
loc_160B6A:
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	cmp.l	d7,d0
	ble.s	loc_160B7A
	add.w	d6,d7
	bra.s	loc_160B7C
loc_160B7A:
	clr.w	d7
loc_160B7C:
	moveq	#$0,d0
	move.b	-$38E0(a5),d0
	cmpi.w	#$2,d0
	bne.s	loc_160BA2
	cmp.w	d7,d6
	bge.s	loc_160B90
	sub.w	d6,d7
	bra.s	loc_160BA2
loc_160B90:
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	cmp.l	d7,d0
	ble.s	loc_160BA0
	add.w	d6,d7
	bra.s	loc_160BA2
loc_160BA0:
	clr.w	d7
loc_160BA2:
	move.w	d7,$2E(a4)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
