; ---------------------------------------------------------------------------
; SavageC1_FrameHook - SavageC1 per-frame scene hook: counter, refresh the music's player-character parameters (31 of every 32 frames)
; In:  none
; Out: d0
; Evidence: Music_SetPlayerParams; installed by SavageC1_InstallHooks; TAS 27885-29372
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageC1_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0C0E44
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_0C0E44:
	moveq	#$1F,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_0C0E50
	jsr	Music_SetPlayerParams(pc)
loc_0C0E50:
	unlk	a6
	rts
