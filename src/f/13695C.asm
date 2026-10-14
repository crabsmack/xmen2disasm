; ---------------------------------------------------------------------------
; sub_13695C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13695C:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1366A2(pc)
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$172,d7
	blt.s	loc_136988
	move.w	#$14,$6E(a4)
	lea.l	sub_1368F4(pc),a0
	move.l	a0,$94(a4)
loc_136988:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
