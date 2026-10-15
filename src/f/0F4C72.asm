; ---------------------------------------------------------------------------
; SentinelsB2_InstallHooks - SentinelsB2: frame hook, digit graphics, alarm reset, place players at (2480,324), start the escape countdown at 1350, camera shake
; In:  none
; Out: none
; Evidence: $FFC972 = SentinelsB2_FrameHook; countdown $FFC6FE = $546; g_CamShake
; ---------------------------------------------------------------------------
SentinelsB2_InstallHooks:
	link.w	a6,#$0
	lea.l	SentinelsB2_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	$23FA(a5)	; -> SentinelsD1_InitLight
	move.b	#$1,g_HudOn(a5)
	jsr	SentinelsB2_LoadDigits(pc)
	jsr	SentinelsB2_ResetAlarm(pc)
	pea.l	($13A).w
	pea.l	($9A6).w
	pea.l	($144).w
	pea.l	($9B0).w
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	#$546,g_SceneVar3B02(a5)
	clr.w	g_SceneVar3B08(a5)
	lea.l	$2632(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	unlk	a6
	rts
