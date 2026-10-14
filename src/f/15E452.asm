; ---------------------------------------------------------------------------
; sub_15E452	[jt 2063]
; ---------------------------------------------------------------------------
sub_15E452:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$4000,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	bne.w	loc_15E532
	moveq	#$40,d0
	and.w	$6(a4),d0
	beq.s	loc_15E488
	moveq	#$1,d0
	and.w	-$3A24(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.w	loc_15E550
loc_15E488:
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_15E4A8
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_15E4A8
	moveq	#$1,d3
loc_15E4A8:
	tst.b	d3
	beq.s	loc_15E4C4
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	-$3490(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_15E4D4
loc_15E4C4:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_15E4D4:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_15E4F6
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_15E4F6
	moveq	#$1,d3
loc_15E4F6:
	tst.b	d3
	beq.s	loc_15E512
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	-$348E(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_15E522
loc_15E512:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_15E522:
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
	bra.s	loc_15E550
loc_15E532:
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_15E550
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$5082(a5)	; -> sub_1FB1C2
	lea.l	$C(a7),a7
loc_15E550:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
