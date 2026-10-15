; ---------------------------------------------------------------------------
; CoreShields_Draw - draw the rotating ring of 8 shield panels: the 5 (or 4) panels of the current rotation step (+$90 index, +$91 phase picks one of three layout tables), front panels then the back ones (tile +$38, low priority), skipping broken panels (+$92+i set); blinks while the hit cooldown +$6A runs (class slot 5, +$1A; does not call the parent)
; In:  8(a6) = this
; Out: d0 = garbage
; Evidence: layout tables jt $2A92/$2A9A/$2AA2 of {dx, dy, size, tile} records; palette bits $6000 on g_FrameCounter bit 2 while +$6A > 0; writes g_SpriteTable directly; method 5 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_Draw:
	link.w	a6,#$FFF2
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.b	$90(a3),d5
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	d0,-$E(a6)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	d0,-$C(a6)
	clr.w	-$A(a6)
	tst.b	$91(a3)
	bne.s	loc_0EB86A
	lea.l	$2892(a5),a0
	movea.l	$2(a0),a4
	move.w	#$5,-$A(a6)
	move.b	$90(a3),d4
	bra.s	loc_0EB89C
loc_0EB86A:
	moveq	#$1,d0
	cmp.b	$91(a3),d0
	bne.s	loc_0EB886
	lea.l	$289A(a5),a0
	movea.l	$2(a0),a4
	move.w	#$5,-$A(a6)
	move.b	$90(a3),d4
	bra.s	loc_0EB89C
loc_0EB886:
	lea.l	$28A2(a5),a0
	movea.l	$2(a0),a4
	move.w	#$4,-$A(a6)
	move.b	$90(a3),d0
	addq.b	#$1,d0
	move.b	d0,d4
loc_0EB89C:
	move.w	$34(a3),d6
	tst.w	$6A(a3)
	ble.s	loc_0EB8B2
	moveq	#$4,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_0EB8B2
	ori.w	#$6000,d6
loc_0EB8B2:
	ori.w	#$8000,d6
	clr.w	d7
	bra.w	loc_0EB94E
loc_0EB8BC:
	tst.b	d5
	bge.s	loc_0EB8C2
	moveq	#$7,d5
loc_0EB8C2:
	ext.w	d5
	lea.l	$92(a3),a0
	tst.b	(a0,d5.w)
	bne.s	loc_0EB944
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	-$C(a6),d0
	ext.l	d0
	move.w	$2(a4),d1
	ext.l	d1
	add.l	d0,d1
	add.w	#$80,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,(a0)
	moveq	#$F,d0
	and.b	$5(a4),d0
	movea.l	g_SprWritePtr(a5),a0
	move.b	d0,$2(a0)
	move.w	$6(a4),d0
	add.w	d6,d0
	ext.l	d0
	move.b	$4(a4),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#$8,d1
	or.l	d0,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,$4(a0)
	move.w	-$E(a6),d0
	ext.l	d0
	move.w	(a4),d1
	ext.l	d1
	add.l	d0,d1
	add.w	#$80,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,$6(a0)
loc_0EB944:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	move.b	d5,d0
	subq.b	#$1,d5
loc_0EB94E:
	cmp.w	-$A(a6),d7
	blt.w	loc_0EB8BC
	andi.w	#$7FFF,d6
	addi.w	#$38,d6
	move.b	$90(a3),d5
	clr.w	d7
	bra.w	loc_0EBA44
loc_0EB968:
	cmpi.b	#$8,d4
	blt.s	loc_0EB970
	clr.b	d4
loc_0EB970:
	ext.w	d4
	lea.l	$92(a3),a0
	tst.b	(a0,d4.w)
	bne.w	loc_0EBA36
	tst.b	d5
	bge.s	loc_0EB984
	moveq	#$7,d5
loc_0EB984:
	moveq	#$5,d0
	cmp.w	-$A(a6),d0
	bne.s	loc_0EB9B4
	cmpi.w	#$2,d7
	beq.w	loc_0EBA36
	cmpi.w	#$4,d7
	bne.s	loc_0EB9A4
	tst.b	$91(a3)
	beq.w	loc_0EBA36
	bra.s	loc_0EB9C0
loc_0EB9A4:
	tst.w	d7
	bne.s	loc_0EB9C0
	moveq	#$1,d0
	cmp.b	$91(a3),d0
	beq.w	loc_0EBA36
	bra.s	loc_0EB9C0
loc_0EB9B4:
	ext.w	d5
	lea.l	$92(a3),a0
	tst.b	(a0,d5.w)
	beq.s	loc_0EBA36
loc_0EB9C0:
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	-$C(a6),d0
	ext.l	d0
	move.w	$2(a4),d1
	ext.l	d1
	add.l	d0,d1
	add.w	#$80,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,(a0)
	moveq	#$F,d0
	and.b	$5(a4),d0
	movea.l	g_SprWritePtr(a5),a0
	move.b	d0,$2(a0)
	move.w	$6(a4),d0
	add.w	d6,d0
	ext.l	d0
	move.b	$4(a4),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#$8,d1
	or.l	d0,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,$4(a0)
	move.w	-$E(a6),d0
	ext.l	d0
	move.w	(a4),d1
	ext.l	d1
	add.l	d0,d1
	add.w	#$80,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,$6(a0)
loc_0EBA36:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	move.b	d4,d0
	addq.b	#$1,d4
	move.b	d5,d0
	subq.b	#$1,d5
loc_0EBA44:
	cmp.w	-$A(a6),d7
	blt.w	loc_0EB968
	movem.l	-$26(a6),d4-d7/a3-a4
	unlk	a6
	rts
