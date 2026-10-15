; ---------------------------------------------------------------------------
; AvalonA4_RunScene - scene function for 'AvalonA4 Throne_Room' (Magneto boss): load, place players, hooks, camera, run the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry for 'AvalonA4 Throne_Room'; AvalonA4_ResetEffectCounters, AvalonA4_InitCamera, level loop Level_Run
; ---------------------------------------------------------------------------
AvalonA4_RunScene:
	link.w	a6,#$0
	jsr	AvalonA4_EmptyStub1(pc)
	jsr	AvalonA4_LoadLevel(pc)
	jsr	AvalonA4_PlacePlayers(pc)
	jsr	AvalonA4_InstallHooks(pc)
	jsr	AvalonA4_EmptyStub2(pc)
	jsr	AvalonA4_ResetEffectCounters(pc)
	jsr	AvalonA4_InitCamera(pc)
	jsr	$5002(a5)	; -> Level_Run
	unlk	a6
	rts
