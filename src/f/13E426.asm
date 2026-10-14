; ---------------------------------------------------------------------------
; sub_13E426	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13E426:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.l	$10(a6),d5
	move.l	$C(a6),d6
	movea.l	$8(a6),a0
	lea.l	$18(a0),a3
	lea.l	$1B(a0),a4
	clr.w	d7
	moveq	#$3,d3
loc_13E446:
	ext.l	d7
	movea.l	$8(a6),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
	lsl.l	#$5,d0
	sub.l	d6,d0
	asr.l	#$7,d0
	movea.l	$8(a6),a0
	move.b	d0,$18(a0,d7.w)
	ext.l	d7
	movea.l	$8(a6),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	$C(a0,d0.l),d0
	lsl.l	#$5,d0
	sub.l	d5,d0
	asr.l	#$8,d0
	movea.l	$8(a6),a0
	move.b	d0,$1B(a0,d7.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_13E446
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
