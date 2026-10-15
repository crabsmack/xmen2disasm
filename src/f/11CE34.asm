; ---------------------------------------------------------------------------
; BabyBio_WaitReachHLimit - BABYBIO: wait until x reaches the left (+$AC) or right (+$AE) limit, then next entry
; In:  8(a6) = this
; Out: none
; Evidence: state set by BabyBio_ActMoveHorizontal
; ---------------------------------------------------------------------------
BabyBio_WaitReachHLimit:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	cmp.w	$AC(a4),d7
	beq.s	loc_11CE52
	cmp.w	$AE(a4),d7
	bne.s	loc_11CE90
loc_11CE52:
	tst.l	$98(a4)
	bne.s	loc_11CE64
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11CE90
loc_11CE64:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11CE78
	clr.w	$96(a4)
loc_11CE78:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11CE90:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
