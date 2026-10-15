; ---------------------------------------------------------------------------
; ExplodeFx_BurstDraw - draw-list hook of a burst: one 32x32 hardware sprite per live puff from the shared effect tiles
; In:  8(a6) = effect
; Out: none
; Evidence: tile = g_FxTileBase + frame*16 | $2000 (| $8000 priority when +4 bit 0), size $F; skipped outside -32..$13F x, -32..$DF y
; ---------------------------------------------------------------------------
ExplodeFx_BurstDraw:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d4
	movea.l	a3,a4
	lea.l	$E(a4),a4
loc_13DBEC:
	cmpi.w	#$A,d4
	bge.w	loc_13DCAE
	tst.b	$11(a4)
	beq.w	loc_13DCA2
	move.l	(a4),d6
	asr.l	#$8,d6
	move.l	$4(a4),d7
	asr.l	#$8,d7
	move.b	$10(a4),d0
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
	beq.s	loc_13DC3E
	move.l	#$8000,d0
	bra.s	loc_13DC40
loc_13DC3E:
	moveq	#$0,d0
loc_13DC40:
	or.w	d0,d5
	cmpi.w	#$FFE0,d6
	ble.s	loc_13DCA2
	cmpi.w	#$140,d6
	bge.s	loc_13DCA2
	cmpi.w	#$FFE0,d7
	ble.s	loc_13DCA2
	cmpi.w	#$E0,d7
	bge.s	loc_13DCA2
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
loc_13DCA2:
	move.w	d4,d0
	addq.w	#$1,d4
	lea.l	$12(a4),a4
	bra.w	loc_13DBEC
loc_13DCAE:
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
