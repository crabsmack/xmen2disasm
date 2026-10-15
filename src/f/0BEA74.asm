; ---------------------------------------------------------------------------
; Launcher_Draw - vtable +$1A: draw a LAUNCHER
; In:  8(a6) = this
; Evidence: slot +$1A of the LAUNCHER descriptor $0BED0C; TAS frames 27947-30595 (708 frames active); calls parent ACTOR slot +$1A
; ---------------------------------------------------------------------------
Launcher_Draw:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	lea.l	$2152(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	move.w	-$3C2C(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	move.w	#$2000,d1
	or.w	$6(a0,d0.w),d1
	ext.l	d1
	move.l	#$8000,d0
	or.l	d1,d0
	move.w	d0,-$2(a6)
	lea.l	$90(a3),a4
	addq.w	#$4,a7
	bra.w	loc_0BEC56
loc_0BEAC6:
	tst.l	(a4)
	beq.w	loc_0BEC52
	moveq	#$1,d3
	tst.b	-$38DE(a5)
	bne.s	loc_0BEADC
	tst.b	-$3A08(a5)
	bne.s	loc_0BEADC
	moveq	#$0,d3
loc_0BEADC:
	tst.b	d3
	beq.s	loc_0BEAE4
	moveq	#$2,d0
	bra.s	loc_0BEAE6
loc_0BEAE4:
	moveq	#$1,d0
loc_0BEAE6:
	move.w	d0,d5
	tst.w	$8(a4)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0BEAF6
	moveq	#$9,d0
	bra.s	loc_0BEAF8
loc_0BEAF6:
	moveq	#$A,d0
loc_0BEAF8:
	move.w	d0,d4
loc_0BEAFA:
	move.w	$8(a4),d0
	ext.l	d0
	add.l	d0,(a4)
	subq.w	#$1,d5
	bne.s	loc_0BEAFA
	move.l	(a4),d7
	asr.l	#$8,d7
	move.l	$4(a4),d6
	asr.l	#$8,d6
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	pea.l	g_Player1(a5)
	jsr	sub_0BE9F8(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	bne.s	loc_0BEB48
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	pea.l	g_Player2(a5)
	jsr	sub_0BE9F8(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_0BEB62
loc_0BEB48:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$4(a4),-(a7)
	move.l	(a4),-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	moveq	#$0,d0
	move.l	d0,(a4)
	lea.l	$C(a7),a7
	bra.w	loc_0BEC52
loc_0BEB62:
	moveq	#$0,d3
	move.w	d7,d0
	asr.w	#$5,d0
	blt.s	loc_0BEB86
	move.w	d7,d0
	asr.w	#$5,d0
	cmp.w	-$3A6E(a5),d0
	bge.s	loc_0BEB86
	move.w	d6,d0
	asr.w	#$5,d0
	blt.s	loc_0BEB86
	move.w	d6,d0
	asr.w	#$5,d0
	cmp.w	-$3A78(a5),d0
	bge.s	loc_0BEB86
	moveq	#$1,d3
loc_0BEB86:
	tst.b	d3
	beq.s	loc_0BEBBC
	move.w	d6,d0
	asr.w	#$5,d0
	ext.l	d0
	movea.l	-$3A72(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	move.w	d7,d1
	asr.w	#$5,d1
	ext.l	d1
	add.l	d0,d1
	movea.l	-$3A84(a5),a0
	add.l	d1,d1
	move.w	#$4000,d0
	and.w	(a0,d1.l),d0
	beq.s	loc_0BEBB8
	moveq	#$1,d0
	bra.s	loc_0BEBBE
loc_0BEBB8:
	moveq	#$0,d0
	bra.s	loc_0BEBBE
loc_0BEBBC:
	moveq	#$1,d0
loc_0BEBBE:
	beq.s	loc_0BEBD8
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$4(a4),-(a7)
	move.l	(a4),-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	moveq	#$0,d0
	move.l	d0,(a4)
	lea.l	$C(a7),a7
	bra.s	loc_0BEC52
loc_0BEBD8:
	sub.w	-$348E(a5),d7
	sub.w	-$3490(a5),d6
	cmpi.w	#$FF80,d7
	blt.s	loc_0BEBEC
	cmpi.w	#$1C0,d7
	ble.s	loc_0BEBF2
loc_0BEBEC:
	moveq	#$0,d0
	move.l	d0,(a4)
	bra.s	loc_0BEC52
loc_0BEBF2:
	cmpi.w	#$FFE0,d7
	ble.s	loc_0BEC52
	cmpi.w	#$140,d7
	bge.s	loc_0BEC52
	cmpi.w	#$FFE0,d6
	ble.s	loc_0BEC52
	cmpi.w	#$E0,d6
	bge.s	loc_0BEC52
	lea.l	g_SpriteTable(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	-$2(a6),$4(a0)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
loc_0BEC52:
	lea.l	$A(a4),a4
loc_0BEC56:
	lea.l	$B8(a3),a0
	cmpa.l	a4,a0
	bhi.w	loc_0BEAC6
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
