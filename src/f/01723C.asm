; ---------------------------------------------------------------------------
; FarAcolyte_NopExport - empty exported function (jt 89) among FARACOLYTE's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
FarAcolyte_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
