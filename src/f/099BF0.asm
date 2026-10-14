; ---------------------------------------------------------------------------
; sub_099BF0	[jt 795]
; ---------------------------------------------------------------------------
sub_099BF0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,-$3892(a5)
	pea.l	($C0).w
	pea.l	($E0).w
	moveq	#$5A,d0
	move.l	d0,-(a7)
	moveq	#$60,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
