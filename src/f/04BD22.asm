; ---------------------------------------------------------------------------
; sub_04BD22	[jt 340]
; ---------------------------------------------------------------------------
sub_04BD22:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	addq.b	#$1,$B1(a4)
	moveq	#$0,d0
	move.b	$B1(a4),d0
	cmpi.b	#$3,d0
	bls.s	loc_04BD40
	clr.b	$B1(a4)
loc_04BD40:
	clr.w	$6C(a4)
	lea.l	sub_04BC74(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
