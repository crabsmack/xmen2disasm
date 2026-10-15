; ---------------------------------------------------------------------------
; sub_0DC294	[jt 1144]
; ---------------------------------------------------------------------------
sub_0DC294:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	pea.l	$DC2C4(pc)
	moveq	#$1E,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3BFA(a5)
	movea.l	d0,a4
	moveq	#$F,d7
	addq.w	#$8,a7
loc_0DC2B2:
	clr.w	(a4)
	addq.w	#$2,a4
	subq.l	#$1,d7
	bne.s	loc_0DC2B2
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
