; ---------------------------------------------------------------------------
; LineSegKiller_Deactivate - only sets +4 bit $4000: no ACTOR Deactivate, so it keeps its resources (LINESEGKILLER override of slot 16, +$46)
; In:  8(a6) = this
; Out: none
; Evidence: method 16 of class descriptor $1389CA (name string "LINESEGKILLER", parent ACTOR)
; ---------------------------------------------------------------------------
LineSegKiller_Deactivate:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	ori.w	#$4000,$4(a0)
	unlk	a6
	rts
