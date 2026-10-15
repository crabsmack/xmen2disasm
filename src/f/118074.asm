; ---------------------------------------------------------------------------
; sub_118074	[link-after-rts]
; ---------------------------------------------------------------------------
sub_118074:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	lea.l	-$1D40(a5),a3
	move.b	$13(a6),d4
	move.l	$C(a6),d5
	move.l	$8(a6),d6
	lea.l	(a3),a4
	clr.w	d7
loc_118090:
	tst.l	$6(a4)
	bne.w	loc_11811A
	move.l	d6,d0
	asr.l	#$8,d0
	sub.w	#$10,d0
	move.w	d0,(a4)
	move.l	d5,d0
	asr.l	#$8,d0
	sub.w	#$10,d0
	move.w	d0,$2(a4)
	move.w	$16(a6),$C(a4)
	move.b	#$4,$5(a4)
	clr.b	$4(a4)
	move.w	#$2000,d0
	or.w	-$3BB8(a5),d0
	ext.l	d0
	tst.b	d4
	beq.s	loc_1180D4
	move.l	#$8000,d1
	bra.s	loc_1180D6
loc_1180D4:
	moveq	#$0,d1
loc_1180D6:
	or.l	d0,d1
	move.w	d1,$A(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	pea.l	sub_1182D4(pc)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	move.l	d0,$6(a4)
	lea.l	$10(a7),a7
	beq.s	loc_118116
	move.l	$6(a4),-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,d0
	lea.l	$C(a7),a7
	bra.s	loc_11812C
loc_118116:
	moveq	#$0,d0
	bra.s	loc_11812C
loc_11811A:
	lea.l	$E(a4),a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$A,d7
	blt.w	loc_118090
	moveq	#$0,d0
loc_11812C:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
