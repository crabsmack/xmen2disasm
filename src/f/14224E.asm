; ---------------------------------------------------------------------------
; TechWallGun_GetSize - TECHWALLGUN slot +$06: return sizeof = $A8
; In:  none
; Out: d0 = $A8
; Evidence: TECHWALLGUN descriptor $143224
; ---------------------------------------------------------------------------
TechWallGun_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
