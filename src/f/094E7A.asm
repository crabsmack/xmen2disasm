; ---------------------------------------------------------------------------
; sub_094E7A	[jt 703]
; ---------------------------------------------------------------------------
sub_094E7A:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
loc_094E8A:
	movea.l	$92(a4),a3
	addq.w	#$2,a3
	tst.b	$C4(a4)
	beq.s	loc_094ED0
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	subq.w	#$8,d0
	move.w	d0,(a3)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	subq.w	#$8,d0
	move.w	d0,$2(a3)
loc_094ED0:
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	lea.l	$1632(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d7
	addq.w	#$8,a7
	bgt.s	loc_094E8A
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
