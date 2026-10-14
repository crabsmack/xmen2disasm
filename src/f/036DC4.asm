; ---------------------------------------------------------------------------
; sub_036DC4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_036DC4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	-$38A4(a5)
	bne.s	loc_036DE8
	move.w	#$28,$6C(a4)
	lea.l	sub_036D3C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_036DE8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
