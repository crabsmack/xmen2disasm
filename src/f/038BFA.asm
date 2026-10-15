; ---------------------------------------------------------------------------
; BaniMazaA1_RunScene - scene function for 'BaniMazaA1 Moving_Blocks' (also attract demo 0): set up the stage and run the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; calls the BaniMazaA1_* setup functions, level loop sub_1FA6FE, then restores the VDP register from -$4
; ---------------------------------------------------------------------------
BaniMazaA1_RunScene:
	link.w	a6,#$0
	jsr	BaniMazaA1_EmptyStub(pc)
	jsr	BaniMazaA1_LoadLevel(pc)
	jsr	BaniMazaA1_InitSprites(pc)
	jsr	BaniMazaA1_InstallTileHooks(pc)
	jsr	BaniMazaA1_InitTablePtrs(pc)
	jsr	BaniMazaA1_InitScroll(pc)
	jsr	BaniMazaA1_InstallFrameHook(pc)
	jsr	BaniMazaA1_PlacePlayers(pc)
	jsr	BaniMazaA1_InitPalette(pc)
	jsr	BaniMazaA1_InitCamera(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	move.w	g_VdpReg11(a5),d0
	move.w	d0,($C00004).l
	unlk	a6
	rts
