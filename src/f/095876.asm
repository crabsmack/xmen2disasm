; ---------------------------------------------------------------------------
; sub_095876	[link-after-rts]
; ---------------------------------------------------------------------------
sub_095876:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	ble.s	loc_0958AE
	tst.w	$20(a4)
	bne.s	loc_09589A
	move.w	#$C0,$20(a4)
loc_09589A:
	clr.w	$6C(a4)
	lea.l	sub_095876(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0958EE
loc_0958AE:
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	andi.w	#$BFFF,$6(a4)
	tst.l	$98(a4)
	bne.s	loc_0958D2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0958EE
loc_0958D2:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0958EE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
