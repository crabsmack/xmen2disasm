; ---------------------------------------------------------------------------
; sub_0F4440	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0F4440:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$10(a6),a4
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.w	loc_0F44DC
	move.w	$54(a4),d0
	cmp.w	$E(a3),d0
	bge.s	loc_0F4482
	move.w	$56(a4),d0
	cmp.w	$C(a3),d0
	bge.s	loc_0F4482
	move.w	$5A(a4),d0
	cmp.w	$8(a3),d0
	blt.s	loc_0F4482
	move.w	$58(a4),d0
	cmp.w	$A(a3),d0
	bgt.s	loc_0F4486
loc_0F4482:
	moveq	#$1,d0
	bra.s	loc_0F44DE
loc_0F4486:
	moveq	#$4,d7
	move.w	$5A(a4),d0
	cmp.w	$C(a3),d0
	ble.s	loc_0F4496
	moveq	#$6,d7
	bra.s	loc_0F44A2
loc_0F4496:
	move.w	$56(a4),d0
	cmp.w	$8(a3),d0
	ble.s	loc_0F44A2
	moveq	#$5,d7
loc_0F44A2:
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_0F44B2
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_0F44D8
loc_0F44B2:
	tst.w	$6A(a4)
	bne.s	loc_0F44D8
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0F44D8:
	moveq	#$0,d0
	bra.s	loc_0F44DE
loc_0F44DC:
	moveq	#$0,d0
loc_0F44DE:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
