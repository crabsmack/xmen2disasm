; ---------------------------------------------------------------------------
; Sys_ReturnTrue - return 1
; In:  none
; Out: d0 = 1
; Evidence: moveq #1,d0; jt 2595 with no static caller, executed in 42 TAS frames from 24409
; ---------------------------------------------------------------------------
Sys_ReturnTrue:
	link.w	a6,#$0
	moveq	#$1,d0
	unlk	a6
	rts
