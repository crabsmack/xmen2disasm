; ---------------------------------------------------------------------------
; sub_0868C6	[jt 629]
; ---------------------------------------------------------------------------
sub_0868C6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	moveq	#$0,d0
	move.b	$4(a4),d0
	moveq	#$1,d1
	and.b	d0,d1
	bne.s	loc_0868E0
	moveq	#$0,d0
	bra.s	loc_0868E8
loc_0868E0:
	andi.b	#$FE,$4(a4)
	moveq	#$0,d0
loc_0868E8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
