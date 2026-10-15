; ---------------------------------------------------------------------------
; RetractFloor_NopExport - empty exported function (jt 167) among RETRACTFLOOR's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
RetractFloor_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
