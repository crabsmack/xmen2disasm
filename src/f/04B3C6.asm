; ---------------------------------------------------------------------------
; Apocalypse_NopStatic1 - empty helper, first of three called by Apocalypse_CallNopStatics
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Apocalypse_NopStatic1:
	link.w	a6,#$0
	unlk	a6
	rts
