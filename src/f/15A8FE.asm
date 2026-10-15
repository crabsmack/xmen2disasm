; ---------------------------------------------------------------------------
; Seg_FindBelow - find the nearest in-use floor segment below a point, scanning grid cells downward
; In:  8(a6) = word: x   $C(a6) = word: y   $10(a6) = word: max layer
; Out: d0 = segment record, 0 if none
; Evidence: like Seg_FindAt but keeps the smallest positive top - y (start 5000) and steps y by 1 << -$3480 to the next cell until one is found or the cell repeats; callers include Brood_Init, DropBomb_Init, Deathbird_StateLandOnSwitch
; ---------------------------------------------------------------------------
Seg_FindBelow:
	link.w	a6,#$FFF2
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Seg_GridCell(pc)
	move.w	d0,-$E(a6)
	move.w	#$1388,-$6(a6)
	moveq	#$0,d0
	movea.l	d0,a4
	move.l	d0,-$4(a6)
	move.w	$E(a6),-$8(a6)
	addq.w	#$8,a7
loc_15A934:
	movea.l	g_SegGridPool(a5),a0
	move.w	-$E(a6),d0
	lea.l	(a0,d0.w),a3
	move.w	-$E(a6),-$C(a6)
	move.b	(a3),d4
	bra.w	loc_15A9D2
loc_15A94C:
	moveq	#$0,d0
	move.b	d4,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$8(a4),d5
	move.w	$C(a4),d6
	cmp.w	d5,d6
	bge.s	loc_15A976
	move.w	$C(a4),d5
	move.w	$8(a4),d6
loc_15A976:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_15A98A
	move.w	$A(a4),d0
	bra.s	loc_15A98E
loc_15A98A:
	move.w	$E(a4),d0
loc_15A98E:
	move.w	d0,d7
	move.w	d7,-$A(a6)
	sub.w	$E(a6),d7
	tst.w	d7
	ble.s	loc_15A9CE
	move.b	$2(a4),d0
	ext.w	d0
	cmp.w	$12(a6),d0
	bgt.s	loc_15A9CE
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_15A9CE
	cmp.w	$A(a6),d5
	bgt.s	loc_15A9CE
	cmp.w	$A(a6),d6
	blt.s	loc_15A9CE
	cmp.w	-$6(a6),d7
	bge.s	loc_15A9CE
	move.l	a4,-$4(a6)
	move.w	d7,-$6(a6)
loc_15A9CE:
	addq.w	#$1,a3
	move.b	(a3),d4
loc_15A9D2:
	moveq	#$0,d0
	move.b	d4,d0
	cmpi.w	#$FF,d0
	bne.w	loc_15A94C
	move.w	g_SegGridShiftY(a5),d0
	moveq	#$1,d1
	lsl.l	d0,d1
	add.w	d1,-$8(a6)
	move.w	-$8(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Seg_GridCell(pc)
	move.w	d0,-$E(a6)
	cmp.w	-$C(a6),d0
	addq.w	#$8,a7
	beq.s	loc_15AA12
	tst.l	-$4(a6)
	beq.w	loc_15A934
loc_15AA12:
	move.l	-$4(a6),d0
	movem.l	-$2A(a6),d3-d7/a3-a4
	unlk	a6
	rts
