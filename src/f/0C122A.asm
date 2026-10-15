; ---------------------------------------------------------------------------
; SavageB1_FrameHook - SavageB1 per-frame scene hook: music player parameters and the jungle palette phases
; In:  none
; Out: none
; Evidence: Music_SetPlayerParams, SavageJungle_PalPhaseUpdate; TAS 29691-30594
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageB1_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0C1244
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_0C1244:
	moveq	#$1F,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_0C1250
	jsr	Music_SetPlayerParams(pc)
loc_0C1250:
	jsr	$21FA(a5)	; -> SavageJungle_PalPhaseUpdate
	unlk	a6
	rts
