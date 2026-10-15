; ---------------------------------------------------------------------------
; Sys_Nop1F949E - empty function (link/unlk/rts)
; In:  none
; Out: none
; Evidence: no body; jt 2544, no static caller
; ---------------------------------------------------------------------------
Sys_Nop1F949E:
	link.w	a6,#$0
	unlk	a6
	rts
