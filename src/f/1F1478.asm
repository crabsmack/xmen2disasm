; ---------------------------------------------------------------------------
; sub_1F1478	[jt 2425]
; ---------------------------------------------------------------------------
sub_1F1478:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a3
	movea.l	$10(a6),a4
	move.l	a4,d0
	beq.s	loc_1F14F8
	moveq	#$10,d0
	and.b	$2E(a3),d0
	bne.s	loc_1F14C8
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F14AC
	move.w	$8(a4),d0
	bra.s	loc_1F14B0
loc_1F14AC:
	move.w	$C(a4),d0
loc_1F14B0:
	move.w	d0,d6
	move.w	$52(a3),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	slt.b	d3
	neg.b	d3
	move.b	d3,d0
	bra.s	loc_1F14FA
loc_1F14C8:
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F14DC
	move.w	$8(a4),d0
	bra.s	loc_1F14E0
loc_1F14DC:
	move.w	$C(a4),d0
loc_1F14E0:
	move.w	d0,d6
	move.w	$4E(a3),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	sgt.b	d3
	neg.b	d3
	move.b	d3,d0
	bra.s	loc_1F14FA
loc_1F14F8:
	moveq	#$0,d0
loc_1F14FA:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
