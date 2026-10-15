; ---------------------------------------------------------------------------
; Hologram_FindLifts - find the two active COREELEVATOR objects and store the upper one at +$96, the lower at +$9A
; In:  8(a6) = this
; Out: d0
; Evidence: scans the object table $FFCD5A for Tbl_CoreElevator_vtable, compares y (+$C)
; ---------------------------------------------------------------------------
Hologram_FindLifts:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-$4(a6)
	movea.l	d0,a3
	clr.w	d7
	movea.l	g_ObjTable(a5),a0
	movea.l	(a0),a4
	bra.s	loc_0E9AEC
loc_0E9AA6:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0E9ADC
	lea.l	$2902(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0E9ADC
	tst.l	-$4(a6)
	bne.s	loc_0E9AD6
	move.l	a4,-$4(a6)
	bra.s	loc_0E9ADC
loc_0E9AD6:
	move.l	a3,d0
	bne.s	loc_0E9ADC
	movea.l	a4,a3
loc_0E9ADC:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_0E9AEC:
	cmp.w	g_ObjCount(a5),d7
	blt.s	loc_0E9AA6
	tst.l	-$4(a6)
	beq.s	loc_0E9B24
	move.l	a3,d0
	beq.s	loc_0E9B24
	movea.l	-$4(a6),a0
	move.l	$C(a0),d0
	cmp.l	$C(a3),d0
	ble.s	loc_0E9B12
	movea.l	a0,a4
	move.l	a3,-$4(a6)
	movea.l	a4,a3
loc_0E9B12:
	movea.l	$8(a6),a0
	move.l	-$4(a6),$96(a0)
	movea.l	$8(a6),a0
	move.l	a3,$9A(a0)
loc_0E9B24:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
