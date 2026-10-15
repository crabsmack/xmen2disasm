; ---------------------------------------------------------------------------
; sub_13EE20	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13EE20:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d4
	movea.l	a3,a4
	lea.l	$20(a4),a4
loc_13EE34:
	cmpi.w	#$1B,d4
	bge.w	loc_13EEF0
	tst.b	$5(a4)
	beq.w	loc_13EEE6
	move.w	(a4),d6
	move.w	$2(a4),d7
	move.b	$4(a4),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,-$2(a6)
	sub.w	g_CameraX(a5),d6
	sub.w	g_CameraY(a5),d7
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$4,d0
	move.w	d0,d5
	add.w	g_FxTileBase(a5),d5
	ori.w	#$2000,d5
	moveq	#$1,d0
	and.w	$4(a3),d0
	beq.s	loc_13EE82
	move.l	#$8000,d0
	bra.s	loc_13EE84
loc_13EE82:
	moveq	#$0,d0
loc_13EE84:
	or.w	d0,d5
	cmpi.w	#$FFE0,d6
	ble.s	loc_13EEE6
	cmpi.w	#$140,d6
	bge.s	loc_13EEE6
	cmpi.w	#$FFE0,d7
	ble.s	loc_13EEE6
	cmpi.w	#$E0,d7
	bge.s	loc_13EEE6
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$F,$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	d5,$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
loc_13EEE6:
	move.w	d4,d0
	addq.w	#$1,d4
	addq.w	#$6,a4
	bra.w	loc_13EE34
loc_13EEF0:
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
