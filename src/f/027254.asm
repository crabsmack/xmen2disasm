; ---------------------------------------------------------------------------
; Zapper_NopExport - empty exported function (jt 176) among ZAPPER's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
Zapper_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
