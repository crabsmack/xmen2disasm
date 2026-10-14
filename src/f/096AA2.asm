; ---------------------------------------------------------------------------
; sub_096AA2	[jt 743]
; ---------------------------------------------------------------------------
sub_096AA2:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FE).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($FE).w
	jsr	$521A(a5)	; -> sub_1FE584
	movea.l	$9C(a4),a3
	move.l	a3,d0
	addq.w	#$8,a7
	beq.s	loc_096ACE
	ori.w	#$200,$98(a3)
loc_096ACE:
	tst.l	$98(a4)
	bne.s	loc_096AE0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096B0C
loc_096AE0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096AF4
	clr.w	$96(a4)
loc_096AF4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_096B0C:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
