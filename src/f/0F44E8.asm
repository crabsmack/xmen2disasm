; ---------------------------------------------------------------------------
; SentinelsB_ExitSeg - Sentinels segment handler: in mode 3 start the scene-exit timer (30 frames; in SentinelsB2 5 frames, only while the countdown runs)
; In:  $A(a6) = word mode
; Out: d0 = 1 in mode 3, else 0
; Evidence: g_SceneExitTimer, g_ScnSentinelsB2 vs g_SceneIndex, countdown $FFC6FE
; ---------------------------------------------------------------------------
SentinelsB_ExitSeg:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_0F451E
	tst.w	g_SceneExitTimer(a5)
	bne.s	loc_0F451A
	moveq	#$0,d0
	move.b	g_ScnSentinelsB2(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0F4514
	tst.w	-$3B02(a5)
	beq.s	loc_0F451A
	move.w	#$5,g_SceneExitTimer(a5)
	bra.s	loc_0F451A
loc_0F4514:
	move.w	#$1E,g_SceneExitTimer(a5)
loc_0F451A:
	moveq	#$1,d0
	bra.s	loc_0F4520
loc_0F451E:
	moveq	#$0,d0
loc_0F4520:
	unlk	a6
	rts
