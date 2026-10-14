; ---------------------------------------------------------------------------
; sub_119B20	[link-after-rts]
; ---------------------------------------------------------------------------
sub_119B20:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d7
	bra.s	loc_119B4A
loc_119B30:
	ext.l	d7
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	$4(a3,d0.l),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_119B4A:
	moveq	#$0,d0
	move.b	$36(a3),d0
	cmp.w	d7,d0
	bgt.s	loc_119B30
	lea.l	sub_119A8C(pc),a0
	move.l	a0,$2C(a3)
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
