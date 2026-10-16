; ---------------------------------------------------------------------------
; Pause_Check - per-frame Start check: pause the game, or let a waiting player join with a life
; In:  none
; Out: d0
; Evidence: needs the HUD sprite flag and no fade, a live player; Start by a live player -> Snd_Pause, Pause_LoadSprite/ShowText/LinkSprites/Loop/RestoreLink, Snd_Resume; Start by a dead player with lives -> Player1_StartLife / Player2_StartLife
; ---------------------------------------------------------------------------
Pause_Check:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_PauseCheatPtr(a5)
	tst.b	g_SpriteTable+$3(a5)
	beq.s	loc_15CB30
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_15CB30
	tst.w	g_Player1+$68(a5)
	bgt.s	loc_15CAC6
	tst.w	g_Player2+$68(a5)
	ble.s	loc_15CB30
loc_15CAC6:
	move.w	#$80,d0
	and.w	g_Pad1Pressed(a5),d0
	beq.s	loc_15CAE2
	tst.w	g_Player1+$68(a5)
	bgt.s	loc_15CAE2
	tst.w	g_P1Lives(a5)
	beq.s	loc_15CB30
	jsr	$4A(a5)	; -> Player1_StartLife
	bra.s	loc_15CB30
loc_15CAE2:
	move.w	#$80,d0
	and.w	g_Pad2Pressed(a5),d0
	beq.s	loc_15CAFE
	tst.w	g_Player2+$68(a5)
	bgt.s	loc_15CAFE
	tst.w	g_P2Lives(a5)
	beq.s	loc_15CB30
	jsr	$52(a5)	; -> Player2_StartLife
	bra.s	loc_15CB30
loc_15CAFE:
	clr.b	g_PauseExit(a5)
	move.b	#$1,g_Paused(a5)
	move.w	#$FF7F,d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	jsr	$5232(a5)	; -> Snd_Pause
	jsr	Pause_LoadSprite(pc)
	jsr	Pause_ShowText(pc)
	jsr	Pause_LinkSprites(pc)
	jsr	Pause_Loop(pc)
	jsr	Pause_RestoreLink(pc)
	jsr	$523A(a5)	; -> Snd_Resume
loc_15CB30:
	unlk	a6
	rts
