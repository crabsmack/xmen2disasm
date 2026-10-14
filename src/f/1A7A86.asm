; ---------------------------------------------------------------------------
; sub_1A7A86	[jt 2207]
; ---------------------------------------------------------------------------
sub_1A7A86:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$800000,d0
	and.l	$90(a4),d0
	bne.s	loc_1A7ADE
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7AB2
	move.w	-$3BA8(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1A7ABA
loc_1A7AB2:
	move.w	-$3BA8(a5),d0
	and.w	-$3A38(a5),d0
loc_1A7ABA:
	beq.s	loc_1A7ADE
	moveq	#$20,d0
	cmp.w	$9E(a4),d0
	ble.s	loc_1A7ADE
	tst.b	-$38DE(a5)
	beq.s	loc_1A7ACE
	moveq	#$4,d0
	bra.s	loc_1A7AD0
loc_1A7ACE:
	moveq	#$2,d0
loc_1A7AD0:
	ext.w	d0
	add.w	d0,$9E(a4)
	move.b	#$1,-$38B2(a5)
	bra.s	loc_1A7B06
loc_1A7ADE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7AF2
	move.w	-$3BA8(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1A7AFA
loc_1A7AF2:
	move.w	-$3BA8(a5),d0
	and.w	-$3A2C(a5),d0
loc_1A7AFA:
	beq.s	loc_1A7B06
	move.b	#$1,-$38B2(a5)
	clr.w	$9E(a4)
loc_1A7B06:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
