; ---------------------------------------------------------------------------
; Sys_Nop1FA8D4 - empty function (link/unlk/rts)
; In:  none
; Out: none
; Evidence: no body; jt 2561
; ---------------------------------------------------------------------------
Sys_Nop1FA8D4:
	link.w	a6,#$0
	unlk	a6
	rts
