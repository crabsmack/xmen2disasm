; ---------------------------------------------------------------------------
; sub_04BEFA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04BEFA:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$96(a3),a4
	move.l	a4,d0
	beq.s	loc_04BF46
	move.l	$8(a3),d5
	asr.l	#$8,d5
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.w	#$8200,d7
	ext.l	d5
	ext.l	d6
	move.l	d5,d7
	sub.l	d6,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_04BF34
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_04BF3A
loc_04BF34:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_04BF3A:
	move.w	d0,d7
	cmp.w	$E(a6),d7
	bge.s	loc_04BF46
	moveq	#$1,d0
	bra.s	loc_04BF48
loc_04BF46:
	moveq	#$0,d0
loc_04BF48:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
