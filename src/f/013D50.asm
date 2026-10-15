; ---------------------------------------------------------------------------
; sub_013D50	[jt 74]
; ---------------------------------------------------------------------------
sub_013D50:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$292(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_013D7C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_013DA8
loc_013D7C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_013D90
	clr.w	$96(a4)
loc_013D90:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_013DA8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
