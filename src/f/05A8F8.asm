; ---------------------------------------------------------------------------
; sub_05A8F8	[jt 400]
; ---------------------------------------------------------------------------
sub_05A8F8:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.w	(a4),d0
	ext.l	d0
	add.l	d0,d0
	add.l	$8(a6),d0
	movea.l	d0,a0
	move.w	(a0),(a3)
	moveq	#-$1,d0
	cmp.w	(a3),d0
	bne.s	loc_05A92A
	move.w	#$1,(a4)
	movea.l	$8(a6),a0
	move.w	(a0),(a3)
	moveq	#$1,d0
	bra.s	loc_05A92E
loc_05A92A:
	addq.w	#$1,(a4)
	moveq	#$0,d0
loc_05A92E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
