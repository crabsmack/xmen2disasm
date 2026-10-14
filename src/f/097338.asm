; ---------------------------------------------------------------------------
; sub_097338	[jt 750]
; ---------------------------------------------------------------------------
sub_097338:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	beq.s	loc_09736C
	move.l	a3,-(a7)
	jsr	$33AA(a5)	; -> sub_11F4C0
	lea.l	$33D2(a5),a0
	move.l	a0,$A2(a3)
	clr.w	$A6(a3)
	move.w	#$900,$A8(a3)
	move.w	#$A,$AA(a3)
	addq.w	#$4,a7
loc_09736C:
	tst.l	$98(a4)
	bne.s	loc_09737E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0973AA
loc_09737E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097392
	clr.w	$96(a4)
loc_097392:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0973AA:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
