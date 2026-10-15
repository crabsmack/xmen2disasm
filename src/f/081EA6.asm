; ---------------------------------------------------------------------------
; CloneA2_InstallHooks - install the CloneA2 per-frame hooks, load resources, init flicker, place players
; In:  none
; Out: none
; Evidence: -$3402 := jt[$3F22] (sub_15ADEC), -$388E := CloneA2_FrameHook; calls CloneA2_LoadResources, CloneA2_FlickerInit, Players_PlaceAtStart(0,0,0,0); TAS frame 47900
; ---------------------------------------------------------------------------
CloneA2_InstallHooks:
	link.w	a6,#$0
	lea.l	$3F22(a5),a0
	move.l	a0,-$3402(a5)
	lea.l	CloneA2_FrameHook(pc),a0
	move.l	a0,-$388E(a5)
	jsr	CloneA2_LoadResources(pc)
	jsr	CloneA2_FlickerInit(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	unlk	a6
	rts
