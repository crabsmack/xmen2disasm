; ---------------------------------------------------------------------------
; Apocalypse_NopStatic3 - empty helper, third of three called by Apocalypse_CallNopStatics
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Apocalypse_NopStatic3:
	link.w	a6,#$0
	unlk	a6
	rts
