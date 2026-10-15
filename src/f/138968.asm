; ---------------------------------------------------------------------------
; LineSegKiller_KillAll - Kill every live LINESEGKILLER object (each removes its segments as it dies)
; In:  none
; Out: none
; Evidence: scans g_ObjTable for objects with flag $8000 and descriptor Tbl_LineSegKiller_vtable, calls vtable +$52 Kill; only caller BroodClaw_Swing (jt 1822), TAS frame 52125
; ---------------------------------------------------------------------------
LineSegKiller_KillAll:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	clr.w	d7
	clr.w	d7
	movea.l	g_ObjTable(a5),a0
	movea.l	(a0),a4
	bra.s	loc_1389B2
loc_13897C:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_1389A2
	lea.l	$391A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1389A2
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1389A2:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_1389B2:
	cmp.w	g_ObjCount(a5),d7
	blt.s	loc_13897C
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
