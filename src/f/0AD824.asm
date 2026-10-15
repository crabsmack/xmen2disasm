; ---------------------------------------------------------------------------
; SavageA2_FrameHook - SavageA2 per-frame scene hook: counter -$33A2 and the light animation (twice with g_TwoPlayerStep)
; In:  none
; Out: none
; Evidence: installed in g_SceneFrameHook; TAS 30901-31900
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	SavageA2_AnimLights(pc)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0AD846
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	SavageA2_AnimLights(pc)
loc_0AD846:
	unlk	a6
	rts
