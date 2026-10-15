; ---------------------------------------------------------------------------
; sub_159ECC	[jt 2000]
; ---------------------------------------------------------------------------
sub_159ECC:
	link.w	a6,#$FFFA
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$98967F,d4
	move.l	#$FF676981,d5
	movea.l	g_Camera(a5),a0
	move.w	$32(a0),d7
	move.w	$5C(a0),d6
	beq.w	loc_159FAE
	ori.w	#$10,$4A(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_159F1A
	move.l	-$174C(a5),d4
	move.l	-$174C(a5),d5
loc_159F1A:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_159F5A
	cmp.l	-$183C(a5),d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_159F40
	move.l	d4,d0
	bra.s	loc_159F44
loc_159F40:
	move.l	-$183C(a5),d0
loc_159F44:
	move.l	d0,d4
	cmp.l	-$183C(a5),d5
	sgt.b	d3
	neg.b	d3
	beq.s	loc_159F54
	move.l	d5,d0
	bra.s	loc_159F58
loc_159F54:
	move.l	-$183C(a5),d0
loc_159F58:
	move.l	d0,d5
loc_159F5A:
	move.l	d4,d0
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
	move.l	d5,d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	move.w	-$4(a6),d5
	sub.w	$40(a4),d5
	move.w	-$2(a6),d4
	sub.w	$42(a4),d4
	add.w	d6,d7
	clr.w	d6
	cmp.w	d7,d5
	bge.s	loc_159F92
	move.w	d5,-$6(a6)
	move.w	d7,d6
	sub.w	-$6(a6),d6
	move.w	-$6(a6),d7
	bra.s	loc_159F9E
loc_159F92:
	cmp.w	d7,d4
	ble.s	loc_159F9E
	move.w	d4,d5
	move.w	d7,d6
	sub.w	d5,d6
	move.w	d5,d7
loc_159F9E:
	movea.l	g_Camera(a5),a0
	move.w	d7,$32(a0)
	movea.l	g_Camera(a5),a0
	move.w	d6,$5C(a0)
loc_159FAE:
	movem.l	-$1E(a6),d3-d7/a4
	unlk	a6
	rts
