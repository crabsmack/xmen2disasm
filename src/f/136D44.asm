; ---------------------------------------------------------------------------
; sub_136D44	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136D44:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$116,d7
	blt.s	loc_136D7C
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$1E,$6C(a4)
	lea.l	sub_136D86(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136D7C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
