; ---------------------------------------------------------------------------
; sub_0BC954	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BC954:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.w	-$348E(a5),d0
	ext.l	d0
	move.l	d0,d7
	add.l	#$A0,d7
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BC98C
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	bra.s	loc_0BC996
loc_0BC98C:
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	neg.l	d0
loc_0BC996:
	moveq	#$F,d1
	cmp.l	d0,d1
	ble.s	loc_0BC9E4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.l	$98(a4)
	bne.s	loc_0BC9B6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BCA22
loc_0BC9B6:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC9CA
	clr.w	$96(a4)
loc_0BC9CA:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BCA22
loc_0BC9E4:
	cmp.w	d6,d7
	ble.s	loc_0BC9F0
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BC9F6
loc_0BC9F0:
	ori.b	#$10,$2E(a4)
loc_0BC9F6:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BCA06
	move.l	#$FFFFFDE0,d0
	bra.s	loc_0BCA0C
loc_0BCA06:
	move.l	#$220,d0
loc_0BCA0C:
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BC954(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BCA22:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
