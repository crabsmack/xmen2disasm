; ---------------------------------------------------------------------------
; Brood_StateLimitWait - BROOD: when the timer ends charge again
; In:  8(a6) = this
; Out: none
; Evidence: next Brood_ActCharge
; ---------------------------------------------------------------------------
Brood_StateLimitWait:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_06DCD4
	clr.w	$6C(a4)
	lea.l	Brood_ActCharge(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_06DCD4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
