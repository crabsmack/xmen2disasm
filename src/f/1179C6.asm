; ---------------------------------------------------------------------------
; XPowerMinusPowerUp_GetSize - return sizeof(XPOWERMINUSPOWERUP object) = $8E bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8E
; Evidence: method 0 of class descriptor $117E32 (name string "XPOWERMINUSPOWERUP", parent POWERUP)
; ---------------------------------------------------------------------------
XPowerMinusPowerUp_GetSize:
	link.w	a6,#$0
	move.l	#$8E,d0
	unlk	a6
	rts
