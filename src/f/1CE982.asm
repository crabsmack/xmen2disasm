; ---------------------------------------------------------------------------
; sub_1CE982	[jt 2303]
; ---------------------------------------------------------------------------
sub_1CE982:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$10(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE9A6
	move.w	-$3B9E(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE9AE
loc_1CE9A6:
	move.w	-$3B9E(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE9AE:
	beq.s	loc_1CE9C8
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE9C0
	move.w	#$6,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9C0:
	move.w	#$3,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9C8:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE9DC
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE9E4
loc_1CE9DC:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE9E4:
	beq.s	loc_1CE9FE
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE9F6
	move.w	#$8,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9F6:
	move.w	#$1,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9FE:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CEA0E
	move.w	#$7,$BC(a4)
	bra.s	loc_1CEA14
loc_1CEA0E:
	move.w	#$2,$BC(a4)
loc_1CEA14:
	lea.l	sub_1CE902(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CE902(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
