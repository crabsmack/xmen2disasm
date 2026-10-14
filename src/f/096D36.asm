; ---------------------------------------------------------------------------
; loc_096D36
; ---------------------------------------------------------------------------
loc_096D36:
	move.l	d6,d0
	asr.l	#$3,d0
	move.l	d6,d1
	asr.l	#$5,d1
	sub.w	d1,d0
	move.w	d0,$16(a3)
	move.l	d7,d0
	asr.l	#$3,d0
	move.l	d7,d1
	asr.l	#$5,d1
	sub.w	d1,d0
	move.w	d0,$18(a3)
	move.w	$16(a3),d0
	ext.l	d0
	add.l	d0,$8(a3)
	move.w	$18(a3),d0
	ext.l	d0
	add.l	d0,$C(a3)
	clr.w	$6C(a4)
	lea.l	sub_096C9A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_096D78:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
