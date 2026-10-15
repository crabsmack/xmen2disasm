; ---------------------------------------------------------------------------
; sub_1F4A1A
; ---------------------------------------------------------------------------
sub_1F4A1A:
	movea.l	g_ObjTable(a5),a0
	moveq	#$2,d0
	move.w	g_ObjCount(a5),d1
	sub.w	d0,d1
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a0
loc_1F4A2C:
	movea.l	(a0)+,a1
	tst.w	$4(a1)
	beq.s	loc_1F4A3C
	dbra	d1,loc_1F4A2C
	moveq	#$0,d0
	rts
loc_1F4A3C:
	move.l	a1,d0
	rts
