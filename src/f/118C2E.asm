; ---------------------------------------------------------------------------
; loc_118C2E
; ---------------------------------------------------------------------------
loc_118C2E:
	move.l	d6,d0
	lsl.l	#$4,d0
	move.w	d0,$16(a4)
	move.l	d7,d0
	lsl.l	#$4,d0
	move.w	d0,$18(a4)
	move.w	#$80,d0
	and.w	$8C(a4),d0
	beq.s	loc_118C58
	move.l	d6,d0
	asr.l	#$1,d0
	add.w	d0,$16(a4)
	move.l	d7,d0
	asr.l	#$1,d0
	add.w	d0,$18(a4)
loc_118C58:
	moveq	#$40,d0
	and.w	$8C(a4),d0
	beq.s	loc_118C70
	move.l	d6,d0
	asr.l	#$2,d0
	add.w	d0,$16(a4)
	move.l	d7,d0
	asr.l	#$2,d0
	add.w	d0,$18(a4)
loc_118C70:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
