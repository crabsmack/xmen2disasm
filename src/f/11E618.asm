; ---------------------------------------------------------------------------
; sub_11E618	[jt 1623]
; ---------------------------------------------------------------------------
sub_11E618:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	moveq	#$20,d0
	and.b	$2E(a4),d0
	bne.s	loc_11E66E
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$507A(a5)	; -> sub_1FB142
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$14(a7),a7
	bra.s	loc_11E6E2
loc_11E66E:
	clr.w	d5
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_11E67C
	move.w	#$8000,d5
loc_11E67C:
	subq.w	#$4,d6
	subq.w	#$6,d7
	move.w	$34(a4),d0
	ext.l	d0
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	moveq	#$D,d1
	lsl.l	d1,d2
	or.l	d0,d2
	ext.l	d5
	move.l	d5,d4
	or.l	d2,d4
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	d4,$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
loc_11E6E2:
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
