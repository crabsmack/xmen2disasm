; ---------------------------------------------------------------------------
; Apocalypse_CallNopStatics - call APOCALYPSE's three empty helpers
; In:  none
; Out: none
; Evidence: callers Apocalypse_ClassInit and Apocalypse_Nop6A
; ---------------------------------------------------------------------------
Apocalypse_CallNopStatics:
	link.w	a6,#$0
	jsr	Apocalypse_NopStatic1(pc)
	jsr	Apocalypse_NopStatic2(pc)
	jsr	Apocalypse_NopStatic3(pc)
	unlk	a6
	rts
