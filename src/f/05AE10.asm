; ---------------------------------------------------------------------------
; sub_05AE10	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05AE10:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$8C(a3),a4
	move.l	$8(a3),d5
	asr.l	#$6,d5
	move.l	$C(a3),d6
	asr.l	#$6,d6
	move.w	$16(a3),d0
	asr.w	#$6,d0
	ext.l	d0
	move.l	d0,d4
	clr.w	d7
	moveq	#$3,d3
loc_05AE3A:
	move.b	$42(a3),$6(a4)
	move.w	d7,d0
	beq.s	loc_05AE4E
	subq.w	#$1,d0
	beq.s	loc_05AE70
	subq.w	#$1,d0
	beq.s	loc_05AE94
	bra.s	loc_05AEB4
loc_05AE4E:
	move.w	d5,d0
	sub.w	#$30,d0
	move.w	d0,(a4)
	move.w	d6,d0
	sub.w	#$30,d0
	move.w	d0,$2(a4)
	move.b	d4,d0
	subq.b	#$4,d0
	move.b	d0,$4(a4)
	move.b	#$10,$5(a4)
	bra.s	loc_05AEBC
loc_05AE70:
	move.w	d5,d0
	add.w	#$40,d0
	move.w	d0,(a4)
	move.w	d6,d0
	sub.w	#$C,d0
	move.w	d0,$2(a4)
	move.b	d4,d0
	moveq	#$C,d1
	add.b	d1,d0
	move.b	d0,$4(a4)
	move.b	#$4,$5(a4)
	bra.s	loc_05AEBC
loc_05AE94:
	move.w	d5,d0
	addq.w	#$4,d0
	move.w	d0,(a4)
	move.w	d6,d0
	add.w	#$30,d0
	move.w	d0,$2(a4)
	move.b	d4,d0
	subq.b	#$8,d0
	move.b	d0,$4(a4)
	move.b	#$8,$5(a4)
	bra.s	loc_05AEBC
loc_05AEB4:
	move.b	d4,$4(a4)
	clr.w	$4(a4)
loc_05AEBC:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	cmp.w	d7,d3
	bgt.w	loc_05AE3A
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
