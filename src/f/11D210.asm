; ---------------------------------------------------------------------------
; BabyBio_ActWalkForward - BABYBIO script action: walk at speed +$B4 in the facing direction (stand if both limits are equal), next entry
; In:  8(a6) = this
; Out: none
; Evidence: +$2E bit 4 = facing left
; ---------------------------------------------------------------------------
BabyBio_ActWalkForward:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	move.w	$AC(a4),d0
	cmp.w	$AE(a4),d0
	bne.s	loc_11D23A
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	bra.s	loc_11D27E
loc_11D23A:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D260
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11D254
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11D25C
loc_11D254:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11D25C:
	neg.l	d0
	bra.s	loc_11D27A
loc_11D260:
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11D272
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11D27A
loc_11D272:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11D27A:
	move.w	d0,$16(a4)
loc_11D27E:
	tst.l	$98(a4)
	bne.s	loc_11D290
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D2BC
loc_11D290:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D2A4
	clr.w	$96(a4)
loc_11D2A4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11D2BC:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
