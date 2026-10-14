; ---------------------------------------------------------------------------
; sub_13D574	[jt 1861]
; ---------------------------------------------------------------------------
sub_13D574:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A2(a4)
	bne.s	loc_13D5C6
	lea.l	$3AB2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_13D5A8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D604
loc_13D5A8:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D604
loc_13D5C6:
	tst.l	$98(a4)
	bne.s	loc_13D5D8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D604
loc_13D5D8:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D5EC
	clr.w	$96(a4)
loc_13D5EC:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_13D604:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
