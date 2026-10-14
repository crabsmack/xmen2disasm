; ---------------------------------------------------------------------------
; sub_13E30E	[jt 1879]
; ---------------------------------------------------------------------------
sub_13E30E:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d4
	asr.l	#$8,d4
	move.l	$C(a4),d5
	asr.l	#$8,d5
	cmpi.w	#$A0,d4
	bge.s	loc_13E334
	clr.w	d4
	move.w	#$200,d6
	bra.s	loc_13E33A
loc_13E334:
	clr.w	d4
	move.w	#$FE00,d6
loc_13E33A:
	cmpi.w	#$70,d5
	bge.s	loc_13E348
	move.w	#$800,d5
	moveq	#-$20,d7
	bra.s	loc_13E34E
loc_13E348:
	move.w	#$F800,d5
	moveq	#$20,d7
loc_13E34E:
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.l	a4,-(a7)
	jsr	sub_13E23E(pc)
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
