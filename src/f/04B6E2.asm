; ---------------------------------------------------------------------------
; Apocalypse_NopStatic2 - empty helper, second of three called by Apocalypse_CallNopStatics
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Apocalypse_NopStatic2:
	link.w	a6,#$0
	unlk	a6
	rts
