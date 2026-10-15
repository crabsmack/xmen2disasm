; ---------------------------------------------------------------------------
; ApocBomb_NopExport - exported function (jt 363) that only calls ApocBomb_NopStatic
; In:  none
; Out: none
; Evidence: no caller found
; ---------------------------------------------------------------------------
ApocBomb_NopExport:
	link.w	a6,#$0
	jsr	ApocBomb_NopStatic(pc)
	unlk	a6
	rts
