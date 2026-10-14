; ---------------------------------------------------------------------------
; sub_094FB2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_094FB2:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$C2(a4),d7
	blt.s	loc_094FF8
	move.w	$C2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	$18(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	clr.w	$6C(a4)
	lea.l	sub_095014(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09500A
loc_094FF8:
	clr.w	$6C(a4)
	lea.l	sub_094FB2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09500A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
