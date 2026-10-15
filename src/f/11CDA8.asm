; ---------------------------------------------------------------------------
; BabyBio_ActMoveVertical - BABYBIO script action: move toward the other vertical limit at speed +$B4
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next BabyBio_WaitReachVLimit
; ---------------------------------------------------------------------------
BabyBio_ActMoveVertical:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$A0(a4),d7
	asr.l	#$8,d7
	clr.w	$1E(a4)
	clr.w	$16(a4)
	cmp.w	$B2(a4),d7
	bne.s	loc_11CDF0
	addi.l	#$100,$A0(a4)
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11CDE2
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11CDEA
loc_11CDE2:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11CDEA:
	move.w	d0,$18(a4)
	bra.s	loc_11CE18
loc_11CDF0:
	subi.l	#$100,$A0(a4)
	tst.w	$B4(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_11CE0A
	move.w	$B4(a4),d0
	ext.l	d0
	bra.s	loc_11CE12
loc_11CE0A:
	move.w	$B4(a4),d0
	ext.l	d0
	neg.l	d0
loc_11CE12:
	neg.l	d0
	move.w	d0,$18(a4)
loc_11CE18:
	clr.w	$6C(a4)
	lea.l	BabyBio_WaitReachVLimit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
