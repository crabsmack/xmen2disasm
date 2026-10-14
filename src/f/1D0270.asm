; ---------------------------------------------------------------------------
; sub_1D0270	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1D0270:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$3,d7
	movea.l	$BC(a3),a4
	bra.s	loc_1D0290
loc_1D0284:
	dc.w	$197C,$FFFF,$000E	; move.b #$ff, $e(a4)
	subq.w	#$1,d7
	lea.l	$10(a4),a4
loc_1D0290:
	tst.w	d7
	bne.s	loc_1D0284
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
