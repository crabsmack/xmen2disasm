; ---------------------------------------------------------------------------
; Pal_FadeInWait - restore the saved base palette and fade in from black, waiting until done, then restore the palette-cycle script
; In:  8(a6) = fade delay
; Out: none
; Evidence: g_PalBaseDirty = 0, Pal_RestoreBase, Pal_StartFadeDelay(0, delay, -1, Tbl_FadeBlack), VDP_WaitVBlank until g_PalFadeActive = 0, Pal_RestoreCycle; caller Teleporter_StateArrive
; ---------------------------------------------------------------------------
Pal_FadeInWait:
	link.w	a6,#$0
	clr.b	g_PalBaseDirty(a5)
	jsr	Pal_RestoreBase(pc)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	Pal_StartFadeDelay(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F693C
loc_1F6938:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_1F693C:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_1F6938
	jsr	Pal_RestoreCycle(pc)
	unlk	a6
	rts
