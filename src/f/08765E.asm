; ---------------------------------------------------------------------------
; sub_08765E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_08765E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d7
	tst.b	-$38DE(a5)
	beq.s	loc_087674
	lsl.w	#$1,d7
loc_087674:
	moveq	#$A,d0
	cmp.w	$8C(a4),d0
	ble.s	loc_08769E
	add.w	d7,$8C(a4)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,-$3C44(a5)
	clr.w	$6C(a4)
	lea.l	sub_08765E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0876B0
loc_08769E:
	clr.w	$6C(a4)
	lea.l	sub_0876BA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0876B0:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
