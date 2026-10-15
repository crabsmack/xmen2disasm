; ---------------------------------------------------------------------------
; Actor_Kill - ACTOR slot +$52: destroy an object: detach it and its children, Deactivate if active, free its timer and release its spawn record
; In:  8(a6) = object
; Out: none
; Evidence: Obj_Detach; children via Obj_ForEachChildCall(obj, Obj_Detach); flags $C000 == $8000 -> vtable +$46 Deactivate; +4 = 0; Timer_Free(+$7C); spawn record (byte +$14, 14-byte records at ptr g_SpawnRecs): bit 1 cleared, +5 = $FF
; ---------------------------------------------------------------------------
Actor_Kill:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	addq.w	#$4,a7
	beq.s	loc_15E6DC
	pea.l	$4E7A(a5)
	move.l	a4,-(a7)
	jsr	$4E92(a5)	; -> Obj_ForEachChildCall
	addq.w	#$8,a7
loc_15E6DC:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15E700
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_15E700:
	clr.w	$4(a4)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	moveq	#$0,d1
	move.b	$14(a4),d1
	cmpi.w	#$FF,d1
	addq.w	#$4,a7
	beq.s	loc_15E764
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	g_SpawnRecs(a5),a0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	andi.b	#$FD,$4(a0,d0.l)
	moveq	#$0,d0
	move.b	$14(a4),d0
	movea.l	g_SpawnRecs(a5),a0
	move.l	d0,d1
	mulu.w	#$E,d0
	swap	d1
	mulu.w	#$E,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.b	#$FF,$5(a0,d0.l)
loc_15E764:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
