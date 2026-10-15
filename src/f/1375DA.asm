; ---------------------------------------------------------------------------
; HornetBullet_Draw - HornetBullet: position/draw the object's sprite relative to the camera (class slot 5, +$1A)
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of class descriptor $137708 (name string "HORNETBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
HornetBullet_Draw:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_137606
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_137606
	moveq	#$1,d3
loc_137606:
	tst.b	d3
	beq.s	loc_137622
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_137632
loc_137622:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_137632:
	move.l	d1,d6
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_137654
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_137654
	moveq	#$1,d3
loc_137654:
	tst.b	d3
	beq.s	loc_137670
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_137680
loc_137670:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_137680:
	move.l	d1,d7
	move.w	$34(a4),d0
	ext.l	d0
	move.l	#$A000,d5
	or.l	d0,d5
	tst.w	$16(a4)
	bge.s	loc_13769C
	ori.l	#$800,d5
loc_13769C:
	moveq	#-$8,d0
	cmp.l	d6,d0
	bge.s	loc_1376FE
	cmpi.l	#$140,d6
	bge.s	loc_1376FE
	moveq	#-$8,d0
	cmp.l	d7,d0
	bge.s	loc_1376FE
	cmpi.l	#$E0,d7
	bge.s	loc_1376FE
	lea.l	g_SpriteTable(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	d5,$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
loc_1376FE:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
