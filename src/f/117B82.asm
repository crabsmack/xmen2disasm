; ---------------------------------------------------------------------------
; MysteryPowerUp_SizeOf - MysteryPowerUp: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $117FC0 (name string "MYSTERYPOWERUP", parent POWERUP)
; ---------------------------------------------------------------------------
MysteryPowerUp_SizeOf:
	link.w	a6,#$0
	move.l	#$8E,d0
	unlk	a6
	rts
