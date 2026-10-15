; ---------------------------------------------------------------------------
; XClimber_StateClimbNop - XCLIMBER slot +$AA: empty (each climber character overrides the climb state)
; In:  none
; Out: none
; Evidence: bare link/unlk/rts; Beast $182C74, NC $1A6FDC, Psylocke $1B9896, Wolverine $197116 override +$AA
; ---------------------------------------------------------------------------
XClimber_StateClimbNop:
	link.w	a6,#$0
	unlk	a6
	rts
