; ---------------------------------------------------------------------------
; SentinelsA1_FrameHook - SentinelsA1 per-frame hook: count the frame, tick the light timer, cycle palettes (unless paused) and step the zap lights; twice at half rate
; In:  none
; Out: none
; Evidence: installed in $FFC972; frame counter $FFCC5E; TAS every frame 7578-9543
; ---------------------------------------------------------------------------
SentinelsA1_FrameHook:
	link.w	a6,#$0
	move.l	d7,-(a7)
	tst.b	-$38DE(a5)
	beq.s	loc_0E786E
	moveq	#$2,d0
	bra.s	loc_0E7870
loc_0E786E:
	moveq	#$1,d0
loc_0E7870:
	move.l	d0,d7
loc_0E7872:
	addq.l	#$1,g_FrameCounter(a5)
	tst.l	-$3B18(a5)
	ble.s	loc_0E7880
	subq.l	#$1,-$3B18(a5)
loc_0E7880:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0E788A
	jsr	SentinelsA1_CyclePalettes(pc)
loc_0E788A:
	jsr	SentinelsA1_StepZapLights(pc)
	subq.l	#$1,d7
	bne.s	loc_0E7872
	move.l	-$4(a6),d7
	unlk	a6
	rts
