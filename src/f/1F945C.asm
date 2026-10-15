; ---------------------------------------------------------------------------
; Sys_Nop1F945C - empty function (link/unlk/rts)
; In:  none
; Out: none
; Evidence: no body; jt 2542; called by sub_088112, sub_09B8A0, sub_160BB0
; ---------------------------------------------------------------------------
Sys_Nop1F945C:
	link.w	a6,#$0
	unlk	a6
	rts
