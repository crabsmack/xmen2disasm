; ---------------------------------------------------------------------------
; CoreElevator_StartDown - CoreElevator: start moving down (vy = +speed +$90), active
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: clears +6 bit $4000; next MoveDown
; ---------------------------------------------------------------------------
CoreElevator_StartDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$BFFF,$6(a4)
	move.w	$90(a4),$18(a4)
	clr.w	$6C(a4)
	lea.l	CoreElevator_MoveDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
