; ---------------------------------------------------------------------------
; sub_1A6A5C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A6A5C:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_1A6AF0
	moveq	#$0,d0
	move.b	$7B(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$33D2(a5),a0
	lea.l	(a0,d0.w),a3
	move.l	$8(a4),d7
	asr.l	#$8,d7
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1A6AB8
	move.w	$C(a3),d0
	cmp.w	$8(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1A6AAC
	move.w	$C(a3),d0
	bra.s	loc_1A6AB0
loc_1A6AAC:
	move.w	$8(a3),d0
loc_1A6AB0:
	move.w	d0,d5
	cmp.w	d5,d7
	bgt.s	loc_1A6B1A
	bra.s	loc_1A6AD6
loc_1A6AB8:
	move.w	$C(a3),d0
	cmp.w	$8(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_1A6ACC
	move.w	$C(a3),d0
	bra.s	loc_1A6AD0
loc_1A6ACC:
	move.w	$8(a3),d0
loc_1A6AD0:
	move.w	d0,d6
	cmp.w	d6,d7
	blt.s	loc_1A6B1A
loc_1A6AD6:
	ori.w	#$100,$4(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6B2C
loc_1A6AF0:
	tst.l	$44(a4)
	bne.s	loc_1A6B1A
	lea.l	$4472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6B2C
loc_1A6B1A:
	clr.w	$6C(a4)
	lea.l	sub_1A6A5C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A6B2C:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
