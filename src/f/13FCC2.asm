; ---------------------------------------------------------------------------
; Spark_Draw - Spark: position/draw the object's sprite relative to the camera (class slot 5, +$1A)
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of class descriptor $1400DE (name string "SPARK", parent ACTOR)
; ---------------------------------------------------------------------------
Spark_Draw:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	movea.l	$30(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$20,d0
	beq.s	loc_13FD16
	move.l	a4,-(a7)
	lea.l	$3BB2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_13FD98
loc_13FD16:
	subq.w	#$4,d6
	subq.w	#$8,d7
	move.w	$34(a4),d0
	ext.l	d0
	moveq	#$0,d1
	move.b	$2F(a4),d1
	lsl.l	#$2,d1
	add.l	d0,d1
	moveq	#$3,d0
	and.b	$2E(a4),d0
	moveq	#$0,d2
	move.b	d0,d2
	moveq	#$D,d0
	lsl.l	d0,d2
	move.l	d2,d5
	or.l	d1,d5
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_13FD48
	moveq	#$1,d0
	bra.s	loc_13FD4A
loc_13FD48:
	moveq	#$0,d0
loc_13FD4A:
	beq.s	loc_13FD50
	ori.w	#$8000,d5
loc_13FD50:
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
	move.b	#$5,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	d5,$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	-$1FE6(a5),a0
	move.w	d0,$6(a0)
loc_13FD98:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
