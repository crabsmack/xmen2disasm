; ---------------------------------------------------------------------------
; sub_1345A6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1345A6:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$F(a6),d7
	movea.l	$8(a6),a4
	move.b	d7,$A6(a4)
	beq.s	loc_1345E6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$20,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	#$82,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	andi.b	#$EF,$2E(a4)
	bra.s	loc_134614
loc_1345E6:
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$160,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	#$82,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.b	$A6(a4)
	ori.b	#$10,$2E(a4)
loc_134614:
	tst.b	$A6(a4)
	beq.s	loc_134622
	move.l	#$FFFFFF7E,d0
	bra.s	loc_134628
loc_134622:
	move.l	#$82,d0
loc_134628:
	move.w	d0,$9A(a4)
	move.w	#$FFE5,$9C(a4)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
