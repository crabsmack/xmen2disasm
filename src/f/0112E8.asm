; ---------------------------------------------------------------------------
; sub_0112E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0112E8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFFD,$6(a4)
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$84(a4)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_01131A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_011346
loc_01131A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_01132E
	clr.w	$96(a4)
loc_01132E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_011346:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
