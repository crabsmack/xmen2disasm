; ---------------------------------------------------------------------------
; XClimber_GetSize - XCLIMBER slot +$06: return sizeof(climber player) = $C2
; In:  none
; Out: d0 = $C2
; Evidence: XCLIMBER descriptor $11329A (parent of Beast, Nightcrawler, Psylocke, Wolverine)
; ---------------------------------------------------------------------------
XClimber_GetSize:
	link.w	a6,#$0
	move.l	#$C2,d0
	unlk	a6
	rts
