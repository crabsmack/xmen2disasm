; ---------------------------------------------------------------------------
; AvalonA4_InstallTileHooks - install AvalonA4's four map tile hooks
; In:  none
; Out: none
; Evidence: -$3AF4..-$3AE8 = AvalonA4_SwitchTileHook, AvalonA4_GlobCrackBlockHook, AvalonA4_GlobCrackColumnHook, AvalonA4_CrackFloorHook; others 0; byte -$35C8 = 1
; ---------------------------------------------------------------------------
AvalonA4_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	lea.l	AvalonA4_SwitchTileHook(pc),a0
	move.l	a0,-$3AF4(a5)
	lea.l	AvalonA4_GlobCrackBlockHook(pc),a0
	move.l	a0,-$3AF0(a5)
	lea.l	AvalonA4_GlobCrackColumnHook(pc),a0
	move.l	a0,-$3AEC(a5)
	lea.l	AvalonA4_CrackFloorHook(pc),a0
	move.l	a0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	unlk	a6
	rts
