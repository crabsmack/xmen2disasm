; ---------------------------------------------------------------------------
; XNpc_StateDeathFlying - XNPC flung body: fly ballistically; explode on hitting a wall or falling below the landing line
; In:  8(a6) = this
; Out: d0
; Evidence: sub_15CECC wall probe, vtable +$7E; TAS 915-57154
; ---------------------------------------------------------------------------
XNpc_StateDeathFlying:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	ble.s	loc_1149DE
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($4000).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d1,d2
	asr.l	#$1,d2
	move.l	d2,-(a7)
	move.w	$52(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1149DE
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_114AB0
loc_1149DE:
	tst.w	$16(a4)
	bge.s	loc_114A32
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($4000).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d1,d2
	asr.l	#$1,d2
	move.l	d2,-(a7)
	move.w	$4E(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_114A32
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_114AB0
loc_114A32:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	$12(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bge.s	loc_114A50
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_114AB0
loc_114A50:
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
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_114A9E
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
loc_114A9E:
	clr.w	$6C(a4)
	lea.l	XNpc_StateDeathFlying(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_114AB0:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
