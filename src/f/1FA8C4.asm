; ---------------------------------------------------------------------------
; Sys_Nop1FA8C4 - empty function (link/unlk/rts)
; In:  none
; Out: none
; Evidence: no body; jt 2559
; ---------------------------------------------------------------------------
Sys_Nop1FA8C4:
	link.w	a6,#$0
	unlk	a6
	rts
