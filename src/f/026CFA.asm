; ---------------------------------------------------------------------------
; sub_026CFA	[jt 171]
; ---------------------------------------------------------------------------
sub_026CFA:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$C(a3),d4
	asr.l	#$8,d4
	ori.w	#$1,$8C(a3)
	moveq	#$2,d7
	movea.l	g_ObjTable(a5),a0
	movea.l	$8(a0),a4
	bra.s	loc_026D7A
loc_026D1E:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_026D6C
	cmpa.l	a4,a3
	beq.s	loc_026D6C
	move.l	$C(a4),d5
	asr.l	#$8,d5
	ext.l	d4
	ext.l	d5
	move.l	d4,d6
	sub.l	d5,d6
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_026D56
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_026D5C
loc_026D56:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_026D5C:
	move.w	d0,d6
	cmpi.w	#$3C,d6
	bge.s	loc_026D6C
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	addq.w	#$4,a7
loc_026D6C:
	addq.l	#$1,d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_026D7A:
	move.w	g_ObjCount(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_026D1E
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
