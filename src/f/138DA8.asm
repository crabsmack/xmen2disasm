; ---------------------------------------------------------------------------
; sub_138DA8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_138DA8:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	move.l	$C(a3),d7
	asr.l	#$8,d7
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d0,d4
	sub.l	#$C0,d4
	ext.l	d7
	move.l	d7,d6
	moveq	#-$30,d0
	add.l	d0,d6
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,d5
	add.l	#$C0,d5
	ext.l	d7
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d7,d2
	sub.l	d1,d2
	moveq	#$40,d1
	cmp.l	d2,d1
	ble.s	loc_138E04
	moveq	#$0,d0
	bra.w	loc_138E98
loc_138E04:
	ext.l	d7
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	cmpi.l	#$E0,d1
	ble.s	loc_138E1C
	moveq	#$0,d0
	bra.s	loc_138E98
loc_138E1C:
	movea.l	$76(a3),a0
	move.b	$1(a0),d0
	subi.b	#$21,d0
	beq.s	loc_138E2E
	subq.b	#$1,d0
	bne.s	loc_138E66
loc_138E2E:
	moveq	#$0,d3
	cmp.w	$52(a4),d4
	bgt.s	loc_138E62
	cmp.w	$4E(a4),d5
	blt.s	loc_138E62
	ext.l	d6
	move.l	d6,d0
	moveq	#$20,d1
	sub.l	d1,d0
	move.w	$50(a4),d2
	ext.l	d2
	cmp.l	d0,d2
	blt.s	loc_138E62
	ext.l	d7
	move.l	d7,d0
	moveq	#$20,d1
	add.l	d1,d0
	move.w	$4C(a4),d2
	ext.l	d2
	cmp.l	d0,d2
	bgt.s	loc_138E62
	moveq	#$1,d3
loc_138E62:
	move.b	d3,d0
	bra.s	loc_138E98
loc_138E66:
	moveq	#$0,d3
	cmp.w	$52(a4),d4
	bgt.s	loc_138E96
	cmp.w	$4E(a4),d5
	blt.s	loc_138E96
	ext.l	d6
	move.w	$50(a4),d0
	ext.l	d0
	moveq	#$10,d1
	sub.l	d1,d0
	cmp.l	d6,d0
	blt.s	loc_138E96
	ext.l	d6
	move.w	$4C(a4),d0
	ext.l	d0
	moveq	#$10,d1
	add.l	d1,d0
	cmp.l	d6,d0
	bgt.s	loc_138E96
	moveq	#$1,d3
loc_138E96:
	move.b	d3,d0
loc_138E98:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
