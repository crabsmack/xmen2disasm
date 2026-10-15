; ---------------------------------------------------------------------------
; TankLeft_GetSize - TANKLEFT slot +$06: return sizeof = $A8
; In:  none
; Out: d0 = $A8
; Evidence: TANKLEFT descriptor $142166 (parent TANK)
; ---------------------------------------------------------------------------
TankLeft_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
