; ---------------------------------------------------------------------------
; sub_119A46	[link-after-rts]
; ---------------------------------------------------------------------------
sub_119A46:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d7
	bra.s	loc_119A70
loc_119A56:
	ext.l	d7
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	$4(a3,d0.l),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_119A70:
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmp.w	d7,d0
	bgt.s	loc_119A56
	lea.l	sub_119B66(pc),a0
	move.l	a0,$2C(a3)
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
