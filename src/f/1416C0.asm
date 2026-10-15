; ---------------------------------------------------------------------------
; Tank_GetSize - TANK slot +$06: return sizeof(TANK) = $A8
; In:  none
; Out: d0 = $A8
; Evidence: TANK descriptor $1420DE (parent XNPC)
; ---------------------------------------------------------------------------
Tank_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
