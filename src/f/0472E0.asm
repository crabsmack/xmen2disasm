; ---------------------------------------------------------------------------
; sub_0472E0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0472E0:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	tst.w	$84(a3)
	ble.w	loc_0473CA
	tst.b	-$38DE(a5)
	beq.s	loc_0472FE
	moveq	#$2,d0
	bra.s	loc_047300
loc_0472FE:
	moveq	#$1,d0
loc_047300:
	ext.w	d0
	sub.w	d0,$84(a3)
	lea.l	(a3),a4
	moveq	#$4,d7
	moveq	#$10,d3
loc_04730C:
	move.l	-$3B18(a5),d0
	btst	#$0,d0
	beq.s	loc_047374
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	$2(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	$4(a4),$4(a0)
	move.w	(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
loc_047374:
	move.l	-$3B18(a5),d0
	addq.l	#$1,-$3B18(a5)
	move.b	$6(a4),d0
	ext.w	d0
	add.w	d0,(a4)
	move.b	$7(a4),d0
	ext.w	d0
	add.w	d0,$2(a4)
	addq.b	#$1,$7(a4)
	addq.w	#$8,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.w	loc_04730C
	tst.b	-$38DE(a5)
	beq.s	loc_0473CA
	lea.l	(a3),a4
	clr.w	d7
	moveq	#$10,d3
loc_0473AA:
	move.b	$6(a4),d0
	ext.w	d0
	add.w	d0,(a4)
	move.b	$7(a4),d0
	ext.w	d0
	add.w	d0,$2(a4)
	addq.b	#$1,$7(a4)
	addq.w	#$8,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_0473AA
loc_0473CA:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
