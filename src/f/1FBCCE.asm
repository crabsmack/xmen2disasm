; ---------------------------------------------------------------------------
; sub_1FBCCE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FBCCE:
	link.w	a6,#$FFFC
	movem.l	d2-d7/a2-a4,-(a7)
	clr.b	-$1(a6)
	moveq	#$0,d2
	movea.l	$8(a6),a0
	movea.l	$2(a0),a2
	move.b	(a0),d1
	move.b	$A(a0),d2
	bmi.w	loc_1FBE7C
	move.w	$16(a6),d7
	sf.b	-$2(a6)
	sf.b	-$3(a6)
	moveq	#$0,d4
	move.b	d1,d4
	ror.l	#$3,d4
	swap	d4
	btst	#$4,d1
	beq.s	loc_1FBD10
	st.b	-$2(a6)
	ori.w	#$800,d4
loc_1FBD10:
	btst	#$3,d1
	beq.s	loc_1FBD1E
	st.b	-$3(a6)
	ori.w	#$1000,d4
loc_1FBD1E:
	lea.l	$24(a2),a3
	lsl.w	#$2,d2
	adda.w	d2,a3
	lsl.w	#$2,d2
	adda.w	d2,a3
	movea.l	a2,a4
	adda.w	$12(a3),a4
	moveq	#$0,d5
	bra.w	loc_1FBE74
loc_1FBD36:
	andi.w	#$7FF,d7
	or.w	d4,d7
	tst.w	$6(a4)
	bne.s	loc_1FBD78
	movea.l	$8(a6),a0
	move.b	$D(a0),d0
	cmpi.b	#$FF,d0
	beq.w	loc_1FBE70
	move.w	$2(a4),d0
	add.w	$12(a6),d0
	move.l	d0,-(a7)
	move.w	(a4),d0
	tst.b	-$2(a6)
	beq.s	loc_1FBD66
	neg.w	d0
loc_1FBD66:
	add.w	$E(a6),d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	jsr	sub_1FB1C2(pc)
	bra.w	loc_1FBE70
loc_1FBD78:
	moveq	#$0,d6
	move.w	$4(a4),d2
	move.w	d2,d6
	andi.w	#$F,d6
	move.w	d6,d3
	ror.l	#$8,d6
	add.w	d3,d3
	andi.w	#$1800,d2
	eor.w	d2,d7
	swap	d7
	move.w	(a4),d7
	move.w	$2(a4),d6
	tst.b	-$2(a6)
	beq.s	loc_1FBDA4
	neg.w	d7
	sub.w	$1FBDBA(pc,d3.w),d7
loc_1FBDA4:
	add.w	$E(a6),d7
	tst.b	-$3(a6)
	beq.s	loc_1FBDB4
	neg.w	d6
	sub.w	$1FBDDA(pc,d3.w),d6
loc_1FBDB4:
	add.w	$12(a6),d6
	bra.s	loc_1FBE1A
