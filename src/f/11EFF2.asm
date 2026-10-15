; ---------------------------------------------------------------------------
; BioBalls_WaitPathDone - BIOBALLS: wait until the path pointer (+$9A) is cleared, then next entry
; In:  8(a6) = this
; Out: none
; Evidence: set by BioBalls_StartPath
; ---------------------------------------------------------------------------
BioBalls_WaitPathDone:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9A(a4)
	beq.s	loc_11F016
	clr.w	$6C(a4)
	lea.l	BioBalls_WaitPathDone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_11F054
loc_11F016:
	tst.l	$8E(a4)
	bne.s	loc_11F028
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11F054
loc_11F028:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11F03C
	clr.w	$8C(a4)
loc_11F03C:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11F054:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
