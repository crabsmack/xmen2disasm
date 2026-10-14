; ---------------------------------------------------------------------------
; sub_1210CE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1210CE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d0
	cmp.w	$9E(a4),d0
	bne.s	loc_1210F2
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_12123E(pc)
	addq.w	#$4,a7
	bra.s	loc_121106
loc_1210F2:
	move.w	$9E(a4),$6C(a4)
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_121106:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
