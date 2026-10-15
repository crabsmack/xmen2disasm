; ---------------------------------------------------------------------------
; sub_13A8C4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13A8C4:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_13A8D6
	moveq	#$2,d0
	bra.s	loc_13A8D8
loc_13A8D6:
	moveq	#$1,d0
loc_13A8D8:
	move.w	d0,d6
	movea.l	-$1A7C(a5),a4
	clr.w	d7
	bra.w	loc_13A9E8
loc_13A8E4:
	tst.l	$18(a4)
	bne.s	loc_13A8FE
	move.l	a4,-(a7)
	jsr	sub_13A882(pc)
	move.w	d7,d0
	subq.w	#$1,d7
	lea.l	-$26(a4),a4
	addq.w	#$4,a7
	bra.w	loc_13A9E0
loc_13A8FE:
	move.w	$4(a4),d4
	sub.w	g_CameraX(a5),d4
	move.w	$6(a4),d5
	sub.w	g_CameraY(a5),d5
	cmp.w	-$35C0(a5),d4
	blt.s	loc_13A93A
	ext.l	d4
	move.w	-$35C2(a5),d0
	ext.l	d0
	moveq	#$20,d1
	add.l	d1,d0
	cmp.l	d4,d0
	blt.s	loc_13A93A
	cmp.w	-$35C4(a5),d5
	blt.s	loc_13A93A
	ext.l	d5
	move.w	-$35C6(a5),d0
	ext.l	d0
	moveq	#$20,d1
	add.l	d1,d0
	cmp.l	d5,d0
	bge.s	loc_13A958
loc_13A93A:
	movea.l	$8(a4),a0
	move.b	#$1,$4(a0)
	move.l	a4,-(a7)
	jsr	sub_13A882(pc)
	move.w	d7,d0
	subq.w	#$1,d7
	lea.l	-$26(a4),a4
	addq.w	#$4,a7
	bra.w	loc_13A9E0
loc_13A958:
	tst.w	$1E(a4)
	ble.s	loc_13A962
	sub.w	d6,$1E(a4)
loc_13A962:
	tst.w	$1C(a4)
	bgt.s	loc_13A974
	move.l	a4,-(a7)
	movea.l	$18(a4),a0
	jsr	(a0)
	addq.w	#$4,a7
	bra.s	loc_13A978
loc_13A974:
	sub.w	d6,$1C(a4)
loc_13A978:
	tst.l	$10(a4)
	beq.s	loc_13A9E0
	movea.l	$10(a4),a0
	move.w	$16(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_13A9DC
	clr.w	$16(a4)
	addq.w	#$1,$14(a4)
	movea.l	$10(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$14(a4),d0
	bgt.s	loc_13A9BC
	clr.w	$14(a4)
	movea.l	$10(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_13A9BC
	moveq	#$0,d0
	move.l	d0,$10(a4)
loc_13A9BC:
	tst.l	$10(a4)
	beq.s	loc_13A9E0
	move.w	$14(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$10(a4),d0
	movea.l	d0,a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	bra.s	loc_13A9E0
loc_13A9DC:
	add.w	d6,$16(a4)
loc_13A9E0:
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$26(a4),a4
loc_13A9E8:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$1A78(a5),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_13A8E4
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
