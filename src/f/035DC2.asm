; ---------------------------------------------------------------------------
; sub_035DC2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_035DC2:
	link.w	a6,#$FFD8
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	-$3CAE(a5),d0
	ext.l	d0
	movea.l	-$10F4(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
	move.l	a4,-$12(a6)
	lea.l	$2C0(a4),a3
	move.w	$E(a6),-$E(a6)
	move.w	$A(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$C(a6)
	move.w	-$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$8(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	sub_035BE8(pc)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	move.l	d0,-$4(a6)
	lea.l	$10(a7),a7
	beq.w	loc_036034
	move.l	-$4(a6),-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	addq.w	#$4,a7
	bra.w	loc_036004
loc_035E36:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$22(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	-$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$A(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	moveq	#$0,d7
	lea.l	$10(a7),a7
	bra.w	loc_035FE4
loc_035E60:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	add.l	#$200,d1
	move.l	d1,-$1C(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	move.l	-$1C(a6),d1
	move.w	d1,d5
	sub.w	d0,d5
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3,d6
	and.w	d1,d6
	tst.b	$1B(a6)
	beq.s	loc_035EB4
	ext.l	d5
	move.l	d5,d0
	neg.l	d0
	move.w	d0,d5
	moveq	#$0,d0
	move.b	d6,d0
	neg.w	d0
	move.b	d0,d6
loc_035EB4:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$20(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$1F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$20(a6),d0
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	-$C(a6),d0
	move.l	d0,(a4)
	move.w	d5,$8(a4)
	move.b	d6,$C(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$24(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$7F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$24(a6),d0
	sub.l	d1,d0
	add.w	#$FDE0,d0
	move.w	d0,-$16(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$F,d0
	and.w	d1,d0
	moveq	#$20,d1
	add.b	d1,d0
	move.b	d0,-$13(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$28(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$1F,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$28(a6),d0
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	-$8(a6),d0
	move.l	d0,$4(a4)
	move.w	-$16(a6),$A(a4)
	move.b	-$13(a6),$D(a4)
	moveq	#$3,d0
	and.l	d7,d0
	beq.s	loc_035F82
	subq.l	#$1,d0
	beq.s	loc_035F90
	subq.l	#$1,d0
	beq.s	loc_035FA0
loc_035F82:
	clr.b	-$18(a6)
	move.b	#$1,-$17(a6)
	moveq	#$8,d4
	bra.s	loc_035FAE
loc_035F90:
	move.b	#$3,-$18(a6)
	move.b	#$2,-$17(a6)
	moveq	#$10,d4
	bra.s	loc_035FAE
loc_035FA0:
	move.b	#$6,-$18(a6)
	move.b	#$4,-$17(a6)
	moveq	#$10,d4
loc_035FAE:
	move.b	-$18(a6),$13(a4)
	move.b	-$17(a6),$15(a4)
	move.b	-$17(a6),$14(a4)
	moveq	#$0,d0
	move.b	d4,d0
	move.w	$1E(a6),d1
	sub.w	d0,d1
	move.w	d1,$10(a4)
	moveq	#$1,d0
	and.l	d7,d0
	move.b	d0,$12(a4)
	move.w	#$1,$E(a4)
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$16(a4),a4
loc_035FE4:
	move.w	$16(a6),d0
	ext.l	d0
	cmp.l	d7,d0
	ble.s	loc_035FF4
	cmpa.l	a4,a3
	bhi.w	loc_035E60
loc_035FF4:
	move.w	-$E(a6),d0
	addq.w	#$1,-$E(a6)
	addi.l	#$2000,-$8(a6)
loc_036004:
	cmpa.l	a4,a3
	bls.s	loc_03601E
	move.w	-$E(a6),d0
	cmp.w	$12(a6),d0
	ble.w	loc_035E36
	bra.s	loc_03601E
loc_036016:
	clr.w	$E(a4)
	lea.l	$16(a4),a4
loc_03601E:
	cmpa.l	a4,a3
	bhi.s	loc_036016
	moveq	#$34,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$34,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_036034:
	movem.l	-$40(a6),d4-d7/a3-a4
	unlk	a6
	rts
