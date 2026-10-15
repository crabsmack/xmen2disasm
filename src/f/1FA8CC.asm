; ---------------------------------------------------------------------------
; Sys_Nop1FA8CC - empty function (link/unlk/rts)
; In:  none
; Out: none
; Evidence: no body; jt 2560
; ---------------------------------------------------------------------------
Sys_Nop1FA8CC:
	link.w	a6,#$0
	unlk	a6
	rts
