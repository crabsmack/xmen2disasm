; ---------------------------------------------------------------------------
; sub_1F005C
; ---------------------------------------------------------------------------
sub_1F005C:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F00A8
	moveq	#$1,d3
	move.w	-$3BA6(a5),d0
	or.w	#$F,d0
	move.w	-$3BA4(a5),d1
	or.w	d0,d1
	and.w	-$3A26(a5),d1
	bne.s	loc_1F00DC
	moveq	#$10,d0
	and.l	$90(a4),d0
	beq.s	loc_1F009A
	move.w	-$3BA8(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1F00A2
loc_1F009A:
	move.w	-$3BA8(a5),d0
	and.w	-$3A26(a5),d0
loc_1F00A2:
	bne.s	loc_1F00DC
	moveq	#$0,d3
	bra.s	loc_1F00DC
loc_1F00A8:
	moveq	#$1,d3
	move.w	-$3BA6(a5),d0
	or.w	#$F,d0
	move.w	-$3BA4(a5),d1
	or.w	d0,d1
	and.w	-$3A28(a5),d1
	bne.s	loc_1F00DC
	moveq	#$10,d0
	and.l	$90(a4),d0
	beq.s	loc_1F00D0
	move.w	-$3BA8(a5),d0
	and.w	-$3A2C(a5),d0
	bra.s	loc_1F00D8
loc_1F00D0:
	move.w	-$3BA8(a5),d0
	and.w	-$3A28(a5),d0
loc_1F00D8:
	bne.s	loc_1F00DC
	moveq	#$0,d3
loc_1F00DC:
	move.b	d3,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
