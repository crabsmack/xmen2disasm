; ---------------------------------------------------------------------------
; Timer_Start - start a timer: it fires on the next Timer_RunAll pass, then every period frames
; In:  8(a6) = timer pointer (null ignored)
; Out: none
; Evidence: state = -4; Timer_RunAll turns -4 into 0 after its pass, so the next pass calls the callback and reloads the period; 32 callers
; ---------------------------------------------------------------------------
Timer_Start:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_1F9D16
	move.w	#$FFFC,(a4)
loc_1F9D16:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
