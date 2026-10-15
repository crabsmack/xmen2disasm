; ---------------------------------------------------------------------------
; BigBio_StateWaitThenFlyBack - BIGBIO: when the timer runs out pick the other arena side and fly there
; In:  8(a6) = this
; Out: d0
; Evidence: next StateFlyToTarget
; ---------------------------------------------------------------------------
BigBio_StateWaitThenFlyBack:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	BigBio_UpdateOrbRing(pc)
	tst.w	$6E(a4)
	addq.w	#$4,a7
	bne.w	loc_122990
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.b	$B6(a4)
	seq.b	d3
	neg.b	d3
	move.b	d3,$B6(a4)
	beq.s	loc_122936
	move.w	$B0(a4),d0
	ext.l	d0
	moveq	#$32,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	bra.s	loc_122944
loc_122936:
	move.w	$B0(a4),d0
	ext.l	d0
	add.l	#$15E,d0
	lsl.l	#$8,d0
loc_122944:
	move.l	d0,$A4(a4)
	move.w	$12(a4),d0
	ext.l	d0
	sub.l	#$82,d0
	lsl.l	#$8,d0
	move.l	d0,$A8(a4)
	move.l	$A4(a4),d0
	sub.l	$8(a4),d0
	asr.l	#$6,d0
	move.w	d0,$16(a4)
	move.l	$A8(a4),d0
	sub.l	$C(a4),d0
	asr.l	#$6,d0
	move.w	d0,$18(a4)
	move.w	#$64,$6E(a4)
	clr.w	$6C(a4)
	lea.l	BigBio_StateFlyToTarget(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1229A2
loc_122990:
	clr.w	$6C(a4)
	lea.l	BigBio_StateWaitThenFlyBack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1229A2:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
