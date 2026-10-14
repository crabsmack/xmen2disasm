; ---------------------------------------------------------------------------
; sub_15A79C	[jt 2008]
; ---------------------------------------------------------------------------
sub_15A79C:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	move.b	d0,d7
	beq.s	loc_15A7BA
	moveq	#$0,d0
	bra.s	loc_15A7BC
loc_15A7BA:
	moveq	#$1,d0
loc_15A7BC:
	addq.w	#$4,a7
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
