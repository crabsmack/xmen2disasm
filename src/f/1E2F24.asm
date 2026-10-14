; ---------------------------------------------------------------------------
; sub_1E2F24	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1E2F24:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A8(a4)
	bgt.s	loc_1E2F3C
	clr.b	$E0(a4)
	moveq	#$1,d0
	bra.s	loc_1E2F3E
loc_1E2F3C:
	moveq	#$0,d0
loc_1E2F3E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
