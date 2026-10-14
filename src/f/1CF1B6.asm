; ---------------------------------------------------------------------------
; sub_1CF1B6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CF1B6:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$3,d7
	movea.l	$BC(a3),a4
	bra.s	loc_1CF1DC
loc_1CF1CA:
	moveq	#-$1,d0
	cmp.b	$E(a4),d0
	bne.s	loc_1CF1D6
	move.l	a4,d0
	bra.s	loc_1CF1E2
loc_1CF1D6:
	subq.w	#$1,d7
	lea.l	$10(a4),a4
loc_1CF1DC:
	tst.w	d7
	bne.s	loc_1CF1CA
	moveq	#$0,d0
loc_1CF1E2:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
