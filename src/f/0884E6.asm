; ---------------------------------------------------------------------------
; CloneA5_FrameHook - CloneA5 per-frame scene hook: first frame loads resources and spawns the boss; then shockwave sprites and palette cycling at the boss's health-based speed
; In:  none
; Out: none
; Evidence: installed in -$388E by CloneA5_RunScene; once (-$3B0C bit $20): Spr_ReloadDefs(CloneA5_LoadResources, 1), CloneA5_SpawnBoss; counter -$33A2; speed byte -$3C4A (= boss health*2, BroodBoss_Update) into the cycle table, Pal_CycleStep unless fading; twice with g_TwoPlayerStep; TAS 49271-52803
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_FrameHook:
	link.w	a6,#$0
	moveq	#$20,d0
	and.w	g_SceneVar3B0C(a5),d0
	bne.s	loc_08850A
	ori.w	#$20,g_SceneVar3B0C(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	CloneA5_LoadResources(pc)
	jsr	$3F3A(a5)	; -> Spr_ReloadDefs
	jsr	CloneA5_SpawnBoss(pc)
	addq.w	#$8,a7
loc_08850A:
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	CloneA5_AnimShockSprites(pc)
	tst.b	g_BroodBossHealthBar(a5)
	beq.s	loc_088526
	movea.l	g_SceneVar3B18(a5),a0
	move.b	g_BroodBossHealthBar(a5),$4(a0)
loc_088526:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_08854E
	tst.b	g_BroodBossHealthBar(a5)
	beq.s	loc_08854E
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	g_SceneVar3B18(a5),-(a7)
	pea.l	g_CloneA5PalCycles(a5)
	pea.l	g_CloneA5PalCycles+$2(a5)
	pea.l	g_CloneA5PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	lea.l	$14(a7),a7
loc_08854E:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_088584
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	CloneA5_AnimShockSprites(pc)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_088584
	tst.b	g_BroodBossHealthBar(a5)
	beq.s	loc_088584
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	g_SceneVar3B18(a5),-(a7)
	pea.l	g_CloneA5PalCycles(a5)
	pea.l	g_CloneA5PalCycles+$2(a5)
	pea.l	g_CloneA5PalCycles+$4(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
loc_088584:
	unlk	a6
	rts
