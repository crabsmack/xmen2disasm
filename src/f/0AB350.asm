; ---------------------------------------------------------------------------
; sub_0AB350	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB350:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB368
	move.l	a4,-(a7)
	jsr	sub_0AB24E(pc)
	addq.w	#$4,a7
loc_0AB368:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
