; ---------------------------------------------------------------------------
; AvalonA2_RunScene - scene function for 'AvalonA2 Falling_Room': stubs, load, place players, hooks, camera floor, level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry for 'AvalonA2 Falling_Room'; calls the AvalonA2_* setup functions then level loop Level_Run
; ---------------------------------------------------------------------------
AvalonA2_RunScene:
	link.w	a6,#$0
	jsr	AvalonA2_CallEmptyStubs(pc)
	jsr	AvalonA2_LoadLevel(pc)
	jsr	AvalonA2_PlacePlayers(pc)
	jsr	AvalonA2_InstallHooks(pc)
	jsr	AvalonA2_EmptyStub3(pc)
	jsr	AvalonA2_ResetCounters(pc)
	jsr	AvalonA2_RaiseCameraFloor(pc)
	jsr	$5002(a5)	; -> Level_Run
	unlk	a6
	rts
