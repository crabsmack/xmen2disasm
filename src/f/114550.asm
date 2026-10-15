; ---------------------------------------------------------------------------
; XNpc_StateKnockSlide - XNPC knockback slide: move with deceleration; stop at walls, when the speed reverses or the counter ends, then EndHurt
; In:  8(a6) = this
; Out: d0
; Evidence: wall probe sub_15CECC at the box edge; vtable +$76; TAS 706-53680
; ---------------------------------------------------------------------------
XNpc_StateKnockSlide:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$90(a4),d0
	tst.l	d0
	bls.w	loc_1146B0
	tst.w	$1A(a4)
	ble.s	loc_1145BE
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($4000).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d1,d2
	asr.l	#$1,d2
	move.l	d2,-(a7)
	move.w	$52(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1145BE
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1146BC
loc_1145BE:
	tst.w	$1A(a4)
	bge.s	loc_114614
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($4000).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d1,d2
	asr.l	#$1,d2
	move.l	d2,-(a7)
	move.w	$4E(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_114614
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1146BC
loc_114614:
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.b	#$1,d0
	shi.b	d3
	neg.b	d3
	beq.s	loc_114632
	tst.b	-$38DE(a5)
	beq.s	loc_11462E
	moveq	#$2,d0
	bra.s	loc_114648
loc_11462E:
	moveq	#$1,d0
	bra.s	loc_114648
loc_114632:
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.w	#$1,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_114646
	moveq	#$1,d0
	bra.s	loc_114648
loc_114646:
	moveq	#$0,d0
loc_114648:
	sub.b	d0,$90(a4)
	move.w	$1A(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$1C(a4),d0
	add.w	d0,$1A(a4)
	tst.b	-$38DE(a5)
	beq.s	loc_114676
	move.w	$1A(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$1C(a4),d0
	add.w	d0,$1A(a4)
loc_114676:
	tst.w	$1A(a4)
	ble.s	loc_114682
	tst.w	$1C(a4)
	bgt.s	loc_11468E
loc_114682:
	tst.w	$1A(a4)
	bge.s	loc_11469C
	tst.w	$1C(a4)
	bge.s	loc_11469C
loc_11468E:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1146BC
loc_11469C:
	clr.w	$6C(a4)
	lea.l	XNpc_StateKnockSlide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1146BC
loc_1146B0:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1146BC:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
