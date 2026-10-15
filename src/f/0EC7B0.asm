; ---------------------------------------------------------------------------
; CoreElevator_SendDown - make StartDown the lift's current and default state, trip counter 0
; In:  8(a6) = this
; Out: none
; Evidence: +$64/+$5C = CoreElevator_StartDown; called by Hologram
; ---------------------------------------------------------------------------
CoreElevator_SendDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	CoreElevator_StartDown(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	clr.b	$92(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
