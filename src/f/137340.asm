; ---------------------------------------------------------------------------
; HornetBullet_GetSize - return sizeof(HORNETBULLET object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $137708 (name string "HORNETBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
HornetBullet_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
