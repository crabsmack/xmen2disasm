; ---------------------------------------------------------------------------
; sub_1111EA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1111EA:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	move.w	$3A(a6),d5
	movea.l	$18(a6),a3
	movea.l	$14(a6),a4
loc_1111FE:
	movea.l	$28(a6),a0
	movea.l	$30(a6),a1
	move.w	(a0),(a1)
	movea.l	$2C(a6),a0
	movea.l	$34(a6),a1
	move.w	(a0),(a1)
	movea.l	$8(a6),a0
	movea.l	$C(a6),a1
	move.w	(a1),d0
	add.w	d0,(a0)
	movea.l	$8(a6),a0
	movea.l	$10(a6),a1
	move.w	(a0),d0
	cmp.w	(a1),d0
	ble.s	loc_111236
	movea.l	a1,a0
	movea.l	$8(a6),a1
	move.w	(a0),(a1)
	bra.s	loc_11125A
loc_111236:
	movea.l	$8(a6),a0
	movea.l	$10(a6),a1
	move.w	(a1),d0
	ext.l	d0
	neg.l	d0
	move.w	(a0),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_11125A
	movea.l	a1,a0
	move.w	(a0),d0
	ext.l	d0
	neg.l	d0
	movea.l	$8(a6),a0
	move.w	d0,(a0)
loc_11125A:
	movea.l	$1C(a6),a0
	move.l	(a0),d0
	add.l	d0,(a3)
	bra.s	loc_11126A
loc_111264:
	subi.l	#$16800,(a3)
loc_11126A:
	cmpi.l	#$16800,(a3)
	bge.s	loc_111264
	bra.s	loc_11127A
loc_111274:
	addi.l	#$16800,(a3)
loc_11127A:
	tst.l	(a3)
	blt.s	loc_111274
	move.l	(a3),d0
	add.l	d0,(a4)
	bra.s	loc_11128A
loc_111284:
	subi.l	#$16800,(a4)
loc_11128A:
	cmpi.l	#$16800,(a4)
	bge.s	loc_111284
	bra.s	loc_11129A
loc_111294:
	addi.l	#$16800,(a4)
loc_11129A:
	tst.l	(a4)
	blt.s	loc_111294
	move.l	(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.l	d0,d6
	asr.l	#$8,d6
	move.l	(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	asr.l	#$8,d0
	neg.l	d0
	move.l	d0,d7
	movea.l	$8(a6),a0
	move.w	(a0),d0
	asr.w	#$8,d0
	addq.w	#$8,a7
	bmi.w	loc_1114FC
	cmpi.w	#$10,d0
	bgt.w	loc_1114FC
	add.w	d0,d0
	move.w	$1112DC(pc,d0.w),d0
	jmp	$1112DA(pc,d0.w)
