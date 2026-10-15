; ---------------------------------------------------------------------------
; Tuskette_NopExport - empty exported function (jt 430) among TUSKETTE's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
Tuskette_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
