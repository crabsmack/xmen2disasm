; ---------------------------------------------------------------------------
; MagneticGlob_GetSize - MAGNETICGLOB slot +$06: return sizeof(magnetic bolt) = $A6
; In:  none
; Out: d0 = $A6
; Evidence: MAGNETICGLOB descriptor $159B2C (parent RTHETAOBJECT)
; ---------------------------------------------------------------------------
MagneticGlob_GetSize:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
