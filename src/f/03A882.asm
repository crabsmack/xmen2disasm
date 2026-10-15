; ---------------------------------------------------------------------------
; sub_03A882	[jt 275]
; ---------------------------------------------------------------------------
sub_03A882:
	link.w	a6,#$FFE0
	movem.l	d3-d7/a3-a4,-(a7)
	moveq	#$0,d3
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_03A8AC
	tst.w	-$16EE(a5)
	bne.s	loc_03A8AC
	moveq	#$1,d3
loc_03A8AC:
	ext.w	d3
	ext.l	d3
	beq.s	loc_03A8BA
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
	bra.s	loc_03A8BC
loc_03A8BA:
	moveq	#$0,d0
loc_03A8BC:
	move.l	d0,-$8(a6)
	moveq	#$0,d3
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_03A8E2
	tst.w	-$17DE(a5)
	bne.s	loc_03A8E2
	moveq	#$1,d3
loc_03A8E2:
	ext.w	d3
	ext.l	d3
	beq.s	loc_03A8F0
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_03A8F2
loc_03A8F0:
	moveq	#$0,d0
loc_03A8F2:
	move.l	d0,-$4(a6)
	lea.l	g_HScrollBuf(a5),a3
	move.w	-$3AC2(a5),d0
	ext.l	d0
	neg.l	d0
	move.l	d0,d4
	move.l	#$E0,-$C(a6)
	move.l	#$1FF,d0
	and.l	d4,d0
	swap	d0
	clr.w	d0
	move.l	#$1FF,d1
	and.l	d4,d1
	or.l	d0,d1
	move.l	d1,d4
loc_03A924:
	move.l	d4,(a3)+
	subq.l	#$1,-$C(a6)
	bne.s	loc_03A924
	move.w	-$3C7A(a5),d0
	ext.l	d0
	move.l	d0,-$C(a6)
	movea.l	-$3C7E(a5),a3
	bra.w	loc_03ABA2
loc_03A93E:
	move.w	$2(a3),d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.w	$C(a3),d0
	ext.l	d0
	move.l	d0,d6
	move.w	d6,-$E(a6)
	add.l	d6,$4(a3)
	move.w	$10(a3),d0
	ext.l	d0
	add.l	d0,d6
	tst.l	d6
	blt.s	loc_03A970
	tst.w	-$E(a6)
	blt.s	loc_03A97A
loc_03A970:
	tst.l	d6
	bge.s	loc_03A98C
	tst.w	-$E(a6)
	blt.s	loc_03A98C
loc_03A97A:
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_03A98C:
	move.w	$E(a3),d0
	ext.l	d0
	cmp.l	d6,d0
	bge.s	loc_03A9A0
	move.w	$E(a3),d0
	ext.l	d0
	move.l	d0,d6
	bra.s	loc_03A9B6
loc_03A9A0:
	move.w	$E(a3),d0
	ext.l	d0
	neg.l	d0
	cmp.l	d6,d0
	ble.s	loc_03A9B6
	move.w	$E(a3),d0
	ext.l	d0
	neg.l	d0
	move.l	d0,d6
loc_03A9B6:
	move.w	d6,$C(a3)
	moveq	#-$80,d0
	cmp.l	d5,d0
	bge.w	loc_03AB96
	cmpi.l	#$E0,d5
	bge.w	loc_03AB96
	lea.l	g_HScrollBuf(a5),a0
	movea.l	a0,a4
	addq.w	#$2,a4
	move.l	#$80,d7
	move.l	$4(a3),d0
	asr.l	#$8,d0
	move.l	#$1FF,d4
	and.l	d0,d4
	tst.l	d5
	bge.s	loc_03A9F0
	add.l	d5,d7
	bra.s	loc_03AA16
loc_03A9F0:
	moveq	#$60,d0
	cmp.l	d5,d0
	bge.s	loc_03AA0E
	move.l	d5,-$12(a6)
	move.l	d5,d0
	moveq	#$60,d1
	sub.l	d1,d0
	sub.l	d0,d7
	move.l	-$12(a6),d0
	lsl.l	#$1,d0
	add.l	d0,d0
	adda.l	d0,a4
	bra.s	loc_03AA16
loc_03AA0E:
	move.l	d5,d0
	lsl.l	#$1,d0
	add.l	d0,d0
	adda.l	d0,a4
loc_03AA16:
	tst.b	$13(a3)
	beq.s	loc_03AA48
loc_03AA1C:
	add.w	d4,(a4)
	andi.w	#$1FF,(a4)
	addq.l	#$4,a4
	subq.l	#$1,d7
	bne.s	loc_03AA1C
	tst.w	$C(a3)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_03AA36
	moveq	#$1,d0
	bra.s	loc_03AA38
loc_03AA36:
	moveq	#$0,d0
loc_03AA38:
	moveq	#$0,d1
	move.b	$12(a3),d1
	lea.l	-$3C98(a5),a0
	move.b	d0,(a0,d1.w)
	subq.l	#$4,a4
loc_03AA48:
	tst.w	-$3C80(a5)
	beq.s	loc_03AA56
	subq.w	#$1,-$3C80(a5)
	bra.w	loc_03AB96
loc_03AA56:
	move.w	-$348E(a5),d0
	ext.l	d0
	move.w	(a3),d1
	ext.l	d1
	move.w	(a4),d2
	ext.l	d2
	add.l	d1,d2
	move.l	#$1FF,d1
	and.l	d2,d1
	add.l	d0,d1
	move.w	d1,d0
	move.w	d0,-$16(a6)
	ext.l	d0
	add.l	#$80,d0
	move.w	d0,-$14(a6)
	move.w	-$3490(a5),d0
	ext.l	d0
	add.l	d5,d0
	move.w	d0,-$12(a6)
	ext.l	d0
	add.l	#$80,d0
	move.w	d0,-$10(a6)
	addi.w	#$10,-$16(a6)
	subi.w	#$10,-$14(a6)
	addi.w	#$10,-$12(a6)
	subi.w	#$10,-$10(a6)
	tst.l	-$8(a6)
	beq.s	loc_03AB24
	movea.l	-$8(a6),a0
	move.w	-$16(a6),d0
	cmp.w	$52(a0),d0
	bgt.s	loc_03AB24
	move.w	-$14(a6),d0
	cmp.w	$4E(a0),d0
	blt.s	loc_03AB24
	move.w	-$12(a6),d0
	cmp.w	$50(a0),d0
	bgt.s	loc_03AB24
	move.w	-$10(a6),d0
	cmp.w	$4C(a0),d0
	blt.s	loc_03AB24
	tst.w	$C(a3)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_03AAF2
	moveq	#$A,d0
	bra.s	loc_03AAF4
loc_03AAF2:
	moveq	#$9,d0
loc_03AAF4:
	move.w	d0,-$18(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$3,d1
	move.l	d1,-(a7)
	move.w	-$18(a6),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	d0,-(a7)
	movea.l	-$8(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$DC,-$3C80(a5)
	lea.l	$18(a7),a7
loc_03AB24:
	tst.l	-$4(a6)
	beq.s	loc_03AB96
	movea.l	-$4(a6),a0
	move.w	-$16(a6),d0
	cmp.w	$52(a0),d0
	bgt.s	loc_03AB96
	move.w	-$14(a6),d0
	cmp.w	$4E(a0),d0
	blt.s	loc_03AB96
	move.w	-$12(a6),d0
	cmp.w	$50(a0),d0
	bgt.s	loc_03AB96
	move.w	-$10(a6),d0
	cmp.w	$4C(a0),d0
	blt.s	loc_03AB96
	tst.w	$C(a3)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_03AB64
	moveq	#$A,d0
	bra.s	loc_03AB66
loc_03AB64:
	moveq	#$9,d0
loc_03AB66:
	move.w	d0,-$18(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$3,d1
	move.l	d1,-(a7)
	move.w	-$18(a6),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	d0,-(a7)
	movea.l	-$4(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$DC,-$3C80(a5)
	lea.l	$18(a7),a7
loc_03AB96:
	move.l	-$C(a6),d0
	subq.l	#$1,-$C(a6)
	lea.l	$14(a3),a3
loc_03ABA2:
	tst.l	-$C(a6)
	bne.w	loc_03A93E
	pea.l	($380).w
	move.l	#$F400,-(a7)
	pea.l	g_HScrollBuf(a5)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	jsr	$4DF2(a5)	; -> Scroll_RequestVsram
	lea.l	$C(a7),a7
	movem.l	-$3C(a6),d3-d7/a3-a4
	unlk	a6
	rts
