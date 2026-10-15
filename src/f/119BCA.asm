; ---------------------------------------------------------------------------
; sub_119BCA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_119BCA:
	link.w	a6,#$FFF4
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$A,d6
	bra.w	loc_119CDC
loc_119BDC:
	move.w	$34(a3),d7
	addq.w	#$1,$34(a3)
	ext.l	d7
	movea.l	-$38DC(a5),a0
	move.l	d7,d0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
	move.l	$A(a4),-$4(a6)
	cmp.w	-$38D8(a5),d7
	blt.s	loc_119C1A
	lea.l	sub_119B66(pc),a0
	move.l	a0,$2C(a3)
	bra.w	loc_119CE2
loc_119C1A:
	movea.l	-$4(a6),a0
	move.w	(a0),d0
	ext.l	d0
	movea.l	g_ClassList(a5),a0
	asl.l	#$2,d0
	move.l	$2(a0,d0.l),d0
	cmp.l	$30(a3),d0
	bne.w	loc_119CDA
	movea.l	-$4(a6),a0
	moveq	#$0,d0
	move.b	$37(a3),d0
	cmp.w	$6(a0),d0
	bne.w	loc_119CDA
	moveq	#$0,d0
	move.b	$4(a4),d0
	moveq	#$2,d1
	and.b	d0,d1
	bne.s	loc_119C6A
	move.l	a4,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$2E(a0),a1
	jsr	(a1)
	move.l	d0,-$C(a6)
	movea.l	d0,a0
	move.b	d7,$14(a0)
	addq.w	#$8,a7
loc_119C6A:
	moveq	#$0,d0
	move.b	$5(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_119C7E
	moveq	#$0,d0
	bra.s	loc_119C8E
loc_119C7E:
	moveq	#$0,d0
	move.b	$5(a4),d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_119C8E:
	move.l	d0,-$8(a6)
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_119CBC
	movea.l	-$8(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_119CBC:
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmpi.b	#$A,d0
	bcc.s	loc_119CDA
	moveq	#$0,d0
	move.b	$36(a3),d0
	addq.b	#$1,$36(a3)
	asl.l	#$2,d0
	move.l	-$8(a6),$4(a3,d0.l)
loc_119CDA:
	subq.w	#$1,d6
loc_119CDC:
	tst.w	d6
	bne.w	loc_119BDC
loc_119CE2:
	movem.l	-$20(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
