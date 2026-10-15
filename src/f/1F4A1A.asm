; ---------------------------------------------------------------------------
; Obj_FindFreeSlot - find an unused object in the object table (flags word 0), skipping the two player slots
; In:  none
; Out: d0 = object pointer or 0
; Evidence: walks g_ObjTable from entry 2 for g_ObjCount-2 entries, returns the first with +4 = 0
; ---------------------------------------------------------------------------
Obj_FindFreeSlot:
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
