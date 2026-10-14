; ---------------------------------------------------------------------------
; sub_1347F8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1347F8:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.w	$18(a4),d6
loc_13480C:
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
	subq.w	#$1,d7
	bne.s	loc_13480C
	tst.w	d6
	beq.s	loc_134860
	move.w	$9C(a4),d7
	move.l	$C(a4),d5
	asr.l	#$8,d5
	tst.w	d6
	ble.s	loc_13484A
	cmp.w	d5,d7
	ble.s	loc_134852
loc_13484A:
	tst.w	d6
	bge.s	loc_134860
	cmp.w	d5,d7
	blt.s	loc_134860
loc_134852:
	clr.w	$18(a4)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
loc_134860:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
