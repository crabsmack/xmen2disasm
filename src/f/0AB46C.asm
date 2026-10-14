; ---------------------------------------------------------------------------
; sub_0AB46C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB46C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB48E
	clr.w	$6C(a4)
	lea.l	sub_0AB41E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AB48E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
