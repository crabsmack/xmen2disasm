; ---------------------------------------------------------------------------
; MagnetoBoss_NopExport - empty exported function (jt 237) among MAGNETOBOSS's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
MagnetoBoss_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
