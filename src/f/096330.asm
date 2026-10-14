; ---------------------------------------------------------------------------
; sub_096330	[jt 728]
; ---------------------------------------------------------------------------
sub_096330:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	jsr	$5242(a5)	; -> sub_1FE5F2
	pea.l	($8F).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($8F).w
	jsr	$521A(a5)	; -> sub_1FE584
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_096362
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_09638E
loc_096362:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096376
	clr.w	$96(a4)
loc_096376:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_09638E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
