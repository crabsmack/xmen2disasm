; ---------------------------------------------------------------------------
; ICandy_Update - ICandy per frame: destroy when outside the active window, else move (velocity + accel) and step the animation record at +$32
; In:  8(a6) = this
; Out: none
; Evidence: method 3 of ICANDY; window bounds $FFCC3A-$FFCC40 vs camera $FFCD70/$FFCD72; calls vtable +$1A (ICandy_Destroy); runs twice per call at half rate (byte $FFC922)
; ---------------------------------------------------------------------------
ICandy_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	clr.b	d5
	cmp.w	-$35C2(a5),d6
	ble.s	loc_118588
	moveq	#$1,d5
	bra.s	loc_1185A4
loc_118588:
	cmp.w	-$35C0(a5),d6
	bge.s	loc_118592
	moveq	#$1,d5
	bra.s	loc_1185A4
loc_118592:
	cmp.w	-$35C6(a5),d7
	ble.s	loc_11859C
	moveq	#$1,d5
	bra.s	loc_1185A4
loc_11859C:
	cmp.w	-$35C4(a5),d7
	bge.s	loc_1185A4
	moveq	#$1,d5
loc_1185A4:
	tst.b	d5
	beq.s	loc_1185B8
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_11869E
loc_1185B8:
	move.w	$14(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$18(a4),d0
	add.w	d0,$14(a4)
	move.w	$1A(a4),d0
	add.w	d0,$16(a4)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_118606
	move.w	$14(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$18(a4),d0
	add.w	d0,$14(a4)
	move.w	$1A(a4),d0
	add.w	d0,$16(a4)
loc_118606:
	tst.l	$32(a4)
	bne.s	loc_11861C
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_11869E
loc_11861C:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_118626
	moveq	#$2,d0
	bra.s	loc_118628
loc_118626:
	moveq	#$1,d0
loc_118628:
	ext.w	d0
	add.w	d0,$38(a4)
	movea.l	$32(a4),a0
	move.w	$38(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_11869E
	addq.w	#$1,$36(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$36(a4),d0
	bgt.s	loc_118664
	clr.w	$36(a4)
	movea.l	$32(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_118664
	moveq	#$0,d0
	move.l	d0,$32(a4)
loc_118664:
	tst.l	$32(a4)
	beq.s	loc_11869E
	move.w	$36(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$32(a4),d0
	movea.l	d0,a0
	move.b	$7(a0),$1D(a4)
	moveq	#$0,d0
	move.b	$1D(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_118694
	move.b	$1D(a4),d0
	cmp.b	$26(a4),d0
	beq.s	loc_11869A
loc_118694:
	andi.b	#$DF,$1C(a4)
loc_11869A:
	clr.w	$38(a4)
loc_11869E:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
