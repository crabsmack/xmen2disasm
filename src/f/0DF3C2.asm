; ---------------------------------------------------------------------------
; SentinelElevator_StateWaitSwitch - SENTINELELEVATOR state: wait until its flag word (+$8C) bit 0 is set, then go up
; In:  8(a6) = this
; Out: d0
; Evidence: TAS 4820-10023
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelElevator_StateWaitSwitch:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.w	(a4),d0
	btst	#$0,d0
	beq.s	loc_0DF3EC
	clr.w	$6C(a3)
	lea.l	SentinelElevator_StateGoUp(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_0DF3EC:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
