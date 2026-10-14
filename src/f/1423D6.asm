; ---------------------------------------------------------------------------
; sub_1423D6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1423D6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A2(a4),d0
	subq.w	#$1,$A2(a4)
	tst.w	d0
	bne.s	loc_1423FA
	move.l	$90(a4),$5C(a4)
	move.w	$98(a4),$6C(a4)
	bra.s	loc_142414
loc_1423FA:
	move.w	$A4(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	$A6(a4),$6C(a4)
	addq.w	#$8,a7
loc_142414:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
