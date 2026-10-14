; ---------------------------------------------------------------------------
; sub_0841C4	[jt 585]
; ---------------------------------------------------------------------------
sub_0841C4:
	link.w	a6,#$FFFC
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1242(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	sub_08468E(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_08468E(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$80,$6(a4)
	lea.l	$11DA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_08425C
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_084254
	ori.b	#$4,$2E(a4)
	bra.s	loc_0842A2
loc_084254:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0842A2
loc_08425C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_08428C
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_084284
	ori.b	#$4,$2E(a4)
	bra.s	loc_0842A2
loc_084284:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0842A2
loc_08428C:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_08429C
	ori.b	#$4,$2E(a4)
	bra.s	loc_0842A2
loc_08429C:
	andi.b	#$FB,$2E(a4)
loc_0842A2:
	lea.l	$121A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	clr.w	$B2(a4)
	moveq	#$1,d6
	move.w	$6(a3),d7
	beq.s	loc_0842E2
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0842D8
	ext.l	d7
	move.l	d7,d1
	bra.s	loc_0842E4
loc_0842D8:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.l	d0,d1
	bra.s	loc_0842E4
loc_0842E2:
	moveq	#$60,d1
loc_0842E4:
	move.w	d1,d5
	tst.w	d7
	beq.s	loc_0842FA
	tst.w	d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0842F6
	moveq	#$1,d0
	bra.s	loc_0842FC
loc_0842F6:
	moveq	#$0,d0
	bra.s	loc_0842FC
loc_0842FA:
	moveq	#$1,d0
loc_0842FC:
	move.b	d0,$A0(a4)
	move.w	$2(a3),d0
	sub.w	d5,d0
	move.w	d0,$A2(a4)
	move.w	$8(a3),d7
	beq.s	loc_084326
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_08431E
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_084328
loc_08431E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_084328
loc_084326:
	moveq	#$60,d0
loc_084328:
	move.w	d0,d5
	tst.w	d7
	beq.s	loc_08433E
	tst.w	d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_08433A
	moveq	#$1,d0
	bra.s	loc_084340
loc_08433A:
	moveq	#$0,d0
	bra.s	loc_084340
loc_08433E:
	moveq	#$1,d0
loc_084340:
	move.b	d0,$A1(a4)
	move.w	d5,d0
	add.w	$2(a3),d0
	move.w	d0,$A4(a4)
	move.w	$A(a3),d7
	beq.s	loc_08436C
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_084362
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_084368
loc_084362:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_084368:
	lsl.l	#$8,d0
	bra.s	loc_084372
loc_08436C:
	move.l	#$100,d0
loc_084372:
	move.w	d0,$A6(a4)
	move.w	$C(a3),d7
	beq.s	loc_084380
	move.w	d7,d0
	bra.s	loc_084382
loc_084380:
	moveq	#$5A,d0
loc_084382:
	move.w	d0,$AE(a4)
	move.w	$AE(a4),$B0(a4)
	move.w	$E(a3),d7
	bge.s	loc_08439C
	clr.b	d6
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_08439C:
	move.w	d7,d0
	bmi.s	loc_0843B8
	cmpi.w	#$3,d0
	bgt.s	loc_0843B8
	add.w	d0,d0
	move.w	$843B0(pc,d0.w),d0
	jmp	$843AE(pc,d0.w)
