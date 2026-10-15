; ---------------------------------------------------------------------------
; BaniMazaA1_InstallTileHooks - install BaniMazaA1's map tile hook (slot -$3AF4 = BaniMazaA1_SwitchTileHook) and clear its cooldown
; In:  none
; Out: none
; Evidence: clears the 8 hook longs -$3AF8..-$3ADC except -$3AF4; byte -$35C8 = 1; -$3C94 = 0
; ---------------------------------------------------------------------------
BaniMazaA1_InstallTileHooks:
	link.w	a6,#$0
	move.b	#$1,-$35C8(a5)
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	lea.l	BaniMazaA1_SwitchTileHook(pc),a0
	move.l	a0,-$3AF4(a5)
	move.l	d0,-$3AF0(a5)
	move.l	d0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	clr.w	-$3C94(a5)
	unlk	a6
	rts
