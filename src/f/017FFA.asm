; ---------------------------------------------------------------------------
; ShootAcolyte_NopExport - empty exported function (jt 103) among SHOOTACOLYTE's methods
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; no caller or descriptor slot found
; ---------------------------------------------------------------------------
ShootAcolyte_NopExport:
	link.w	a6,#$0
	unlk	a6
	rts
