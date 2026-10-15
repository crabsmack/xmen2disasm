; ---------------------------------------------------------------------------
; sub_0BC516	[jt 1015]
; ---------------------------------------------------------------------------
sub_0BC516:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.l	$98(a4)
	lea.l	$10(a7),a7
	bne.s	loc_0BC556
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0BC584
loc_0BC556:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC56A
	clr.w	$96(a4)
loc_0BC56A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0BC584:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
