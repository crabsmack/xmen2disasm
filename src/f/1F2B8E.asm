; ---------------------------------------------------------------------------
; sub_1F2B8E	[jt 2453]
; ---------------------------------------------------------------------------
sub_1F2B8E:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	bne.s	loc_1F2BB0
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F2BBE
loc_1F2BB0:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F2BBE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2BD2
	move.w	-$3B9E(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1F2BDA
loc_1F2BD2:
	move.w	-$3B9E(a5),d0
	and.w	-$3A30(a5),d0
loc_1F2BDA:
	beq.s	loc_1F2BE4
	ori.l	#$400000,$90(a4)
loc_1F2BE4:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2BF8
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2C00
loc_1F2BF8:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2C00:
	beq.s	loc_1F2C1C
	tst.b	$9D(a4)
	bne.s	loc_1F2C12
	move.w	-$3B9A(a5),d0
	or.w	d0,-$3A2E(a5)
	bra.s	loc_1F2C52
loc_1F2C12:
	move.w	-$3B9A(a5),d0
	or.w	d0,-$3A30(a5)
	bra.s	loc_1F2C52
loc_1F2C1C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2C30
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2C38
loc_1F2C30:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2C38:
	beq.s	loc_1F2C52
	tst.b	$9D(a4)
	bne.s	loc_1F2C4A
	move.w	-$3B98(a5),d0
	or.w	d0,-$3A2E(a5)
	bra.s	loc_1F2C52
loc_1F2C4A:
	move.w	-$3B98(a5),d0
	or.w	d0,-$3A30(a5)
loc_1F2C52:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
