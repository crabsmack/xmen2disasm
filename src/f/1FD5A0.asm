; ---------------------------------------------------------------------------
; loc_1FD5A0
; ---------------------------------------------------------------------------
loc_1FD5A0:
	cmpi.w	#$60,d6
	blt.s	loc_1FD5E8
	cmpi.w	#$1C0,d6
	bgt.s	loc_1FD5E8
	cmpi.w	#$60,d5
	blt.s	loc_1FD5E8
	cmpi.w	#$160,d5
	bgt.s	loc_1FD5E8
	moveq	#$0,d0
	movea.l	-$1FE6(a5),a0
	move.b	$3(a0),d0
	cmpi.w	#$50,d0
	beq.s	loc_1FD610
	move.w	d0,-$1FE2(a5)
	move.b	d0,d1
	addq.w	#$1,d1
	asl.w	#$3,d0
	lea.l	g_SpriteTable(a5),a0
	adda.w	d0,a0
	move.l	a0,-$1FE6(a5)
	move.w	d5,(a0)+
	move.w	d1,(a0)+
	move.w	d7,(a0)+
	move.w	d6,(a0)
	addq.w	#$1,-$2(a6)
loc_1FD5E8:
	add.w	d2,d7
	lea.l	$20(a2),a2
	subq.w	#$4,d4
	beq.s	loc_1FD5F6
	bpl.w	loc_1FD566
loc_1FD5F6:
	lea.l	$20(a1),a1
	subq.w	#$4,d3
	beq.s	loc_1FD602
	bpl.w	loc_1FD550
loc_1FD602:
	move.w	-$2(a6),d0
	movem.l	-$24(a6),d2-d7/a2-a3
	unlk	a6
	rts
loc_1FD610:
	move.w	#$FFFF,d0
	movem.l	-$24(a6),d2-d7/a2-a3
	unlk	a6
	rts
