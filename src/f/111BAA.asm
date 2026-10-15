; ---------------------------------------------------------------------------
; Deathbird_UpdateBurst - Deathbird projectile timer: move the 8 burst projectiles, draw them with a direction frame, hit players they touch
; In:  8(a6) = deathbird
; Out: none
; Evidence: Timer_Create(.., this) in Deathbird_Init (+$9E); sprites into g_SpriteTable; vtable +$22 Attack on g_Player1/g_Player2; TAS 44632-44668
; ---------------------------------------------------------------------------
Deathbird_UpdateBurst:
	link.w	a6,#$FFEC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	-$3B04(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	move.w	$6(a0,d0.w),d0
	ext.l	d0
	move.l	#$A000,d1
	or.l	d0,d1
	move.w	d1,-$A(a6)
	move.l	$9A(a3),-$4(a6)
	beq.w	loc_111DE0
	clr.w	-$14(a6)
loc_111BE8:
	move.w	-$14(a6),d0
	ext.l	d0
	movea.l	-$4(a6),a0
	asl.l	#$4,d0
	lea.l	$28(a0,d0.l),a0
	move.l	a0,-$8(a6)
	movea.l	a0,a1
	move.w	$C(a1),d0
	add.w	d0,$8(a0)
	move.w	$8(a0),-$E(a6)
	movea.l	-$8(a6),a0
	movea.l	a0,a1
	move.w	$E(a1),d0
	add.w	d0,$A(a0)
	move.w	$A(a0),d4
	movea.l	-$8(a6),a0
	move.w	-$E(a6),d0
	ext.l	d0
	add.l	d0,(a0)
	movea.l	-$8(a6),a0
	ext.l	d4
	add.l	d4,$4(a0)
	tst.w	-$E(a6)
	ble.s	loc_111C78
	tst.w	d4
	bge.s	loc_111C60
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
	move.w	-$E(a6),d1
	ext.l	d1
	cmp.l	d1,d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_111C56
	moveq	#$0,d0
	bra.s	loc_111C58
loc_111C56:
	moveq	#$1,d0
loc_111C58:
	ext.w	d0
	move.w	d0,-$C(a6)
	bra.s	loc_111CB4
loc_111C60:
	cmp.w	-$E(a6),d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_111C6E
	moveq	#$7,d0
	bra.s	loc_111C70
loc_111C6E:
	moveq	#$6,d0
loc_111C70:
	ext.w	d0
	move.w	d0,-$C(a6)
	bra.s	loc_111CB4
loc_111C78:
	tst.w	d4
	bge.s	loc_111C94
	cmp.w	-$E(a6),d4
	sgt.b	d3
	neg.b	d3
	beq.s	loc_111C8A
	moveq	#$3,d0
	bra.s	loc_111C8C
loc_111C8A:
	moveq	#$2,d0
loc_111C8C:
	ext.w	d0
	move.w	d0,-$C(a6)
	bra.s	loc_111CB4
loc_111C94:
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
	move.w	-$E(a6),d1
	ext.l	d1
	cmp.l	d1,d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_111CAC
	moveq	#$4,d0
	bra.s	loc_111CAE
loc_111CAC:
	moveq	#$5,d0
loc_111CAE:
	ext.w	d0
	move.w	d0,-$C(a6)
loc_111CB4:
	movea.l	-$8(a6),a0
	move.l	(a0),d5
	asr.l	#$8,d5
	move.l	$4(a0),d6
	asr.l	#$8,d6
	move.w	d5,d0
	sub.w	g_CameraX(a5),d0
	move.w	d0,-$12(a6)
	move.w	d6,d0
	sub.w	g_CameraY(a5),d0
	move.w	d0,-$10(a6)
	moveq	#-$20,d0
	cmp.w	-$12(a6),d0
	bge.s	loc_111D48
	cmpi.w	#$140,-$12(a6)
	bge.s	loc_111D48
	moveq	#-$20,d0
	cmp.w	-$10(a6),d0
	bge.s	loc_111D48
	cmpi.w	#$E0,-$10(a6)
	bge.s	loc_111D48
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	-$10(a6),d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	move.w	-$C(a6),d0
	add.w	-$A(a6),d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	move.w	-$12(a6),d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
loc_111D48:
	clr.w	d7
loc_111D4A:
	tst.w	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_111D5A
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_111D60
loc_111D5A:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_111D60:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_111DC4
	tst.w	$6A(a4)
	bne.s	loc_111DC4
	cmp.w	$56(a4),d5
	blt.s	loc_111DC4
	cmp.w	$5A(a4),d5
	bgt.s	loc_111DC4
	cmp.w	$54(a4),d6
	blt.s	loc_111DC4
	cmp.w	$58(a4),d6
	bgt.s	loc_111DC4
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.b	$70(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$71(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_111DC4:
	addq.w	#$1,d7
	cmpi.w	#$2,d7
	blt.w	loc_111D4A
	move.w	-$14(a6),d0
	addq.w	#$1,-$14(a6)
	moveq	#$8,d0
	cmp.w	-$14(a6),d0
	bgt.w	loc_111BE8
loc_111DE0:
	movem.l	-$30(a6),d3-d7/a3-a4
	unlk	a6
	rts
