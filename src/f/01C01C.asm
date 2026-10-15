; ---------------------------------------------------------------------------
; YoyoAcolyte_NopExport - empty exported function (jt 128) among YOYOACOLYTE's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
YoyoAcolyte_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
