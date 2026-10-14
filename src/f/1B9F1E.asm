; ---------------------------------------------------------------------------
; sub_1B9F1E	[jt 2241]
; ---------------------------------------------------------------------------
sub_1B9F1E:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$1E(a6),d4
	move.w	$1A(a6),d5
	move.b	$13(a6),d6
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.b	d7
	move.b	d6,d0
	subi.b	#$D,d0
	beq.s	loc_1B9F4E
	subq.b	#$1,d0
	beq.s	loc_1B9F58
	subq.b	#$1,d0
	beq.s	loc_1B9F62
	bra.s	loc_1B9F6A
loc_1B9F4E:
	move.b	#$2,$70(a4)
	moveq	#$1,d7
	bra.s	loc_1B9F6A
loc_1B9F58:
	move.b	#$2,$70(a4)
	moveq	#$1,d7
	bra.s	loc_1B9F6A
loc_1B9F62:
	move.b	#$4,$70(a4)
	moveq	#$1,d7
loc_1B9F6A:
	tst.b	d7
	beq.s	loc_1B9FAC
	move.w	#$100,d0
	and.w	$6(a3),d0
	beq.s	loc_1B9FDE
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.b	$70(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	lea.l	$2BAA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.s	loc_1B9FDE
loc_1B9FAC:
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.b	$70(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	lea.l	$2BAA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_1B9FDE:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
