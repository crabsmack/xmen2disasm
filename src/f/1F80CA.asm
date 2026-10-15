; ---------------------------------------------------------------------------
; Seg_FindNearestOfType - find the in-use floor segment of a type nearest a point, scanning grid cells downward until a cell has one
; In:  $A(a6) = word x  $E(a6) = word y  $12(a6) = word type (1001 = any, 1000 = types $21-$24)
; Out: d0 = segment record or 0
; Evidence: Seg_GridCell, pool at -$3478 ($FFCD88); score = distance from y to the segment's mid-height (min 6 px tall) + horizontal distance outside x1..x2; steps y by the cell size (-$3480); callers Ninja_Init, Tusk_StateIntro, BigBio_StateStart, BioSentinel_StateStart
; ---------------------------------------------------------------------------
Seg_FindNearestOfType:
	link.w	a6,#$FFEE
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	#$4E20,-$E(a6)
	move.w	$E(a6),-$C(a6)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3EEA(a5)	; -> Seg_GridCell
	move.w	d0,-$A(a6)
	moveq	#$0,d0
	movea.l	d0,a4
	move.l	d0,-$4(a6)
	addq.w	#$8,a7
loc_1F8100:
	movea.l	g_SegGridPool(a5),a0
	move.w	-$A(a6),d0
	lea.l	(a0,d0.w),a3
	move.w	-$A(a6),-$8(a6)
	move.b	(a3),-$5(a6)
	bra.w	loc_1F827C
loc_1F811A:
	moveq	#$0,d0
	move.b	-$5(a6),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d7
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.w	loc_1F8276
	move.w	$12(a6),d0
	ext.l	d0
	cmp.l	d0,d7
	beq.s	loc_1F8180
	cmpi.w	#$3E9,$12(a6)
	beq.s	loc_1F8180
	cmpi.w	#$3E8,$12(a6)
	bne.w	loc_1F8276
	moveq	#$21,d0
	cmp.l	d7,d0
	beq.s	loc_1F8180
	moveq	#$22,d0
	cmp.l	d7,d0
	beq.s	loc_1F8180
	moveq	#$23,d0
	cmp.l	d7,d0
	beq.s	loc_1F8180
	moveq	#$24,d0
	cmp.l	d7,d0
	bne.w	loc_1F8276
loc_1F8180:
	move.w	$8(a4),d4
	move.w	$C(a4),-$12(a6)
	move.w	$A(a4),d6
	move.w	$E(a4),d5
	cmp.w	-$12(a6),d4
	ble.s	loc_1F81A8
	move.w	-$12(a6),d0
	eor.w	d0,d4
	eor.w	d4,-$12(a6)
	move.w	-$12(a6),d0
	eor.w	d0,d4
loc_1F81A8:
	cmp.w	d5,d6
	ble.s	loc_1F81B2
	eor.w	d5,d6
	eor.w	d6,d5
	eor.w	d5,d6
loc_1F81B2:
	move.w	-$12(a6),d0
	ext.l	d0
	ext.l	d4
	sub.l	d4,d0
	moveq	#$6,d1
	cmp.l	d0,d1
	ble.s	loc_1F81CC
	subq.w	#$3,d4
	move.w	d4,d0
	addq.w	#$6,d0
	move.w	d0,-$12(a6)
loc_1F81CC:
	ext.l	d5
	ext.l	d6
	move.l	d5,d0
	sub.l	d6,d0
	moveq	#$6,d1
	cmp.l	d0,d1
	ble.s	loc_1F81E0
	subq.w	#$3,d6
	move.w	d6,d5
	addq.w	#$6,d5
loc_1F81E0:
	ext.l	d6
	ext.l	d5
	move.l	d6,d0
	add.l	d5,d0
	asr.l	#$1,d0
	move.w	$E(a6),d1
	ext.l	d1
	sub.l	d1,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F820C
	ext.l	d6
	ext.l	d5
	move.l	d6,d0
	add.l	d5,d0
	asr.l	#$1,d0
	move.w	$E(a6),d1
	ext.l	d1
	sub.l	d1,d0
	bra.s	loc_1F8220
loc_1F820C:
	ext.l	d6
	ext.l	d5
	move.l	d6,d0
	add.l	d5,d0
	asr.l	#$1,d0
	move.w	$E(a6),d1
	ext.l	d1
	sub.l	d1,d0
	neg.l	d0
loc_1F8220:
	move.w	$A(a6),d1
	cmp.w	$8(a4),d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F823E
	move.w	$8(a4),d1
	ext.l	d1
	move.w	$A(a6),d2
	ext.l	d2
	sub.l	d2,d1
	bra.s	loc_1F825E
loc_1F823E:
	move.w	$A(a6),d1
	cmp.w	$C(a4),d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F8250
	moveq	#$0,d1
	bra.s	loc_1F825E
loc_1F8250:
	move.w	$A(a6),d1
	ext.l	d1
	move.w	$C(a4),d2
	ext.l	d2
	sub.l	d2,d1
loc_1F825E:
	add.w	d0,d1
	move.w	d1,d0
	move.w	d0,-$10(a6)
	cmp.w	-$E(a6),d0
	bge.s	loc_1F8276
	move.w	-$10(a6),-$E(a6)
	move.l	a4,-$4(a6)
loc_1F8276:
	addq.w	#$1,a3
	move.b	(a3),-$5(a6)
loc_1F827C:
	moveq	#$0,d0
	move.b	-$5(a6),d0
	cmpi.w	#$FF,d0
	bne.w	loc_1F811A
	move.w	g_SegGridShiftY(a5),d0
	moveq	#$1,d1
	lsl.l	d0,d1
	add.w	d1,-$C(a6)
	move.w	-$C(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3EEA(a5)	; -> Seg_GridCell
	move.w	d0,-$A(a6)
	cmp.w	-$8(a6),d0
	addq.w	#$8,a7
	beq.s	loc_1F82BE
	tst.l	-$4(a6)
	beq.w	loc_1F8100
loc_1F82BE:
	move.l	-$4(a6),d0
	movem.l	-$2E(a6),d3-d7/a3-a4
	unlk	a6
	rts
