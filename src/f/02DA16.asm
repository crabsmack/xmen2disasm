; ---------------------------------------------------------------------------
; sub_02DA16	[jt 198]
; ---------------------------------------------------------------------------
sub_02DA16:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$67A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	tst.b	$AB(a4)
	addq.w	#$4,a7
	beq.s	loc_02DA58
	subq.b	#$1,$AB(a4)
	bne.s	loc_02DA58
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> sub_15DF66
	moveq	#$0,d0
	move.l	d0,$84(a4)
	addq.w	#$8,a7
loc_02DA58:
	tst.b	$A7(a4)
	beq.s	loc_02DA6A
	subq.b	#$1,$A7(a4)
	bne.s	loc_02DA6A
	andi.w	#$FFBF,$6(a4)
loc_02DA6A:
	pea.l	-$1758(a5)
	jsr	sub_02D96C(pc)
	pea.l	-$1848(a5)
	jsr	sub_02D96C(pc)
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	tst.w	d6
	addq.w	#$8,a7
	blt.s	loc_02DA9C
	cmpi.w	#$180,d6
	bgt.s	loc_02DA9C
	tst.w	d7
	blt.s	loc_02DA9C
	cmpi.w	#$380,d7
	ble.s	loc_02DAD4
loc_02DA9C:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.b	$AC(a4)
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$6C(a4)
	lea.l	sub_02CDCA(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
loc_02DAD4:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
