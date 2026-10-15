; ---------------------------------------------------------------------------
; VDP_FrameUpdate - V-int system hook: once-per-frame video work (palette fade/upload, scroll registers, queued DMA, sprite flicker helper)
; In:  none
; Out: none
; Evidence: installed as g_VBlankHook (jt $511A) by Sys_InitGameVideo, so Irq_VBlank calls it every V-int; byte -$3A08 = 1; guard g_FrameUpdated (cleared by VDP_WaitVBlank) makes the work run once per game frame: Pal_Update, VDP_UpdateScroll, and if g_DmaFlushReq: clear it, VDP_FlushDmaQueue, -$3A0A = 1; always calls Cyclops_BeamVBlankFlicker
; ---------------------------------------------------------------------------
VDP_FrameUpdate:
	link.w	a6,#$0
	move.b	#$1,-$3A08(a5)
	tst.b	g_FrameUpdated(a5)
	bne.s	loc_1FDCC2
	move.b	#$1,g_FrameUpdated(a5)
	jsr	Pal_Update(pc)
	jsr	$4DEA(a5)	; -> VDP_UpdateScroll
	tst.b	g_DmaFlushReq(a5)
	beq.s	loc_1FDCC2
	clr.b	g_DmaFlushReq(a5)
	jsr	$51E2(a5)	; -> VDP_FlushDmaQueue
	move.b	#$1,-$3A0A(a5)
loc_1FDCC2:
	jsr	$49DA(a5)	; -> Cyclops_BeamVBlankFlicker
	unlk	a6
	rts
