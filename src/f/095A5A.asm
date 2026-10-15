; ---------------------------------------------------------------------------
; sub_095A5A	[jt 723]
; ---------------------------------------------------------------------------
sub_095A5A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($EF).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EF).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_095A88
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_095AB4
loc_095A88:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_095A9C
	clr.w	$96(a4)
loc_095A9C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_095AB4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
