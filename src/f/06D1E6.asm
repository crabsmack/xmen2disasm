; ---------------------------------------------------------------------------
; Brood_NopExport - empty exported function (jt 515) among BROOD's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
Brood_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
