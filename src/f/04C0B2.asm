; ---------------------------------------------------------------------------
; sub_04C0B2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C0B2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFEF,$8C(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$A4(a4)
	bne.s	loc_04C0E0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04C10C
loc_04C0E0:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04C0F4
	clr.w	$A2(a4)
loc_04C0F4:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04C10C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
