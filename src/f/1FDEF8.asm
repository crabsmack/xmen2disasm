; ---------------------------------------------------------------------------
; Math_SinDeg - sine of an angle in whole degrees, 16.16 fixed point
; In:  8(a6) = word: angle in degrees (any range, wrapped to 0..359)
; Out: d0 = long: sin(angle) * $10000 (90 -> $10000, 270 -> -$10000)
; Evidence: wraps by 360, quadrant folding into the 90-word quarter-wave table Tbl_SineQuarter ($1FDE36)
; ---------------------------------------------------------------------------
Math_SinDeg:
	moveq	#$0,d0
	move.w	$6(a7),d0
loc_1FDEFE:
	lea.l	Tbl_SineQuarter(pc),a0
	move.w	#$168,d1
	tst.w	d0
	bpl.s	loc_1FDF0E
loc_1FDF0A:
	add.w	d1,d0
	bmi.s	loc_1FDF0A
loc_1FDF0E:
	cmp.w	d1,d0
	blt.s	loc_1FDF18
loc_1FDF12:
	sub.w	d1,d0
	bpl.s	loc_1FDF12
	add.w	d1,d0
loc_1FDF18:
	tst.w	d0
	beq.s	loc_1FDF68
	cmpi.w	#$5A,d0
	beq.s	loc_1FDF5A
	blt.s	loc_1FDF3C
	cmpi.w	#$B4,d0
	beq.s	loc_1FDF68
	blt.s	loc_1FDF36
	cmpi.w	#$10E,d0
	beq.s	loc_1FDF60
	blt.s	loc_1FDF44
	bra.s	loc_1FDF4A
loc_1FDF36:
	neg.w	d0
	addi.w	#$B4,d0
loc_1FDF3C:
	add.w	d0,d0
	move.w	(a0,d0.w),d0
	rts
loc_1FDF44:
	subi.w	#$B4,d0
	bra.s	loc_1FDF50
loc_1FDF4A:
	neg.w	d0
	addi.w	#$168,d0
loc_1FDF50:
	add.w	d0,d0
	move.w	(a0,d0.w),d0
	neg.l	d0
	rts
loc_1FDF5A:
	moveq	#$1,d0
	swap	d0
	rts
loc_1FDF60:
	moveq	#$1,d0
	neg.w	d0
	swap	d0
	rts
loc_1FDF68:
	moveq	#$0,d0
	rts
