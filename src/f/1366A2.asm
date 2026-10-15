; ---------------------------------------------------------------------------
; sub_1366A2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1366A2:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_1366B8
	moveq	#$2,d0
	bra.s	loc_1366BA
loc_1366B8:
	moveq	#$1,d0
loc_1366BA:
	move.w	d0,d7
loc_1366BC:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	tst.l	$98(a4)
	beq.s	loc_1366EE
	move.l	a4,-(a7)
	jsr	sub_136598(pc)
	addq.w	#$4,a7
loc_1366EE:
	subq.w	#$1,d7
	bne.s	loc_1366BC
	move.w	$A0(a4),d0
	btst	#$0,d0
	beq.s	loc_136738
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$1A4,d7
	ble.s	loc_13671E
	move.l	#$1A400,$8(a4)
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_136738
loc_13671E:
	cmpi.w	#$3C,d7
	bge.s	loc_136738
	move.l	#$3C00,$8(a4)
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_136738:
	moveq	#$2,d0
	and.w	$A0(a4),d0
	beq.s	loc_13677C
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$172,d7
	ble.s	loc_136762
	move.l	#$17200,$C(a4)
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	bra.s	loc_13677C
loc_136762:
	cmpi.w	#$104,d7
	bge.s	loc_13677C
	move.l	#$10400,$C(a4)
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
loc_13677C:
	moveq	#$4,d0
	and.w	$A0(a4),d0
	beq.s	loc_136790
	clr.w	$6E(a4)
	lea.l	sub_136816(pc),a0
	move.l	a0,$94(a4)
loc_136790:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
