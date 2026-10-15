; ---------------------------------------------------------------------------
; MaintRobot_ClassInit - MaintRobot: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $1391FE (name string "MAINTROBOT", parent XNPC)
; ---------------------------------------------------------------------------
MaintRobot_ClassInit:
	link.w	a6,#$0
	jsr	sub_139178(pc)
	unlk	a6
	rts
