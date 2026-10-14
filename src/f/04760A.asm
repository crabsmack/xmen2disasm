; ---------------------------------------------------------------------------
; sub_04760A	[jt 304]
; ---------------------------------------------------------------------------
sub_04760A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	$98A(a5),a0
	movea.l	$2(a0),a4
	move.w	-$3B0C(a5),d0
	ext.l	d0
	subq.l	#$1,d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	adda.l	d0,a4
	moveq	#$9,d7
loc_04762E:
	move.l	d7,d0
	add.l	d0,d0
	move.l	d7,d1
	add.w	d1,d1
	lea.l	-$3980(a5),a0
	move.w	(a4,d0.l),(a0,d1.w)
	subq.l	#$1,d7
	tst.l	d7
	bne.s	loc_04762E
	move.b	#$1,-$3A06(a5)
	moveq	#$1,d0
	and.w	-$3B0C(a5),d0
	beq.s	loc_047660
	moveq	#$1,d0
	cmp.w	-$3B38(a5),d0
	bge.s	loc_047660
	subq.w	#$1,-$3B38(a5)
loc_047660:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
