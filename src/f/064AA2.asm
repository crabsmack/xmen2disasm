; ---------------------------------------------------------------------------
; sub_064AA2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064AA2:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	-$3B30(a5),a4
	clr.w	d7
	bra.s	loc_064ADC
loc_064AB2:
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$0,d2
	move.b	$1(a4),d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	(a4),d2
	move.l	d2,-(a7)
	move.w	d7,d2
	ext.l	d2
	move.l	d2,-(a7)
	jsr	sub_06498A(pc)
	lea.l	$14(a7),a7
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_064ADC:
	cmp.w	-$3B0E(a5),d7
	blt.s	loc_064AB2
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
