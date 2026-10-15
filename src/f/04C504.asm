; ---------------------------------------------------------------------------
; Apocalypse_NopExport - exported function (jt 345) that only calls Apocalypse_CallNopStatics
; In:  none
; Out: none
; Evidence: no caller found
; ---------------------------------------------------------------------------
Apocalypse_NopExport:
	link.w	a6,#$0
	jsr	Apocalypse_CallNopStatics(pc)
	unlk	a6
	rts
