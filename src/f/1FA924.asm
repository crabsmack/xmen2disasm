; ---------------------------------------------------------------------------
; sub_1FA924	[jt 2563]
; ---------------------------------------------------------------------------
sub_1FA924:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	subq.w	#$8,a4
	move.l	(a4),d0
	cmp.l	-$348C(a5),d0
	bne.s	loc_1FA93E
	move.l	a4,-$348C(a5)
	bra.s	loc_1FA946
loc_1FA93E:
	lea.l	$1FA94E(pc),a0
	move.l	a0,$4(a4)
loc_1FA946:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
