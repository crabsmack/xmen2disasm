; ---------------------------------------------------------------------------
; Timer_SetVBlankHookCb - timer callback: install a delayed V-blank game hook, then free the timer
; In:  8(a6) = hook (timer arg), $C(a6) = timer
; Out: none
; Evidence: g_VBlankGameHook = arg; Timer_Free(timer); scenes create it with Timer_Create(it, 60, hook) (AvalonB2, SentinelsA1 setup)
; ---------------------------------------------------------------------------
Timer_SetVBlankHookCb:
	link.w	a6,#$0
	move.l	$8(a6),g_VBlankGameHook(a5)
	move.l	$C(a6),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	unlk	a6
	rts
