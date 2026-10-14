; ---------------------------------------------------------------------------
; sub_11CB5C	[jt 1581]
; ---------------------------------------------------------------------------
sub_11CB5C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2FD2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_11CB88
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11CBB4
loc_11CB88:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11CB9C
	clr.w	$96(a4)
loc_11CB9C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11CBB4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
