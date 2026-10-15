; ---------------------------------------------------------------------------
; MagnetoBoss_DirFromTo - direction code from object B's box centre to object A's (0-9: compass sectors with the 2:1 rule)
; In:  8(a6) = object A, $C(a6) = object B
; Out: d0.w = direction (2 right / 7 left when mostly horizontal, 0/9 up, 4/5 down, 1/8 and 3/6 diagonals)
; Evidence: box centres +$4C..+$52; used by MagnetoBoss_StateAimShoot to pick the globe direction
; ---------------------------------------------------------------------------
MagnetoBoss_DirFromTo:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.w	$52(a3),d0
	ext.l	d0
	move.w	$4E(a3),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	move.l	d1,d6
	sub.l	d2,d6
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	sub.l	d2,d1
	move.l	d1,-$4(a6)
	move.l	d6,d4
	move.l	-$4(a6),d5
	tst.l	d4
	bge.s	loc_036B9E
	move.l	d4,d0
	neg.l	d0
	move.l	d0,d4
loc_036B9E:
	tst.l	d5
	bge.s	loc_036BA8
	move.l	d5,d0
	neg.l	d0
	move.l	d0,d5
loc_036BA8:
	move.l	d4,d0
	asr.l	#$1,d0
	cmp.l	d0,d5
	bge.s	loc_036BBC
	tst.l	d6
	ble.s	loc_036BB8
	moveq	#$2,d7
	bra.s	loc_036BFE
loc_036BB8:
	moveq	#$7,d7
	bra.s	loc_036BFE
loc_036BBC:
	move.l	d5,d0
	asr.l	#$1,d0
	cmp.l	d0,d4
	bge.s	loc_036BE2
	tst.l	-$4(a6)
	ble.s	loc_036BD6
	tst.l	d6
	ble.s	loc_036BD2
	moveq	#$4,d7
	bra.s	loc_036BFE
loc_036BD2:
	moveq	#$5,d7
	bra.s	loc_036BFE
loc_036BD6:
	tst.l	d6
	ble.s	loc_036BDE
	clr.w	d7
	bra.s	loc_036BFE
loc_036BDE:
	moveq	#$9,d7
	bra.s	loc_036BFE
loc_036BE2:
	tst.l	-$4(a6)
	ble.s	loc_036BF4
	tst.l	d6
	ble.s	loc_036BF0
	moveq	#$3,d7
	bra.s	loc_036BFE
loc_036BF0:
	moveq	#$6,d7
	bra.s	loc_036BFE
loc_036BF4:
	tst.l	d6
	ble.s	loc_036BFC
	moveq	#$1,d7
	bra.s	loc_036BFE
loc_036BFC:
	moveq	#$8,d7
loc_036BFE:
	move.w	d7,d0
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
