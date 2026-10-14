; ---------------------------------------------------------------------------
; sub_1425DE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1425DE:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	$A(a6),d6
	move.w	$E(a6),d7
	tst.w	d6
	blt.w	loc_14267A
	tst.w	d7
	blt.s	loc_142632
	cmp.w	d7,d6
	bgt.s	loc_142618
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	add.l	d6,d0
	cmp.l	d7,d0
	bgt.s	loc_142610
	move.w	#$13B,d0
	bra.w	loc_1426F4
loc_142610:
	move.w	#$E1,d0
	bra.w	loc_1426F4
loc_142618:
	ext.l	d7
	move.l	d7,d0
	add.l	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	bgt.s	loc_14262C
	move.w	#$87,d0
	bra.w	loc_1426F4
loc_14262C:
	moveq	#$2D,d0
	bra.w	loc_1426F4
loc_142632:
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	cmp.l	d7,d0
	bgt.s	loc_14265C
	ext.l	d7
	move.l	d7,d0
	add.l	d7,d0
	ext.l	d6
	move.l	d6,d1
	neg.l	d1
	cmp.l	d0,d1
	bgt.s	loc_142654
	moveq	#-$2D,d0
	bra.w	loc_1426F4
loc_142654:
	move.w	#$FF79,d0
	bra.w	loc_1426F4
loc_14265C:
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	ext.l	d6
	sub.l	d6,d0
	cmp.l	d7,d0
	bge.s	loc_142674
	move.w	#$FF1F,d0
	bra.w	loc_1426F4
loc_142674:
	move.w	#$FEC5,d0
	bra.s	loc_1426F4
loc_14267A:
	tst.w	d7
	blt.s	loc_1426C2
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	cmp.l	d7,d0
	bge.s	loc_1426A6
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	ext.l	d6
	sub.l	d6,d0
	cmp.l	d7,d0
	bge.s	loc_1426A0
	move.w	#$195,d0
	bra.s	loc_1426F4
loc_1426A0:
	move.w	#$1EF,d0
	bra.s	loc_1426F4
loc_1426A6:
	ext.l	d7
	move.l	d7,d0
	add.l	d7,d0
	ext.l	d6
	move.l	d6,d1
	neg.l	d1
	cmp.l	d0,d1
	bge.s	loc_1426BC
	move.w	#$249,d0
	bra.s	loc_1426F4
loc_1426BC:
	move.w	#$2A3,d0
	bra.s	loc_1426F4
loc_1426C2:
	cmp.w	d7,d6
	bge.s	loc_1426DE
	ext.l	d7
	move.l	d7,d0
	add.l	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	bge.s	loc_1426D8
	move.w	#$FD5D,d0
	bra.s	loc_1426F4
loc_1426D8:
	move.w	#$FDB7,d0
	bra.s	loc_1426F4
loc_1426DE:
	ext.l	d7
	ext.l	d6
	move.l	d6,d0
	add.l	d6,d0
	cmp.l	d7,d0
	bge.s	loc_1426F0
	move.w	#$FE11,d0
	bra.s	loc_1426F4
loc_1426F0:
	move.w	#$FE6B,d0
loc_1426F4:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
