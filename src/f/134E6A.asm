; ---------------------------------------------------------------------------
; FlyBrood_WaitPathDone - FLYBROOD: wait until the path (+$A2) ends, then restart the script
; In:  8(a6) = this
; Out: none
; Evidence: state set by FlyBrood_Init_Case4
; ---------------------------------------------------------------------------
FlyBrood_WaitPathDone:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A2(a4)
	bne.s	loc_134EAA
	tst.l	$8E(a4)
	bne.s	loc_134E8C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_134EBC
loc_134E8C:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_134EBC
loc_134EAA:
	clr.w	$6C(a4)
	lea.l	FlyBrood_WaitPathDone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_134EBC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
