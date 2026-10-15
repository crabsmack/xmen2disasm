; ---------------------------------------------------------------------------
; Tusk_NopExport - empty exported function (jt 420) among TUSK's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
Tusk_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
