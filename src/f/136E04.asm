; ---------------------------------------------------------------------------
; loc_136E04
; ---------------------------------------------------------------------------
loc_136E04:
	moveq	#-$1,d0
	cmp.w	$A6(a4),d0
	bne.s	loc_136E1E
	lea.l	sub_136B84(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_136B84(pc)
	addq.w	#$4,a7
	bra.s	loc_136E32
loc_136E1E:
	move.w	$A6(a4),$6C(a4)
	lea.l	sub_136B84(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136E32:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
