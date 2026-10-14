; ---------------------------------------------------------------------------
; sub_02D7C8	[jt 196]
; ---------------------------------------------------------------------------
sub_02D7C8:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d7
	move.b	$AC(a4),d7
	tst.l	d7
	beq.w	loc_02D906
	moveq	#$2,d0
	and.l	d7,d0
	beq.s	loc_02D82E
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$16(a4),d0
	cmp.w	$22(a4),d0
	ble.s	loc_02D80A
	move.w	$22(a4),$16(a4)
	bra.s	loc_02D828
loc_02D80A:
	move.w	$22(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	$16(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_02D828
	move.w	$22(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_02D828:
	move.l	$8C(a4),$8(a4)
loc_02D82E:
	btst	#$0,d7
	beq.s	loc_02D87C
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$90(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	move.w	$18(a4),d0
	cmp.w	$24(a4),d0
	ble.s	loc_02D858
	move.w	$24(a4),$18(a4)
	bra.s	loc_02D876
loc_02D858:
	move.w	$24(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	$18(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_02D876
	move.w	$24(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
loc_02D876:
	move.l	$90(a4),$C(a4)
loc_02D87C:
	moveq	#$4,d0
	and.l	d7,d0
	beq.s	loc_02D8C0
	move.b	$9C(a4),d0
	ext.w	d0
	add.w	d0,$98(a4)
	cmpi.w	#$168,$98(a4)
	blt.s	loc_02D89C
	subi.w	#$168,$98(a4)
	bra.s	loc_02D8A8
loc_02D89C:
	tst.w	$98(a4)
	bge.s	loc_02D8A8
	addi.w	#$168,$9A(a4)
loc_02D8A8:
	move.w	$98(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> sub_1FDEF8
	move.b	$9E(a4),d1
	asr.l	d1,d0
	add.l	d0,$8(a4)
	addq.w	#$4,a7
loc_02D8C0:
	moveq	#$8,d0
	and.l	d7,d0
	beq.s	loc_02D912
	move.b	$9D(a4),d0
	ext.w	d0
	add.w	d0,$9A(a4)
	cmpi.w	#$168,$9A(a4)
	blt.s	loc_02D8E0
	subi.w	#$168,$9A(a4)
	bra.s	loc_02D8EC
loc_02D8E0:
	tst.w	$9A(a4)
	bge.s	loc_02D8EC
	addi.w	#$168,$9A(a4)
loc_02D8EC:
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> sub_1FDEF8
	move.b	$9F(a4),d1
	asr.l	d1,d0
	add.l	d0,$C(a4)
	addq.w	#$4,a7
	bra.s	loc_02D912
loc_02D906:
	move.l	$8(a4),$8C(a4)
	move.l	$C(a4),$90(a4)
loc_02D912:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
