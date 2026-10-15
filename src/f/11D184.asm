; ---------------------------------------------------------------------------
; BabyBio_WaitStopOrLimit - BABYBIO: wait until it has stopped or reached a horizontal limit, then stop and go to the next script entry
; In:  8(a6) = this
; Out: none
; Evidence: loops on itself
; ---------------------------------------------------------------------------
BabyBio_WaitStopOrLimit:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	tst.w	$16(a4)
	beq.s	loc_11D1A8
	cmp.w	$AC(a4),d7
	beq.s	loc_11D1A8
	cmp.w	$AE(a4),d7
	bne.s	loc_11D1F4
loc_11D1A8:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_11D1C6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D206
loc_11D1C6:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D1DA
	clr.w	$96(a4)
loc_11D1DA:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D206
loc_11D1F4:
	clr.w	$6C(a4)
	lea.l	BabyBio_WaitStopOrLimit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11D206:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
