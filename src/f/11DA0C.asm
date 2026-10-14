; ---------------------------------------------------------------------------
; loc_11DA0C
; ---------------------------------------------------------------------------
loc_11DA0C:
	lea.l	$300A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	tst.l	$98(a4)
	bne.s	loc_11DA30
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11DA4C
loc_11DA30:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11DA4C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
