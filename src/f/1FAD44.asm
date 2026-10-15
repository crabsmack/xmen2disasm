; ---------------------------------------------------------------------------
; sub_1FAD44	[jt 2568]
; ---------------------------------------------------------------------------
sub_1FAD44:
	link.w	a6,#$FDF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$2(a3),-$208(a6)
	move.b	$1(a3),$A(a3)
	moveq	#$20,d0
	and.b	(a3),d0
	bne.w	loc_1FB01C
	moveq	#$0,d0
	move.b	$1(a3),d0
	cmpi.w	#$FF,d0
	beq.w	loc_1FB01C
	movea.l	-$208(a6),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$20,d0
	beq.w	loc_1FB01C
	ori.b	#$20,(a3)
	moveq	#$0,d4
	move.b	$1(a3),d4
	move.l	-$208(a6),d0
	moveq	#$24,d1
	add.l	d1,d0
	ext.l	d4
	move.l	d4,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$2,d0
	add.l	d2,d0
	move.l	d0,-$204(a6)
	move.w	$6(a3),d4
	movea.l	-$204(a6),a0
	moveq	#$0,d5
	move.b	$11(a0),d5
	moveq	#$0,d0
	move.w	$12(a0),d0
	tst.l	d0
	movea.l	d0,a3
	adda.l	-$208(a6),a3
	tst.b	$F(a6)
	beq.w	loc_1FAF44
	movea.l	-$208(a6),a0
	moveq	#$18,d0
	cmp.b	(a0),d0
	bne.w	loc_1FAE5E
	clr.w	d5
	bra.s	loc_1FAE4C
loc_1FADDC:
	moveq	#$0,d6
	move.w	$6(a3),d6
	tst.l	d6
	ble.s	loc_1FAE46
	movea.l	d6,a4
	adda.l	-$208(a6),a4
	move.b	$5(a3),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,d7
	addq.w	#$1,d7
	jsr	$4D9A(a5)	; -> Irq_Disable
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	#$3FFF,d1
	and.l	d0,d1
	swap	d1
	clr.w	d1
	add.l	#$40000000,d1
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	#$C000,d2
	and.l	d0,d2
	moveq	#$E,d0
	lsr.l	d0,d2
	add.l	d1,d2
	move.l	d2,($C00004).l
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$519A(a5)	; -> VDP_WriteWords
	jsr	$4DA2(a5)	; -> Irq_Enable
	add.w	d7,d4
	addq.w	#$8,a7
loc_1FAE46:
	addq.l	#$8,a3
	move.w	d5,d0
	addq.w	#$1,d5
loc_1FAE4C:
	movea.l	-$204(a6),a0
	move.b	$10(a0),d0
	ext.w	d0
	cmp.w	d5,d0
	bgt.s	loc_1FADDC
	bra.w	loc_1FB01C
loc_1FAE5E:
	clr.w	d5
	bra.w	loc_1FAF30
loc_1FAE64:
	moveq	#$0,d6
	move.w	$2(a3),d6
	tst.l	d6
	ble.w	loc_1FAF2A
	movea.l	d6,a4
	adda.l	-$208(a6),a4
	move.w	(a4),d0
	ext.l	d0
	move.w	#$9CC0,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	beq.s	loc_1FAE94
	moveq	#$0,d0
	move.w	$2(a4),d0
	add.l	-$208(a6),d0
	movea.l	d0,a4
loc_1FAE94:
	lea.l	$515A(a5),a0
	move.w	(a4),d0
	ext.l	d0
	add.l	$2(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d7
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$208(a6),a0
	moveq	#$14,d0
	cmp.b	(a0),d0
	bne.s	loc_1FAEFE
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	#$3FFF,d1
	and.l	d0,d1
	swap	d1
	clr.w	d1
	add.l	#$40000000,d1
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	#$C000,d2
	and.l	d0,d2
	moveq	#$E,d0
	lsr.l	d0,d2
	add.l	d1,d2
	move.l	d2,($C00004).l
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,d0
	addq.l	#$2,d0
	move.l	d0,-(a7)
	jsr	$519A(a5)	; -> VDP_WriteWords
	addq.w	#$8,a7
	bra.s	loc_1FAF24
loc_1FAEFE:
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$3,d1
	move.l	d1,-(a7)
	pea.l	-$200(a6)
	move.l	a4,d1
	addq.l	#$2,d1
	move.l	d1,-(a7)
	jsr	$4102(a5)	; -> sub_15F37C
	lea.l	$14(a7),a7
loc_1FAF24:
	jsr	$4DA2(a5)	; -> Irq_Enable
	add.w	d7,d4
loc_1FAF2A:
	addq.l	#$4,a3
	move.w	d5,d0
	addq.w	#$1,d5
loc_1FAF30:
	movea.l	-$204(a6),a0
	move.b	$10(a0),d0
	ext.w	d0
	cmp.w	d5,d0
	bgt.w	loc_1FAE64
	bra.w	loc_1FB01C
loc_1FAF44:
	movea.l	-$208(a6),a0
	moveq	#$18,d0
	cmp.b	(a0),d0
	bne.s	loc_1FAFA2
	clr.w	d5
	bra.s	loc_1FAF92
loc_1FAF52:
	moveq	#$0,d6
	move.w	$6(a3),d6
	tst.l	d6
	ble.s	loc_1FAF8C
	movea.l	d6,a4
	adda.l	-$208(a6),a4
	move.b	$5(a3),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,d7
	addq.w	#$1,d7
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	add.w	d7,d4
	lea.l	$C(a7),a7
loc_1FAF8C:
	addq.l	#$8,a3
	move.w	d5,d0
	addq.w	#$1,d5
loc_1FAF92:
	movea.l	-$204(a6),a0
	move.b	$10(a0),d0
	ext.w	d0
	cmp.w	d5,d0
	bgt.s	loc_1FAF52
	bra.s	loc_1FB01C
loc_1FAFA2:
	clr.w	d5
	bra.s	loc_1FB00E
loc_1FAFA6:
	moveq	#$0,d6
	move.w	$2(a3),d6
	tst.l	d6
	ble.s	loc_1FB008
	movea.l	d6,a4
	adda.l	-$208(a6),a4
	move.w	(a4),d0
	ext.l	d0
	move.w	#$9CC0,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	beq.s	loc_1FAFD4
	moveq	#$0,d0
	move.w	$2(a4),d0
	add.l	-$208(a6),d0
	movea.l	d0,a4
loc_1FAFD4:
	lea.l	$515A(a5),a0
	move.w	(a4),d0
	ext.l	d0
	add.l	$2(a0),d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d7
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,d0
	addq.l	#$2,d0
	move.l	d0,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	add.w	d7,d4
	lea.l	$C(a7),a7
loc_1FB008:
	addq.l	#$4,a3
	move.w	d5,d0
	addq.w	#$1,d5
loc_1FB00E:
	movea.l	-$204(a6),a0
	move.b	$10(a0),d0
	ext.w	d0
	cmp.w	d5,d0
	bgt.s	loc_1FAFA6
loc_1FB01C:
	movem.l	-$220(a6),d4-d7/a3-a4
	unlk	a6
	rts
