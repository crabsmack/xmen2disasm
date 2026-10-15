; ---------------------------------------------------------------------------
; sub_15B0E6	[jt 2019]
; ---------------------------------------------------------------------------
sub_15B0E6:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	-$3598(a5),d6
	move.w	-$3BB6(a5),d0
	add.w	-$3BB4(a5),d0
	move.w	d0,-$3598(a5)
	clr.w	-$34A2(a5)
	movea.l	$8(a6),a0
	jsr	(a0)
	cmp.w	-$3598(a5),d6
	blt.s	loc_15B11A
	tst.b	$F(a6)
	bne.s	loc_15B11A
	move.w	d6,-$3598(a5)
	bra.s	loc_15B180
loc_15B11A:
	clr.w	d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	bra.s	loc_15B17A
loc_15B124:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15B16A
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15B16A
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_15B16A
	cmp.w	$34(a4),d6
	bgt.s	loc_15B16A
	move.w	-$3598(a5),$34(a4)
	move.w	$36(a4),d0
	add.w	d0,-$3598(a5)
	pea.l	$2E(a4)
	jsr	$5072(a5)	; -> sub_1FB126
	addq.w	#$4,a7
loc_15B16A:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_15B17A:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_15B124
loc_15B180:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
