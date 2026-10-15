; ---------------------------------------------------------------------------
; SentinelsD1_InstallHooks - SentinelsD1: install the frame hook, load resources, light, flag bits, place the players
; In:  none
; Out: none
; Evidence: g_SceneFrameHook := SentinelsD1_FrameHook; Players_PlaceAtStart(0,0,0,0); TAS 2498
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelsD1_InstallHooks:
	link.w	a6,#$0
	lea.l	SentinelsD1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	SentinelsD1_LoadResources(pc)
	jsr	SentinelsD1_InitLight(pc)
	jsr	SentinelsD1_InitFlagBits(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	unlk	a6
	rts
