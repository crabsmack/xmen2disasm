; ---------------------------------------------------------------------------
; sub_13E4EA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13E4EA:
	link.w	a6,#$FFF6
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	-$A(a6)
	movea.l	a3,a4
	lea.l	$E(a4),a4
	clr.b	-$6(a6)
	clr.b	-$1(a6)
	tst.b	$D(a3)
	ble.s	loc_13E512
	subq.b	#$1,$D(a3)
loc_13E512:
	moveq	#$5,d0
	cmp.w	-$A(a6),d0
	ble.w	loc_13E6B0
	tst.b	$21(a4)
	beq.w	loc_13E6A0
	clr.w	d5
	bra.w	loc_13E694
loc_13E52A:
	tst.b	$18(a4,d5.w)
	bne.s	loc_13E538
	tst.b	$1B(a4,d5.w)
	beq.w	loc_13E690
loc_13E538:
	clr.b	-$5(a6)
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.l	(a4,d0.l),d0
	asr.l	#$3,d0
	move.w	d0,d6
	sub.w	g_CameraX(a5),d6
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.l	$C(a4,d0.l),d0
	asr.l	#$3,d0
	move.w	d0,d7
	sub.w	g_CameraY(a5),d7
	cmpi.w	#$120,d6
	bgt.s	loc_13E56A
	tst.w	d6
	bge.s	loc_13E57E
loc_13E56A:
	move.b	$18(a4,d5.w),d0
	ext.w	d0
	neg.w	d0
	move.b	d0,$18(a4,d5.w)
	move.b	#$1,-$1(a6)
	bra.s	loc_13E59A
loc_13E57E:
	cmpi.w	#$C0,d7
	bgt.s	loc_13E588
	tst.w	d7
	bge.s	loc_13E59A
loc_13E588:
	move.b	$1B(a4,d5.w),d0
	ext.w	d0
	neg.w	d0
	move.b	d0,$1B(a4,d5.w)
	move.b	#$1,-$1(a6)
loc_13E59A:
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.b	$18(a4,d5.w),d1
	ext.w	d1
	ext.l	d1
	add.l	d1,(a4,d0.l)
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.b	$1B(a4,d5.w),d1
	ext.w	d1
	ext.l	d1
	add.l	d1,$C(a4,d0.l)
	tst.b	-$38DE(a5)
	beq.s	loc_13E5E8
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.b	$18(a4,d5.w),d1
	ext.w	d1
	ext.l	d1
	add.l	d1,(a4,d0.l)
	ext.l	d5
	move.l	d5,d0
	asl.l	#$2,d0
	move.b	$1B(a4,d5.w),d1
	ext.w	d1
	ext.l	d1
	add.l	d1,$C(a4,d0.l)
loc_13E5E8:
	moveq	#$0,d0
	move.b	$1E(a4,d5.w),d0
	moveq	#$F,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	move.w	d0,-$4(a6)
	move.b	$1E(a4,d5.w),d0
	lsr.b	#$4,d0
	moveq	#$0,d4
	move.b	d0,d4
	tst.l	d4
	tst.b	-$38DE(a5)
	beq.s	loc_13E610
	moveq	#$2,d0
	bra.s	loc_13E612
loc_13E610:
	moveq	#$1,d0
loc_13E612:
	ext.w	d0
	sub.w	d0,-$4(a6)
	moveq	#$0,d0
	move.b	$21(a4),d0
	cmpi.b	#$3,d0
	bcc.s	loc_13E650
	moveq	#$F,d0
	muls.w	d4,d0
	move.w	-$4(a6),d1
	ext.l	d1
	moveq	#$F,d2
	sub.l	d1,d2
	add.w	d0,d2
	move.w	d2,-$8(a6)
	moveq	#$0,d0
	move.b	$21(a4),d0
	ext.l	d0
	move.l	d0,d1
	add.l	d0,d0
	add.l	d1,d0
	cmp.w	-$8(a6),d0
	bgt.s	loc_13E650
	addq.b	#$1,$21(a4)
loc_13E650:
	tst.w	-$4(a6)
	bgt.s	loc_13E67A
	move.w	d4,d0
	addq.w	#$1,d4
	cmpi.w	#$6,d4
	ble.s	loc_13E66A
	clr.b	$18(a4,d5.w)
	clr.b	$1B(a4,d5.w)
	bra.s	loc_13E690
loc_13E66A:
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$4,d0
	moveq	#$F,d1
	or.l	d0,d1
	move.b	d1,$1E(a4,d5.w)
	bra.s	loc_13E68A
loc_13E67A:
	andi.b	#$F0,$1E(a4,d5.w)
	moveq	#$F,d0
	and.w	-$4(a6),d0
	or.b	d0,$1E(a4,d5.w)
loc_13E68A:
	move.b	#$1,-$6(a6)
loc_13E690:
	move.w	d5,d0
	addq.w	#$1,d5
loc_13E694:
	moveq	#$0,d0
	move.b	$21(a4),d0
	cmp.w	d5,d0
	bgt.w	loc_13E52A
loc_13E6A0:
	move.w	-$A(a6),d0
	addq.w	#$1,-$A(a6)
	lea.l	$22(a4),a4
	bra.w	loc_13E512
loc_13E6B0:
	tst.b	-$6(a6)
	bne.s	loc_13E6C0
	move.l	a3,-(a7)
	jsr	sub_13D8F6(pc)
	addq.w	#$4,a7
	bra.s	loc_13E6E4
loc_13E6C0:
	tst.b	-$1(a6)
	beq.s	loc_13E6E4
	tst.b	$D(a3)
	bgt.s	loc_13E6E4
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	#$6,$D(a3)
	addq.w	#$8,a7
loc_13E6E4:
	movem.l	-$22(a6),d4-d7/a3-a4
	unlk	a6
	rts
