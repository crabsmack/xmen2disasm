; ---------------------------------------------------------------------------
; sub_02D720	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02D720:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$98(a4)
	bne.s	loc_02D74E
	tst.w	$9A(a4)
	bne.s	loc_02D74E
	andi.b	#$F3,$AC(a4)
	clr.w	$6C(a4)
	lea.l	sub_02CF04(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02D74E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
