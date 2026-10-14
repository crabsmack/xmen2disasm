; ---------------------------------------------------------------------------
; sub_1B9198	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1B9198:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_1B91BA
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_1B923E
loc_1B91BA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B91CE
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1B91D6
loc_1B91CE:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_1B91D6:
	beq.s	loc_1B922C
	tst.b	$9D(a4)
	bne.s	loc_1B91EE
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1B91FC
loc_1B91EE:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1B91FC:
	moveq	#-$1,d0
	cmp.w	$6E(a4),d0
	bne.s	loc_1B9216
	lea.l	sub_1B90E0(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1B90E0(pc)
	addq.w	#$4,a7
	bra.s	loc_1B923E
loc_1B9216:
	move.w	$6E(a4),$6C(a4)
	lea.l	sub_1B90E0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1B923E
loc_1B922C:
	clr.w	$6C(a4)
	lea.l	sub_1B9198(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1B923E:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
