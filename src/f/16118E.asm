; ---------------------------------------------------------------------------
; sub_16118E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_16118E:
	link.w	a6,#$FFFE
	movem.l	d3-d7,-(a7)
	move.w	$16(a6),d6
	move.w	$E(a6),d5
	ext.l	d6
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d6,d7
	sub.l	d0,d7
	ext.l	d7
	ext.l	d5
	move.l	d7,d4
	sub.l	d5,d4
	ext.l	d6
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	move.w	d1,d0
	move.w	d0,-$2(a6)
	ext.l	d0
	move.w	$12(a6),d1
	ext.l	d1
	move.l	d1,d6
	add.l	d0,d6
	move.w	-$2(a6),d0
	ext.l	d0
	move.w	$12(a6),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	tst.w	d7
	ble.s	loc_1611E6
	clr.w	d7
loc_1611E6:
	tst.w	d6
	bge.s	loc_1611EC
	clr.w	d6
loc_1611EC:
	cmp.w	d4,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_1611FE
	ext.l	d5
	ext.l	d6
	move.l	d5,d0
	add.l	d6,d0
	bra.s	loc_161218
loc_1611FE:
	cmp.w	d4,d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_161210
	ext.l	d5
	ext.l	d7
	move.l	d5,d0
	add.l	d7,d0
	bra.s	loc_161218
loc_161210:
	ext.l	d5
	ext.l	d4
	move.l	d5,d0
	add.l	d4,d0
loc_161218:
	movem.l	-$16(a6),d3-d7
	unlk	a6
	rts
