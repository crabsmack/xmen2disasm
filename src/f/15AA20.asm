; ---------------------------------------------------------------------------
; sub_15AA20	[jt 2012]
; ---------------------------------------------------------------------------
sub_15AA20:
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
loc_15AA56:
	movea.l	-$3478(a5),a0
	move.w	-$E(a6),d0
	lea.l	(a0,d0.w),a3
	move.w	-$E(a6),-$C(a6)
	move.b	(a3),d4
	bra.w	loc_15AAF6
loc_15AA6E:
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
	bge.s	loc_15AA98
	move.w	$C(a4),d5
	move.w	$8(a4),d6
loc_15AA98:
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_15AAAC
	move.w	$A(a4),d0
	bra.s	loc_15AAB0
loc_15AAAC:
	move.w	$E(a4),d0
loc_15AAB0:
	move.w	d0,-$A(a6)
	move.w	$E(a6),d7
	sub.w	-$A(a6),d7
	tst.w	d7
	ble.s	loc_15AAF2
	move.b	$2(a4),d0
	ext.w	d0
	cmp.w	$12(a6),d0
	bgt.s	loc_15AAF2
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_15AAF2
	cmp.w	$A(a6),d5
	bgt.s	loc_15AAF2
	cmp.w	$A(a6),d6
	blt.s	loc_15AAF2
	cmp.w	-$6(a6),d7
	bge.s	loc_15AAF2
	move.l	a4,-$4(a6)
	move.w	d7,-$6(a6)
loc_15AAF2:
	addq.w	#$1,a3
	move.b	(a3),d4
loc_15AAF6:
	moveq	#$0,d0
	move.b	d4,d0
	cmpi.w	#$FF,d0
	bne.w	loc_15AA6E
	move.w	-$3480(a5),d0
	moveq	#$1,d1
	lsl.l	d0,d1
	sub.w	d1,-$8(a6)
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
	beq.s	loc_15AB36
	tst.l	-$4(a6)
	beq.w	loc_15AA56
loc_15AB36:
	move.l	-$4(a6),d0
	movem.l	-$2A(a6),d3-d7/a3-a4
	unlk	a6
	rts
