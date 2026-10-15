; ---------------------------------------------------------------------------
; SavageA4_InstallHooks - SavageA4: install the frame hook, load resources, effect sprite, palette reset, place the players at ($140, $180)
; In:  none
; Out: none
; Evidence: g_SceneFrameHook := SavageA4_FrameHook; Players_PlaceAtStart($140, $180, 100, $500); TAS 33381
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_InstallHooks:
	link.w	a6,#$0
	lea.l	SavageA4_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	SavageA4_LoadResources(pc)
	jsr	SavageA4_InitEffectSprite(pc)
	jsr	SavageA4_ResetPalCycles(pc)
	pea.l	($500).w
	moveq	#$64,d0
	move.l	d0,-(a7)
	pea.l	($180).w
	pea.l	($140).w
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	unlk	a6
	rts
