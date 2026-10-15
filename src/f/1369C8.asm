; ---------------------------------------------------------------------------
; sub_1369C8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1369C8:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_1369DE
	moveq	#$2,d0
	bra.s	loc_1369E0
loc_1369DE:
	moveq	#$1,d0
loc_1369E0:
	move.w	d0,d7
loc_1369E2:
	tst.l	$98(a4)
	beq.s	loc_1369F0
	move.l	a4,-(a7)
	jsr	sub_136598(pc)
	addq.w	#$4,a7
loc_1369F0:
	subq.w	#$1,d7
	bne.s	loc_1369E2
	tst.w	$6E(a4)
	bne.s	loc_136A28
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	#$380,d7
	move.w	#$300,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_136A18
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_136A18:
	move.w	d7,$16(a4)
	move.w	d6,$18(a4)
	lea.l	sub_136992(pc),a0
	move.l	a0,$94(a4)
loc_136A28:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
