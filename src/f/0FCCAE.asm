; ---------------------------------------------------------------------------
; SiberiaB1_FrameHook - SiberiaB1 per-frame hook: wind and wind sprite, palette cycles, stop P1 sounds when P2 joins, demo timer (timeout -> LogoAndDemo, any button cancels)
; In:  none
; Out: none
; Evidence: g_ScnLogoAndDemo -> g_SceneIndex when $FFC6F6 reaches 0; g_Pad1Raw|g_Pad2Raw; TAS 165-1356
; ---------------------------------------------------------------------------
SiberiaB1_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.w	-$3B08(a5)
	ble.s	loc_0FCCC8
	move.w	-$3B08(a5),d0
	subq.w	#$1,-$3B08(a5)
loc_0FCCC8:
	tst.w	-$3B32(a5)
	ble.s	loc_0FCCD6
	move.w	-$3B32(a5),d0
	subq.w	#$1,-$3B32(a5)
loc_0FCCD6:
	jsr	SiberiaB1_UpdateWindSprite(pc)
	jsr	SiberiaB1_StepWind(pc)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0FCCE8
	jsr	SiberiaB1_CyclePalettes(pc)
loc_0FCCE8:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0FCD24
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.w	-$3B08(a5)
	ble.s	loc_0FCD04
	move.w	-$3B08(a5),d0
	subq.w	#$1,-$3B08(a5)
loc_0FCD04:
	tst.w	-$3B32(a5)
	ble.s	loc_0FCD12
	move.w	-$3B32(a5),d0
	subq.w	#$1,-$3B32(a5)
loc_0FCD12:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0FCD1C
	jsr	SiberiaB1_CyclePalettes(pc)
loc_0FCD1C:
	jsr	SiberiaB1_UpdateWindSprite(pc)
	jsr	SiberiaB1_StepWind(pc)
loc_0FCD24:
	tst.b	-$3BBA(a5)
	beq.s	loc_0FCDA0
	move.l	-$1750(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$360,d0
	ble.s	loc_0FCD3C
	clr.b	-$3BBA(a5)
loc_0FCD3C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0FCDA0
	moveq	#$27,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$28,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$29,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$2B,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$2C,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$2D,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$2F,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	jsr	$2322(a5)	; -> sub_0C1412
	moveq	#$27,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> sub_0C1478
	clr.b	-$3BBA(a5)
	lea.l	$20(a7),a7
loc_0FCDA0:
	tst.w	-$3B0A(a5)
	beq.s	loc_0FCDEA
	subq.w	#$1,-$3B0A(a5)
	tst.w	-$3B0A(a5)
	bne.s	loc_0FCDC6
	move.w	#$1,g_SceneExitTimer(a5)
	moveq	#$0,d0
	move.b	g_ScnLogoAndDemo(a5),d0
	move.w	d0,g_SceneIndex(a5)
	move.b	#$1,-$38C2(a5)
loc_0FCDC6:
	move.w	g_Pad2Raw(a5),d0
	or.w	g_Pad1Raw(a5),d0
	move.w	#$FF,d1
	and.w	d0,d1
	beq.s	loc_0FCDEA
	clr.w	-$3B0A(a5)
	move.w	-$3C5E(a5),d0
	btst	#$0,d0
	beq.s	loc_0FCDEA
	ori.w	#$2,-$3C5E(a5)
loc_0FCDEA:
	unlk	a6
	rts
