; ---------------------------------------------------------------------------
; BigBio_SpitUpdateAll - BIGBIO spit timer: move projectiles, bounce them off the top/bottom, hit players (1 damage), drop them off screen, draw them
; In:  none
; Out: none
; Evidence: TAS 33390-37014; g_SpriteTable
; ---------------------------------------------------------------------------
BigBio_SpitUpdateAll:
	link.w	a6,#$FFEC
	movem.l	d3-d7/a3-a4,-(a7)
	tst.w	g_BigBioSpitCount(a5)
	beq.w	loc_1218E6
	move.w	g_BigBioSprDef(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	adda.w	d0,a0
	move.l	a0,-$C(a6)
	movea.l	g_BigBioSpitPool(a5),a3
	clr.w	-$8(a6)
	bra.w	loc_1218DA
loc_121696:
	clr.w	-$E(a6)
	tst.w	$8(a3)
	beq.s	loc_1216A8
	move.l	#$120,d0
	bra.s	loc_1216AE
loc_1216A8:
	move.l	#$900,d0
loc_1216AE:
	ext.l	d0
	move.l	d0,-$4(a6)
	tst.w	$A(a3)
	bge.s	loc_1216C4
	move.l	-$4(a6),d0
	neg.l	d0
	move.l	d0,-$4(a6)
loc_1216C4:
	move.l	-$4(a6),d0
	add.l	d0,(a3)
	move.w	$C(a3),d0
	ext.l	d0
	add.l	d0,$4(a3)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_1216EA
	move.l	-$4(a6),d0
	add.l	d0,(a3)
	move.w	$C(a3),d0
	ext.l	d0
	add.l	d0,$4(a3)
loc_1216EA:
	move.l	$4(a3),d6
	asr.l	#$8,d6
	move.l	(a3),d5
	asr.l	#$8,d5
	tst.w	$A(a3)
	bge.s	loc_121712
	ext.l	d5
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$14,d1
	sub.l	d1,d0
	cmp.l	d5,d0
	ble.s	loc_12172A
	move.b	#$1,-$D(a6)
	bra.s	loc_12172A
loc_121712:
	ext.l	d5
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$154,d0
	cmp.l	d5,d0
	bge.s	loc_12172A
	move.b	#$1,-$D(a6)
loc_12172A:
	moveq	#$0,d7
loc_12172C:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_12173C
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_121742
loc_12173C:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_121742:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1217B6
	move.w	$56(a4),-$14(a6)
	move.w	$54(a4),-$12(a6)
	move.w	$5A(a4),-$10(a6)
	move.w	$58(a4),d4
	tst.w	$6A(a4)
	bne.s	loc_1217B6
	cmp.w	-$14(a6),d5
	blt.s	loc_1217B6
	cmp.w	-$10(a6),d5
	bgt.s	loc_1217B6
	cmp.w	-$12(a6),d6
	blt.s	loc_1217B6
	cmp.w	d6,d4
	blt.s	loc_1217B6
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.b	#$1,-$D(a6)
	lea.l	$18(a7),a7
loc_1217B6:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_12172C
	tst.b	-$D(a6)
	beq.s	loc_1217DE
	move.l	a3,-(a7)
	jsr	BigBio_SpitFree(pc)
	lea.l	-$10(a3),a3
	move.w	-$8(a6),d0
	subq.w	#$1,-$8(a6)
	addq.w	#$4,a7
	bra.w	loc_1218CE
loc_1217DE:
	tst.w	$C(a3)
	bge.s	loc_121802
	cmpi.w	#$FFFB,d6
	bge.s	loc_121820
	moveq	#-$A,d0
	sub.w	d6,d0
	move.w	d0,d6
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,$4(a3)
	move.b	#$1,-$E(a6)
	bra.s	loc_121820
loc_121802:
	cmpi.w	#$D9,d6
	ble.s	loc_121820
	move.w	#$1B2,d0
	sub.w	d6,d0
	move.w	d0,d6
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,$4(a3)
	move.b	#$1,-$E(a6)
loc_121820:
	tst.b	-$E(a6)
	beq.s	loc_121842
	move.w	$C(a3),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$C(a3)
	addq.w	#$1,$8(a3)
	moveq	#$2,d0
	cmp.b	$F(a3),d0
	beq.s	loc_121842
	addq.b	#$1,$F(a3)
loc_121842:
	movea.l	-$C(a6),a0
	move.w	$6(a0),d0
	ext.l	d0
	move.b	$F(a3),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#$2,d1
	add.l	d0,d1
	move.l	#$2000,d0
	or.l	d1,d0
	move.w	d0,-$6(a6)
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	ext.l	d6
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	add.w	#$80,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$5,$2(a0)
	move.w	-$6(a6),d0
	ext.l	d0
	move.l	#$8000,d1
	or.l	d0,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,$4(a0)
	ext.l	d5
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d5,d1
	sub.l	d0,d1
	add.w	#$80,d1
	movea.l	g_SprWritePtr(a5),a0
	move.w	d1,$6(a0)
loc_1218CE:
	move.w	-$8(a6),d0
	addq.w	#$1,-$8(a6)
	lea.l	$10(a3),a3
loc_1218DA:
	move.w	-$8(a6),d0
	cmp.w	g_BigBioSpitCount(a5),d0
	blt.w	loc_121696
loc_1218E6:
	movem.l	-$30(a6),d3-d7/a3-a4
	unlk	a6
	rts
