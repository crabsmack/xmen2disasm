; ---------------------------------------------------------------------------
; Cam_SpringAxis - camera helper: move a camera coordinate toward the dead-zone edge with an accelerating velocity (8.8) capped at a maximum
; In:  8(a6) = word target, $C(a6) = word previous target, $10/$14(a6) = words box low/high edge, $18(a6) = word max step, $1C(a6) = word max speed, $20..$2C(a6) = pointers camera coord, 8.8 accumulator, velocity, acceleration
; Out: none
; Evidence: accumulator and velocity reset and acceleration sign flipped when the target reverses; used by Cam_TrackPlayer for x and for y in mid-air
; ---------------------------------------------------------------------------
Cam_SpringAxis:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$A(a6),d6
	move.w	$1E(a6),d4
	movea.l	$2C(a6),a3
	movea.l	$24(a6),a4
	ext.l	d6
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d6,d7
	sub.l	d0,d7
	tst.w	d7
	beq.w	loc_161364
	tst.w	d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_161262
	ext.l	d6
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	bra.s	loc_16126E
loc_161262:
	ext.l	d6
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
loc_16126E:
	move.w	d1,d5
	movea.l	$20(a6),a0
	move.w	d5,d6
	sub.w	(a0),d6
	tst.w	d6
	ble.s	loc_1612F6
	tst.w	(a4)
	bge.s	loc_16129A
	clr.w	(a4)
	movea.l	$28(a6),a0
	clr.w	(a0)
	tst.w	(a3)
	bge.w	loc_161364
	move.w	(a3),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,(a3)
	bra.w	loc_161364
loc_16129A:
	tst.w	d7
	ble.w	loc_161364
	add.w	$1A(a6),d7
	cmp.w	d7,d6
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1612B0
	move.w	d7,d0
	bra.s	loc_1612B2
loc_1612B0:
	move.w	d6,d0
loc_1612B2:
	move.w	d0,-$4(a6)
	movea.l	$28(a6),a0
	move.w	(a3),d5
	add.w	(a0),d5
	cmp.w	d5,d4
	bge.s	loc_1612C4
	move.w	d4,d5
loc_1612C4:
	movea.l	$28(a6),a0
	move.w	d5,(a0)
	add.w	d5,(a4)
	move.w	(a4),d0
	asr.w	#$8,d0
	move.w	d0,-$2(a6)
	cmp.w	-$4(a6),d0
	ble.s	loc_1612EA
	move.w	-$4(a6),-$2(a6)
	move.w	-$4(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.w	d0,(a4)
loc_1612EA:
	movea.l	$20(a6),a0
	move.w	-$2(a6),d0
	add.w	d0,(a0)
	bra.s	loc_161364
loc_1612F6:
	tst.w	(a4)
	ble.s	loc_161310
	clr.w	(a4)
	movea.l	$28(a6),a0
	clr.w	(a0)
	tst.w	(a3)
	ble.s	loc_161364
	move.w	(a3),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,(a3)
	bra.s	loc_161364
loc_161310:
	tst.w	d7
	bge.s	loc_161364
	sub.w	$1A(a6),d7
	cmp.w	d7,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_161324
	move.w	d7,d0
	bra.s	loc_161326
loc_161324:
	move.w	d6,d0
loc_161326:
	move.w	d0,d5
	movea.l	$28(a6),a0
	move.w	(a3),d6
	add.w	(a0),d6
	ext.l	d6
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
	cmp.l	d6,d0
	ble.s	loc_161344
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
	move.w	d0,d6
loc_161344:
	movea.l	$28(a6),a0
	move.w	d6,(a0)
	add.w	d6,(a4)
	move.w	(a4),d4
	asr.w	#$8,d4
	cmp.w	d4,d5
	ble.s	loc_16135E
	move.w	d5,d4
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.w	d0,(a4)
loc_16135E:
	movea.l	$20(a6),a0
	add.w	d4,(a0)
loc_161364:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
