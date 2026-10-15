; ---------------------------------------------------------------------------
; ThronePhone_StateDone - THRONEPHONE final state: do nothing
; In:  8(a6) = this
; Out: none
; Evidence: body is link/unlk/rts; installed by ThronePhone_StatePullIn
; ---------------------------------------------------------------------------
ThronePhone_StateDone:
	link.w	a6,#$0
	unlk	a6
	rts
