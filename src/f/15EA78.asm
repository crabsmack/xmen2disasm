; ---------------------------------------------------------------------------
; sub_15EA78	[jt 2071]
; ---------------------------------------------------------------------------
sub_15EA78:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d6
	clr.w	d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	bra.s	loc_15EAB6
loc_15EA90:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_15EAA6
	cmpa.l	(a4),a3
	bne.s	loc_15EAA6
	move.w	d6,d0
	addq.w	#$1,d6
loc_15EAA6:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_15EAB6:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_15EA90
	move.w	d6,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
