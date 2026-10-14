; ---------------------------------------------------------------------------
; sub_113F5C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_113F5C:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	move.b	$F(a6),d5
	movea.l	$8(a6),a4
	tst.l	$60(a4)
	bne.s	loc_113F78
	move.l	$5C(a4),$60(a4)
loc_113F78:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_113F8E
	moveq	#$63,d0
	bra.s	loc_113F9A
loc_113F8E:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_113F9A:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_113FBA
	moveq	#$63,d0
	bra.s	loc_113FC6
loc_113FBA:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_113FC6:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.b	$13(a6),d0
	subi.b	#$9,d0
	addq.w	#$8,a7
	bmi.w	loc_114100
	cmpi.b	#$3,d0
	bgt.w	loc_114100
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$113FF4(pc,d1.w),d1
	jmp	$113FF2(pc,d1.w)
