; ---------------------------------------------------------------------------
; BaniMazaA2_DrawHook - BaniMazaA2 draw hook: draw the draw list, then ApocBomb_DrawShadow for each present player
; In:  none
; Out: none
; Evidence: installed in -$38F4 (scene draw hook, called each frame by the level loop) by BaniMazaA2_LoadLevel; DrawList_DrawAll
; ---------------------------------------------------------------------------
BaniMazaA2_DrawHook:
	link.w	a6,#$0
	jsr	$4F82(a5)	; -> DrawList_DrawAll
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_04780E
	pea.l	g_Player1(a5)
	jsr	$BBA(a5)	; -> ApocBomb_DrawShadow
	addq.w	#$4,a7
loc_04780E:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_047830
	pea.l	g_Player2(a5)
	jsr	$BBA(a5)	; -> ApocBomb_DrawShadow
	addq.w	#$4,a7
loc_047830:
	unlk	a6
	rts
