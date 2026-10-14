; ---------------------------------------------------------------------------
; sub_11C190	[jt 1566]
; ---------------------------------------------------------------------------
sub_11C190:
	link.w	a6,#$FFF0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,d0
	bne.s	loc_11C1CC
	lea.l	-$10(a6),a3
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a3)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a3)
	clr.l	$6(a3)
	clr.l	$A(a3)
	clr.w	$E(a3)
loc_11C1CC:
	move.l	a3,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	lea.l	$308A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	move.l	$9C(a4),$8(a4)
	move.l	$A0(a4),$C(a4)
	lea.l	$10(a7),a7
	lea.l	$2F7A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_11C26E
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_11C266
	ori.b	#$4,$2E(a4)
	bra.s	loc_11C2B4
loc_11C266:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_11C2B4
loc_11C26E:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_11C29E
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_11C296
	ori.b	#$4,$2E(a4)
	bra.s	loc_11C2B4
loc_11C296:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_11C2B4
loc_11C29E:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_11C2AE
	ori.b	#$4,$2E(a4)
	bra.s	loc_11C2B4
loc_11C2AE:
	andi.b	#$FB,$2E(a4)
loc_11C2B4:
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	lea.l	sub_11C6CE(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$80,$6(a4)
	move.w	#$100,$B4(a4)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	lea.l	$2FDA(a5),a0
	move.l	$2(a0),$A4(a4)
	move.w	$6(a3),d7
	addq.w	#$8,a7
	beq.s	loc_11C320
	tst.w	d7
	ble.s	loc_11C2FC
	move.b	#$1,$B7(a4)
	bra.s	loc_11C300
loc_11C2FC:
	clr.b	$B7(a4)
loc_11C300:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11C30E
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11C314
loc_11C30E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11C314:
	move.w	$2(a3),d1
	sub.w	d0,d1
	move.w	d1,$AC(a4)
	bra.s	loc_11C332
loc_11C320:
	move.b	#$1,$B7(a4)
	move.w	$2(a3),d0
	sub.w	#$30,d0
	move.w	d0,$AC(a4)
loc_11C332:
	move.w	$8(a3),d7
	beq.s	loc_11C366
	tst.w	d7
	ble.s	loc_11C344
	move.b	#$1,$B8(a4)
	bra.s	loc_11C348
loc_11C344:
	clr.b	$B8(a4)
loc_11C348:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11C356
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11C35C
loc_11C356:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11C35C:
	add.w	$2(a3),d0
	move.w	d0,$AE(a4)
	bra.s	loc_11C378
loc_11C366:
	move.b	#$1,$B8(a4)
	move.w	$2(a3),d0
	add.w	#$30,d0
	move.w	d0,$AE(a4)
loc_11C378:
	move.w	$4(a3),d0
	move.w	d0,$B0(a4)
	sub.w	#$40,d0
	move.w	d0,$B2(a4)
	move.w	$A(a3),d7
	beq.s	loc_11C394
	move.b	d7,$BA(a4)
	bra.s	loc_11C39A
loc_11C394:
	move.b	#$1,$BA(a4)
loc_11C39A:
	move.b	$BA(a4),$B9(a4)
	move.w	$C(a3),d7
	beq.s	loc_11C3AC
	move.b	d7,$B6(a4)
	bra.s	loc_11C3B2
loc_11C3AC:
	move.b	#$78,$B6(a4)
loc_11C3B2:
	move.b	$F(a3),$BB(a4)
	movem.l	-$24(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
