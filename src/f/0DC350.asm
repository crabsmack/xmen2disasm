; ---------------------------------------------------------------------------
; SentinelsD1_FrameHook - SentinelsD1 per-frame scene hook: camera bound +$42 = 200, counter, light animation (twice with g_TwoPlayerStep)
; In:  none
; Out: d0
; Evidence: installed by SentinelsD1_InstallHooks; TAS 2515-4894
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelsD1_FrameHook:
	link.w	a6,#$0
	movea.l	g_Camera(a5),a0
	move.w	#$C8,$42(a0)
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0DC370
	jsr	SentinelsD1_AnimLight(pc)
loc_0DC370:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0DC388
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0DC388
	jsr	SentinelsD1_AnimLight(pc)
loc_0DC388:
	unlk	a6
	rts
