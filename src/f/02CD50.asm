; ---------------------------------------------------------------------------
; AvalonA3_RunScene - scene function for 'AvalonA3 Exodus': load, place players, camera, hooks, sprites, save palettes, run the level loop
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry for 'AvalonA3 Exodus'; level loop sub_1FA6FE
; ---------------------------------------------------------------------------
AvalonA3_RunScene:
	link.w	a6,#$FFC8
	movem.l	a3-a4,-(a7)
	lea.l	-$38(a6),a3
	lea.l	-$1C(a6),a4
	jsr	AvalonA3_EmptyStub1(pc)
	jsr	AvalonA3_LoadLevel(pc)
	jsr	AvalonA3_PlacePlayers(pc)
	jsr	AvalonA3_InitCamera(pc)
	jsr	AvalonA3_InstallHooks(pc)
	jsr	AvalonA3_EmptyStub2(pc)
	jsr	AvalonA3_InitSprites(pc)
	jsr	AvalonA3_EmptyStub3(pc)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	AvalonA3_SavePalettes(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	movem.l	-$40(a6),a3-a4
	unlk	a6
	rts
