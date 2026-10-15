; ---------------------------------------------------------------------------
; BaniMazaA2_AnimSprite - timer callback: flip the BaniMazaA2 sprite between frames 0/1 unless stopped
; In:  none
; Out: none
; Evidence: Timer_Create(Timer_SetVBlankHookCb, 10, BaniMazaA2_AnimSprite, 1) in BaniMazaA2_RunScene; skipped once g_SceneVar3B0E is set
; ---------------------------------------------------------------------------
BaniMazaA2_AnimSprite:
	link.w	a6,#$0
	tst.w	g_SceneVar3B0E(a5)
	bne.s	loc_047606
	moveq	#$1,d0
	and.l	g_VBlankCount(a5),d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
loc_047606:
	unlk	a6
	rts
