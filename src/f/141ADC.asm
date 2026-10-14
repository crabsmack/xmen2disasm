; ---------------------------------------------------------------------------
; sub_141ADC	[jt 1916]
; ---------------------------------------------------------------------------
sub_141ADC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$96(a4)
	bne.s	loc_141B06
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_141B34
loc_141B06:
	addq.w	#$1,$94(a4)
	movea.l	$96(a4),a0
	move.w	$94(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_141B1A
	clr.w	$94(a4)
loc_141B1A:
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_141B34:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
