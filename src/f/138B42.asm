; ---------------------------------------------------------------------------
; MaintRobot_SizeOf - MaintRobot: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $1391FE (name string "MAINTROBOT", parent XNPC)
; ---------------------------------------------------------------------------
MaintRobot_SizeOf:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
