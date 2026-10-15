; ---------------------------------------------------------------------------
; VDP_FrameUpdate - once-per-frame V-blank video work: palette fade/upload, scroll registers, queued DMA, then the sprite flicker helper
; In:  none
; Out: none
; Evidence: byte -$3A08 = 1; guard byte -$3A0C (cleared by VDP_WaitVBlank) makes it run once per frame: Pal_Update, VDP_UpdateScroll, and if byte -$1D4A set: clear it, VDP_FlushDmaQueue, -$3A0A = 1; always calls sub_1E1928; jt 2591 with no static caller (reached indirectly), active every TAS frame from 7
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
	jsr	$49DA(a5)	; -> sub_1E1928
	unlk	a6
	rts
