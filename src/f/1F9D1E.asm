; ---------------------------------------------------------------------------
; Timer_Stop - stop a timer without freeing it
; In:  8(a6) = timer pointer (null ignored)
; Out: none
; Evidence: state = -2: neither counted down nor fired by Timer_RunAll
; ---------------------------------------------------------------------------
Timer_Stop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_1F9D30
	move.w	#$FFFE,(a4)
loc_1F9D30:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
