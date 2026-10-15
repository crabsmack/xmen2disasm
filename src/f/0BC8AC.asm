; ---------------------------------------------------------------------------
; SavageBio_ActCrossIfUp - SAVAGE bio script action: if above the floor (y < +$A2) cross to the other surface, else the next step
; In:  8(a6) = this
; Out: none
; Evidence: -> SavageBio_StateCrossSurface; TAS 33892
; Found: jt 1019
; ---------------------------------------------------------------------------
SavageBio_ActCrossIfUp:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$A2(a4),d7
	bge.s	loc_0BC8D8
	clr.w	$6C(a4)
	lea.l	SavageBio_StateCrossSurface(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BC916
loc_0BC8D8:
	tst.l	$98(a4)
	bne.s	loc_0BC8EA
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC916
loc_0BC8EA:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC8FE
	clr.w	$96(a4)
loc_0BC8FE:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BC916:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
