; ---------------------------------------------------------------------------
; sub_160E0E	[jt 2104]
; ---------------------------------------------------------------------------
sub_160E0E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	and.w	$4A(a4),d0
	bne.s	loc_160E44
	move.w	#$5,$60(a4)
	move.w	#$5,$5E(a4)
	lea.l	sub_160C3E(pc),a0
	move.l	a0,$18(a4)
	ori.w	#$8,$4A(a4)
	andi.w	#$FFEF,$4A(a4)
	moveq	#$1,d0
	bra.s	loc_160E46
loc_160E44:
	moveq	#$0,d0
loc_160E46:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
