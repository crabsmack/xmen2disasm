; ---------------------------------------------------------------------------
; XClimber_ClassifySeg - XCLIMBER slot +$F2: what kind of grab a touched segment allows: 0 none, 1 ceiling, 2 / 3 wall on one side / the other
; In:  8(a6) = player, $C(a6) = segment
; Out: d0 = grab kind
; Evidence: segment type byte +1: 1 -> 2 and 2 -> 3 when the wall is >= $3E px tall, 4 -> 1 when > $3D px long, $13 (block) by which side the player's box is on, else 0
; ---------------------------------------------------------------------------
XClimber_ClassifySeg:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	$C(a4),d0
	ext.l	d0
	move.w	$8(a4),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.w	$E(a4),d0
	ext.l	d0
	move.w	$A(a4),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F3DF2
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_1F3DF8
loc_1F3DF2:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_1F3DF8:
	move.w	d0,d6
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F3E08
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1F3E0E
loc_1F3E08:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1F3E0E:
	move.w	d0,d7
	move.l	a4,d0
	bne.s	loc_1F3E1A
	moveq	#$0,d0
	bra.w	loc_1F3EB6
loc_1F3E1A:
	move.b	$1(a4),d0
	subq.b	#$1,d0
	beq.s	loc_1F3E4A
	subq.b	#$1,d0
	beq.s	loc_1F3E58
	subq.b	#$1,d0
	beq.s	loc_1F3E36
	subq.b	#$1,d0
	beq.s	loc_1F3E3A
	subi.b	#$F,d0
	beq.s	loc_1F3E66
	bra.s	loc_1F3EB4
loc_1F3E36:
	moveq	#$0,d0
	bra.s	loc_1F3EB6
loc_1F3E3A:
	cmpi.w	#$3E,d6
	slt.b	d3
	neg.b	d3
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_1F3EB6
loc_1F3E4A:
	cmpi.w	#$3E,d7
	bge.s	loc_1F3E54
	moveq	#$0,d0
	bra.s	loc_1F3EB6
loc_1F3E54:
	moveq	#$2,d0
	bra.s	loc_1F3EB6
loc_1F3E58:
	cmpi.w	#$3E,d7
	bge.s	loc_1F3E62
	moveq	#$0,d0
	bra.s	loc_1F3EB6
loc_1F3E62:
	moveq	#$3,d0
	bra.s	loc_1F3EB6
loc_1F3E66:
	move.w	$4E(a3),d0
	cmp.w	$C(a4),d0
	blt.s	loc_1F3E7E
	cmpi.w	#$3E,d7
	bge.s	loc_1F3E7A
	moveq	#$0,d0
	bra.s	loc_1F3EB6
loc_1F3E7A:
	moveq	#$2,d0
	bra.s	loc_1F3EB6
loc_1F3E7E:
	move.w	$52(a3),d0
	cmp.w	$8(a4),d0
	bgt.s	loc_1F3E96
	cmpi.w	#$3E,d7
	bge.s	loc_1F3E92
	moveq	#$0,d0
	bra.s	loc_1F3EB6
loc_1F3E92:
	moveq	#$3,d0
	bra.s	loc_1F3EB6
loc_1F3E96:
	move.w	$4C(a3),d0
	cmp.w	$E(a4),d0
	blt.s	loc_1F3EB0
	cmpi.w	#$3E,d6
	slt.b	d3
	neg.b	d3
	seq.b	d0
	andi.w	#$1,d0
	bra.s	loc_1F3EB6
loc_1F3EB0:
	moveq	#$0,d0
	bra.s	loc_1F3EB6
loc_1F3EB4:
	moveq	#$0,d0
loc_1F3EB6:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
