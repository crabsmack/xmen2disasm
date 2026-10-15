; ---------------------------------------------------------------------------
; sub_13679A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13679A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_1367B0
	moveq	#$2,d0
	bra.s	loc_1367B2
loc_1367B0:
	moveq	#$1,d0
loc_1367B2:
	move.w	d0,d7
loc_1367B4:
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
	beq.s	loc_1367E6
	move.l	a4,-(a7)
	jsr	sub_136598(pc)
	addq.w	#$4,a7
loc_1367E6:
	subq.w	#$1,d7
	bne.s	loc_1367B4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	cmp.l	d7,d0
	ble.s	loc_13680C
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_13680C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
