; ---------------------------------------------------------------------------
; sub_039DBA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_039DBA:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.b	$1B(a6),d4
	move.l	$14(a6),d5
	move.l	$10(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
loc_039DD6:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	sub.l	#$830,d1
	lsl.l	#$1,d1
	add.l	d6,d1
	move.l	d1,(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	sub.l	#$830,d1
	lsl.l	#$2,d1
	add.l	d5,d1
	move.l	d1,$4(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	sub.l	#$768,d1
	asr.l	#$2,d1
	add.w	#$258,d1
	move.w	d1,$8(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	sub.l	#$768,d1
	asr.l	#$4,d1
	add.w	#$F95C,d1
	move.w	d1,$A(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	sub.l	#$768,d1
	moveq	#$A,d0
	asr.l	d0,d1
	add.w	#$FFF6,d1
	move.w	d1,$C(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	sub.l	#$768,d1
	asr.l	#$8,d1
	add.w	#$46,d1
	move.w	d1,$E(a4)
	tst.b	d4
	beq.s	loc_039E7E
	move.w	$8(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$8(a4)
	move.w	$C(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$C(a4)
loc_039E7E:
	lea.l	$12(a4),a4
	subq.w	#$1,d7
	tst.w	d7
	bne.w	loc_039DD6
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
