; ---------------------------------------------------------------------------
; sub_04C432	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C432:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_04C450
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_04C458
loc_04C450:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_04C458:
	moveq	#$30,d1
	cmp.l	d0,d1
	ble.s	loc_04C4A0
	move.w	#$3C,$6A(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#-$1,d0
	cmp.w	$6E(a4),d0
	bne.s	loc_04C48A
	lea.l	sub_04C4C6(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_04C4C6(pc)
	addq.w	#$4,a7
	bra.s	loc_04C4BC
loc_04C48A:
	move.w	$6E(a4),$6C(a4)
	lea.l	sub_04C4C6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_04C4BC
loc_04C4A0:
	move.w	$16(a4),d0
	asr.w	#$1,d0
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_04C432(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04C4BC:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
