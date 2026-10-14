; ---------------------------------------------------------------------------
; sub_1F9422	[jt 2540]
; ---------------------------------------------------------------------------
sub_1F9422:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	-$1350(a5),a4
	bra.s	loc_1F9442
loc_1F942E:
	tst.l	$8(a4)
	beq.s	loc_1F9440
	move.l	$C(a4),-(a7)
	movea.l	$8(a4),a0
	jsr	(a0)
	addq.w	#$4,a7
loc_1F9440:
	movea.l	(a4),a4
loc_1F9442:
	move.l	a4,d0
	bne.s	loc_1F942E
	movea.l	-$4(a6),a4
	unlk	a6
	rts
