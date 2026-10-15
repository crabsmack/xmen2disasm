; ---------------------------------------------------------------------------
; FloatBio_Init_Tail - FloatBio_Init common tail: start the chosen script at entry 0
; In:  inside FloatBio_Init
; Out: -
; Evidence: 2 branch sources
; ---------------------------------------------------------------------------
FloatBio_Init_Tail:
	tst.l	$98(a4)
	bne.s	loc_11DC0C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11DC28
loc_11DC0C:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11DC28:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
