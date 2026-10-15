; ---------------------------------------------------------------------------
; MaintRobotFire_GetSize - return sizeof(MAINTROBOTFIRE object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $139180 (name string "MAINTROBOTFIRE", parent ACTOR)
; ---------------------------------------------------------------------------
MaintRobotFire_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
