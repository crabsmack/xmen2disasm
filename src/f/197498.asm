; ---------------------------------------------------------------------------
; sub_197498	[link-after-rts]
; ---------------------------------------------------------------------------
sub_197498:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	beq.s	loc_1974B0
	cmpi.w	#$8C,$48(a4)
	ble.s	loc_1974E6
loc_1974B0:
	tst.b	$9D(a4)
	bne.s	loc_1974C6
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1974D4
loc_1974C6:
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1974D4:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1974E6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
