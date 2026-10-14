; ---------------------------------------------------------------------------
; sub_133F62	[jt 1740]
; ---------------------------------------------------------------------------
sub_133F62:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$368A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	sub_1340D0(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_1340D0(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$83,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_133FE6
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_133FDE
	ori.b	#$4,$2E(a4)
	bra.s	loc_13402C
loc_133FDE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_13402C
loc_133FE6:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_134016
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_13400E
	ori.b	#$4,$2E(a4)
	bra.s	loc_13402C
loc_13400E:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_13402C
loc_134016:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_134026
	ori.b	#$4,$2E(a4)
	bra.s	loc_13402C
loc_134026:
	andi.b	#$FB,$2E(a4)
loc_13402C:
	move.w	$6(a3),d7
	beq.s	loc_134036
	move.w	d7,d0
	bra.s	loc_134038
loc_134036:
	moveq	#$78,d0
loc_134038:
	move.w	d0,$8C(a4)
	move.w	$8(a3),d7
	moveq	#$0,d3
	tst.w	d7
	blt.s	loc_13404E
	cmpi.w	#$3,d7
	bge.s	loc_13404E
	moveq	#$1,d3
loc_13404E:
	tst.b	d3
	beq.s	loc_134056
	move.w	d7,d0
	bra.s	loc_134058
loc_134056:
	moveq	#$0,d0
loc_134058:
	move.w	d0,$8E(a4)
	tst.w	$A(a3)
	seq.b	d3
	neg.b	d3
	beq.s	loc_13406A
	moveq	#$1,d0
	bra.s	loc_13406C
loc_13406A:
	moveq	#$0,d0
loc_13406C:
	move.b	d0,$90(a4)
	moveq	#$0,d0
	move.l	d0,$92(a4)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
