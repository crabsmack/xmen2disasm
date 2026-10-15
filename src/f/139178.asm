; ---------------------------------------------------------------------------
; MaintRobot_NopStatic - empty non-virtual helper called from MAINTROBOT's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; caller MaintRobot_ClassInit
; ---------------------------------------------------------------------------
MaintRobot_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
