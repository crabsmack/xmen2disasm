; ---------------------------------------------------------------------------
; sub_0BE8EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE8EE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	$8C(a4),d0
	cmpi.w	#$FFFF,d0
	addq.w	#$8,a7
	bne.s	loc_0BE926
	lea.l	sub_0BE946(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_0BE946(pc)
	addq.w	#$4,a7
	bra.s	loc_0BE93E
loc_0BE926:
	moveq	#$0,d0
	move.b	$8C(a4),d0
	move.w	d0,$6C(a4)
	lea.l	sub_0BE946(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE93E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
