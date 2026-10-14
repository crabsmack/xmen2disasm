; ---------------------------------------------------------------------------
; sub_1598F6	[jt 1990]
; ---------------------------------------------------------------------------
sub_1598F6:
	link.w	a6,#$FFE8
	movem.l	d4-d7/a4,-(a7)
	move.b	$17(a6),d4
	move.b	$13(a6),d5
	tst.b	d4
	beq.s	loc_159914
	move.l	#$200,d6
	moveq	#$0,d7
	bra.s	loc_15991C
loc_159914:
	move.l	#$400,d6
	moveq	#-$40,d7
loc_15991C:
	tst.b	$1B(a6)
	beq.s	loc_15993E
	pea.l	-$18(a6)
	pea.l	-$2(a6)
	pea.l	-$4(a6)
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	jsr	sub_1597BE(pc)
	lea.l	$10(a7),a7
	bra.s	loc_159958
loc_15993E:
	pea.l	-$18(a6)
	pea.l	-$2(a6)
	pea.l	-$4(a6)
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	jsr	sub_15980C(pc)
	lea.l	$10(a7),a7
loc_159958:
	moveq	#$0,d0
	move.b	d4,d0
	move.w	d0,-$E(a6)
	pea.l	-$14(a6)
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$C(a6),d1
	sub.l	d0,d1
	move.l	d1,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$8(a6),d0
	move.l	d0,-(a7)
	lea.l	$3E62(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$3E62(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_1599C0
	move.w	d6,$8C(a4)
	move.w	d7,$8E(a4)
	move.l	-$18(a6),$92(a4)
	moveq	#$0,d0
	move.l	d0,$96(a4)
	move.b	$1F(a6),$FF(a4)
loc_1599C0:
	move.l	a4,d0
	movem.l	-$2C(a6),d4-d7/a4
	unlk	a6
	rts
