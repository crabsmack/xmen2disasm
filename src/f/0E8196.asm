; ---------------------------------------------------------------------------
; HoloBolt_StateDone - HoloBolt final state: does nothing
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; 701 TAS frames active
; ---------------------------------------------------------------------------
HoloBolt_StateDone:
	link.w	a6,#$0
	unlk	a6
	rts
