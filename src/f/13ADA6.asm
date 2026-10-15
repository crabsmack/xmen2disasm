; ---------------------------------------------------------------------------
; Mine_Explode - mine state: explode - explosion effect, damage players inside the blast box, free the record, spawn the debris effect
; In:  8(a6) = mine record
; Out: d0 = misc
; Evidence: Explosion_Spawn(x<<8, y<<8, 0); each live player with hit cooldown 0 and box within x +/-$3C, y-$28..y-$1E gets vtable +$26 TakeDamage(p, 0, 4, 1, x, y); +$18 = 0 (removed next update); ACTOR New at the spot (jt $4DC2) -> sub_13DE4A
; ---------------------------------------------------------------------------
Mine_Explode:
	link.w	a6,#$FFF0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-$8(a6)
	move.w	$6(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$4(a6),-(a7)
	move.l	-$8(a6),-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	clr.w	d7
	lea.l	$C(a7),a7
loc_13ADE0:
	tst.w	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_13ADF0
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_13ADF6
loc_13ADF0:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_13ADF6:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_13AECA
	move.l	-$8(a6),d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	-$4(a6),d4
	asr.l	#$8,d4
	move.w	-$E(a6),d0
	ext.l	d0
	move.l	d0,d5
	moveq	#$3C,d0
	sub.l	d0,d5
	ext.l	d4
	move.l	d4,d6
	moveq	#$28,d1
	sub.l	d1,d6
	ext.l	d5
	move.l	d5,d2
	moveq	#$78,d0
	add.l	d0,d2
	move.w	d2,-$C(a6)
	ext.l	d6
	move.l	d6,d2
	moveq	#$A,d0
	add.l	d0,d2
	move.w	d2,-$A(a6)
	move.w	$4(a4),d2
	ext.l	d2
	move.w	#$C000,d3
	and.w	d2,d3
	moveq	#$0,d2
	move.w	d3,d2
	cmpi.l	#$8000,d2
	bne.s	loc_13AECA
	tst.w	$6A(a4)
	bne.s	loc_13AECA
	cmp.w	$5A(a4),d5
	bgt.s	loc_13AECA
	move.w	-$C(a6),d0
	cmp.w	$56(a4),d0
	blt.s	loc_13AECA
	cmp.w	$58(a4),d6
	bgt.s	loc_13AECA
	move.w	-$A(a6),d0
	cmp.w	$54(a4),d0
	blt.s	loc_13AECA
	move.l	-$8(a6),d0
	cmp.l	$8(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13AE9E
	moveq	#$A,d0
	bra.s	loc_13AEA0
loc_13AE9E:
	moveq	#$9,d0
loc_13AEA0:
	move.w	d0,-$10(a6)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_13AECA:
	addq.w	#$1,d7
	cmpi.w	#$2,d7
	blt.w	loc_13ADE0
	moveq	#$0,d0
	move.l	d0,$18(a3)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$4(a6),-(a7)
	move.l	-$8(a6),-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_13AF10
	move.l	a3,-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	addq.w	#$4,a7
loc_13AF10:
	movem.l	-$2C(a6),d3-d7/a3-a4
	unlk	a6
	rts
