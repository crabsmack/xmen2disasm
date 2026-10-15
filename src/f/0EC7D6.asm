; ---------------------------------------------------------------------------
; CoreElevator_SendUp - make StartUp the lift's current and default state
; In:  8(a6) = this
; Out: none
; Evidence: +$64/+$5C = CoreElevator_StartUp; called by Hologram
; ---------------------------------------------------------------------------
CoreElevator_SendUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	CoreElevator_StartUp(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
