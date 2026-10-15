; ---------------------------------------------------------------------------
; ThronePhone_NopExport - empty exported function (jt 250) among THRONEPHONE's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
ThronePhone_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
