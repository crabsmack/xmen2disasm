; ---------------------------------------------------------------------------
; MaintRobotFire_GetSize - MaintRobotFire: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $139180 (name string "MAINTROBOTFIRE", parent ACTOR)
; ---------------------------------------------------------------------------
MaintRobotFire_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
