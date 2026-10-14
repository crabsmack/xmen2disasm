; ---------------------------------------------------------------------------
; sub_1F2572	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F2572:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d7
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F25AE
	clr.w	-$3AFA(a5)
	movea.l	$8C(a4),a0
	move.w	$18(a0),$24(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F26E8
loc_1F25AE:
	tst.l	$44(a4)
	bne.s	loc_1F25C8
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$5A(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1F25C8:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F25E6
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F25EE
loc_1F25E6:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1F25EE:
	beq.s	loc_1F2642
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1F261C
	movea.l	$8C(a4),a0
	move.w	$5C(a0),d0
	ext.l	d0
	add.l	$8C(a4),d0
	cmp.l	$44(a4),d0
	beq.s	loc_1F261C
	movea.l	a0,a1
	adda.w	$5C(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1F261C:
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$14(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$12(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F2520(pc)
	lea.l	$10(a7),a7
	bra.w	loc_1F26E8
loc_1F2642:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2656
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F265E
loc_1F2656:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F265E:
	beq.s	loc_1F26B0
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F268C
	movea.l	$8C(a4),a0
	move.w	$5C(a0),d0
	ext.l	d0
	add.l	$8C(a4),d0
	cmp.l	$44(a4),d0
	beq.s	loc_1F268C
	movea.l	a0,a1
	adda.w	$5C(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1F268C:
	moveq	#$1,d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$14(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$12(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F2520(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F26E8
loc_1F26B0:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1F26C8
	cmpi.w	#$100,$16(a4)
	ble.s	loc_1F26C8
	subi.w	#$40,$1E(a4)
	bra.s	loc_1F26E8
loc_1F26C8:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F26E0
	cmpi.w	#$FF00,$16(a4)
	bge.s	loc_1F26E0
	addi.w	#$40,$1E(a4)
	bra.s	loc_1F26E8
loc_1F26E0:
	clr.w	$16(a4)
	clr.w	$1E(a4)
loc_1F26E8:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
