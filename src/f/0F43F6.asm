; ---------------------------------------------------------------------------
; SentinelsB1_InstallHooks - SentinelsB1: frame hook, Sentinels stage helpers, place players
; In:  none
; Out: none
; Evidence: $FFC972 = SentinelsB1_FrameHook; calls sub_0DC394/sub_0DC316/sub_0DC294 (SentinelsD1 module), Players_PlaceAtStart, GaussBullet_InitPool
; ---------------------------------------------------------------------------
SentinelsB1_InstallHooks:
	link.w	a6,#$0
	lea.l	SentinelsB1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	SentinelsB1_EmptyStub(pc)
	jsr	$240A(a5)	; -> sub_0DC394
	jsr	$23FA(a5)	; -> sub_0DC316
	jsr	$23E2(a5)	; -> sub_0DC294
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	unlk	a6
	rts
