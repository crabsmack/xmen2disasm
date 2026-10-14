; ---------------------------------------------------------------------------
; sub_0E9C04	[jt 1253]
; ---------------------------------------------------------------------------
sub_0E9C04:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	clr.w	d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	bra.s	loc_0E9C4E
loc_0E9C16:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_0E9C3E
	lea.l	$27F2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0E9C3E
	lea.l	sub_0E9ED4(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.s	loc_0E9C54
loc_0E9C3E:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_0E9C4E:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_0E9C16
loc_0E9C54:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
