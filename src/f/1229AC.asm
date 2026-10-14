; ---------------------------------------------------------------------------
; sub_1229AC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1229AC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_121DB6(pc)
	tst.w	$6E(a4)
	addq.w	#$4,a7
	bne.s	loc_1229FA
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	asr.l	#$4,d0
	move.w	d0,$1E(a4)
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
	asr.l	#$4,d0
	move.w	d0,$20(a4)
	move.w	#$10,$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_1228F2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_122A0C
loc_1229FA:
	clr.w	$6C(a4)
	lea.l	sub_1229AC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_122A0C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
