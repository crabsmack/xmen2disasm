; ---------------------------------------------------------------------------
; sub_136A32	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136A32:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_136A48
	moveq	#$2,d0
	bra.s	loc_136A4A
loc_136A48:
	moveq	#$1,d0
loc_136A4A:
	move.w	d0,d7
loc_136A4C:
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
	beq.s	loc_136A7E
	move.l	a4,-(a7)
	jsr	sub_136598(pc)
	addq.w	#$4,a7
loc_136A7E:
	subq.w	#$1,d7
	bne.s	loc_136A4C
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$116,d7
	bgt.s	loc_136A9C
	move.w	#$14,$6E(a4)
	lea.l	sub_1369C8(pc),a0
	move.l	a0,$94(a4)
loc_136A9C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
