; ---------------------------------------------------------------------------
; sub_160DCE	[jt 2103]
; ---------------------------------------------------------------------------
sub_160DCE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	and.w	$4A(a4),d0
	bne.s	loc_160E04
	move.w	#$2,$60(a4)
	move.w	#$2,$5E(a4)
	lea.l	sub_160D06(pc),a0
	move.l	a0,$18(a4)
	ori.w	#$4,$4A(a4)
	andi.w	#$FFEF,$4A(a4)
	moveq	#$1,d0
	bra.s	loc_160E06
loc_160E04:
	moveq	#$0,d0
loc_160E06:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
