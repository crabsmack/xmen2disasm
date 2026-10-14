; ---------------------------------------------------------------------------
; sub_1F2C6E	[jt 2454]
; ---------------------------------------------------------------------------
sub_1F2C6E:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	bne.s	loc_1F2C90
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F2C9E
loc_1F2C90:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F2C9E:
	ori.l	#$200000,$90(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2CBA
	move.w	-$3BA0(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2CC2
loc_1F2CBA:
	move.w	-$3BA0(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2CC2:
	beq.s	loc_1F2CEA
	tst.b	$9D(a4)
	bne.s	loc_1F2CDA
	move.w	-$3B9C(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F2D58
loc_1F2CDA:
	move.w	-$3B9C(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
	bra.s	loc_1F2D58
loc_1F2CEA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2CFE
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2D06
loc_1F2CFE:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2D06:
	beq.s	loc_1F2D22
	tst.b	$9D(a4)
	bne.s	loc_1F2D18
	move.w	-$3B9A(a5),d0
	or.w	d0,-$3A2E(a5)
	bra.s	loc_1F2D58
loc_1F2D18:
	move.w	-$3B9A(a5),d0
	or.w	d0,-$3A30(a5)
	bra.s	loc_1F2D58
loc_1F2D22:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2D36
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2D3E
loc_1F2D36:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2D3E:
	beq.s	loc_1F2D58
	tst.b	$9D(a4)
	bne.s	loc_1F2D50
	move.w	-$3B98(a5),d0
	or.w	d0,-$3A2E(a5)
	bra.s	loc_1F2D58
loc_1F2D50:
	move.w	-$3B98(a5),d0
	or.w	d0,-$3A30(a5)
loc_1F2D58:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
