; ---------------------------------------------------------------------------
; sub_1F1424	[jt 2424]
; ---------------------------------------------------------------------------
sub_1F1424:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$10(a6),a4
	move.l	a4,d0
	beq.s	loc_1F146C
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F1448
	move.w	$A(a4),d0
	bra.s	loc_1F144C
loc_1F1448:
	move.w	$E(a4),d0
loc_1F144C:
	move.w	d0,d7
	movea.l	$8(a6),a0
	move.w	$50(a0),d0
	ext.l	d0
	move.w	$E(a6),d1
	ext.l	d1
	add.l	d0,d1
	ext.l	d7
	cmp.l	d1,d7
	slt.b	d3
	neg.b	d3
	move.b	d3,d0
	bra.s	loc_1F146E
loc_1F146C:
	moveq	#$0,d0
loc_1F146E:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
