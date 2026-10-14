; ---------------------------------------------------------------------------
; sub_0B703E	[jt 928]
; ---------------------------------------------------------------------------
sub_0B703E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$A0(a4)
	addq.w	#$8,a7
	bne.s	loc_0B706C
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_0B709A
loc_0B706C:
	addq.w	#$1,$9E(a4)
	movea.l	$A0(a4),a0
	move.w	$9E(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B7080
	clr.w	$9E(a4)
loc_0B7080:
	movea.l	$A0(a4),a0
	addq.l	#$2,a0
	move.w	$9E(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_0B709A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
