; ---------------------------------------------------------------------------
; BaniMazaA1_InstallTileHooks - install BaniMazaA1's map tile hook (slot -$3AF4 = BaniMazaA1_SwitchTileHook) and clear its cooldown
; In:  none
; Out: none
; Evidence: clears the 8 hook longs -$3AF8..-$3ADC except -$3AF4; byte -$35C8 = 1; -$3C94 = 0
; ---------------------------------------------------------------------------
BaniMazaA1_InstallTileHooks:
	link.w	a6,#$0
	move.b	#$1,g_TileHooksOn(a5)
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	lea.l	BaniMazaA1_SwitchTileHook(pc),a0
	move.l	a0,g_TileHooks+$4(a5)
	move.l	d0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	clr.w	g_BmA1SwitchTimer(a5)
	unlk	a6
	rts
