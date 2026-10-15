; ---------------------------------------------------------------------------
; Obj_SnapToNearestFloor - stand an object on the nearest flat floor (types $13-$1C or a level segment) of a type, at a position along it (negative = from the far end)
; In:  8(a6) = object  $E(a6) = word type  $12(a6) = word position (-1 = from x/y)
; Out: none
; Evidence: distance = |y - y1| + horizontal distance outside x1..x2; then like Obj_SnapToNearestSeg; caller Blast_Init
; ---------------------------------------------------------------------------
Obj_SnapToNearestFloor:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	#$4E20,-$2(a6)
	movea.l	$8(a6),a0
	move.l	$8(a0),d5
	asr.l	#$8,d5
	move.l	$C(a0),d4
	asr.l	#$8,d4
	lea.l	g_Segs(a5),a4
	moveq	#$0,d0
	movea.l	d0,a3
	moveq	#$0,d6
	lea.l	g_Segs(a5),a4
	bra.w	loc_1F804C
loc_1F7F68:
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,d7
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.w	loc_1F8044
	move.w	$E(a6),d0
	ext.l	d0
	cmp.l	d0,d7
	beq.s	loc_1F7FB6
	cmpi.w	#$3E9,$E(a6)
	beq.s	loc_1F7FB6
	cmpi.w	#$3E8,$E(a6)
	bne.w	loc_1F8044
	moveq	#$21,d0
	cmp.l	d7,d0
	beq.s	loc_1F7FB6
	moveq	#$22,d0
	cmp.l	d7,d0
	beq.s	loc_1F7FB6
	moveq	#$23,d0
	cmp.l	d7,d0
	beq.s	loc_1F7FB6
	moveq	#$24,d0
	cmp.l	d7,d0
	bne.w	loc_1F8044
loc_1F7FB6:
	moveq	#$13,d0
	cmp.b	$1(a4),d0
	bgt.s	loc_1F7FC6
	moveq	#$1C,d0
	cmp.b	$1(a4),d0
	bge.s	loc_1F7FD0
loc_1F7FC6:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	bne.s	loc_1F8044
loc_1F7FD0:
	ext.l	d4
	move.w	$A(a4),d0
	ext.l	d0
	move.l	d4,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7FF0
	ext.l	d4
	move.w	$A(a4),d0
	ext.l	d0
	move.l	d4,d1
	sub.l	d0,d1
	bra.s	loc_1F7FFE
loc_1F7FF0:
	ext.l	d4
	move.w	$A(a4),d0
	ext.l	d0
	move.l	d4,d1
	sub.l	d0,d1
	neg.l	d1
loc_1F7FFE:
	cmp.w	$8(a4),d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F8014
	move.w	$8(a4),d0
	ext.l	d0
	ext.l	d5
	sub.l	d5,d0
	bra.s	loc_1F8030
loc_1F8014:
	cmp.w	$C(a4),d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F8022
	moveq	#$0,d0
	bra.s	loc_1F8030
loc_1F8022:
	ext.l	d5
	move.w	$C(a4),d0
	ext.l	d0
	move.l	d5,d2
	sub.l	d0,d2
	move.l	d2,d0
loc_1F8030:
	add.w	d1,d0
	move.w	d0,-$4(a6)
	cmp.w	-$2(a6),d0
	bge.s	loc_1F8044
	move.w	-$4(a6),-$2(a6)
	movea.l	a4,a3
loc_1F8044:
	move.l	d6,d0
	addq.l	#$1,d6
	lea.l	$14(a4),a4
loc_1F804C:
	move.w	g_SegHighWater(a5),d0
	ext.l	d0
	cmp.l	d6,d0
	bge.w	loc_1F7F68
	move.l	a3,d0
	beq.s	loc_1F80BE
	movea.l	$8(a6),a0
	andi.w	#$EFFF,$4(a0)
	move.l	a3,$76(a0)
	moveq	#-$1,d0
	cmp.w	$12(a6),d0
	bne.s	loc_1F8080
	move.l	$8(a6),-(a7)
	move.l	a3,-(a7)
	jsr	Seg_ComputeObjPos(pc)
	addq.w	#$8,a7
	bra.s	loc_1F80AC
loc_1F8080:
	tst.w	$12(a6)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F8092
	move.w	$12(a6),d0
	ext.l	d0
	bra.s	loc_1F80A2
loc_1F8092:
	move.w	$6(a3),d0
	ext.l	d0
	move.w	$12(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d0
loc_1F80A2:
	lsl.l	#$8,d0
	movea.l	$8(a6),a0
	move.l	d0,$72(a0)
loc_1F80AC:
	move.l	$8(a6),-(a7)
	jsr	Seg_ApplyObjPos(pc)
	move.l	$8(a6),-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$8,a7
loc_1F80BE:
	move.l	a4,d0
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
