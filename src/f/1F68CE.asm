; ---------------------------------------------------------------------------
; Pal_FadeOutWait - save the base palette and cycle script, fade to black waiting until done, then clear the base palette
; In:  8(a6) = fade delay
; Out: none
; Evidence: Pal_SaveBase, Pal_SaveCycle, Pal_StartFadeDelay(7, delay, -1, Tbl_FadeBlack), wait, Pal_ClearBase; caller Teleporter_StateTeleport
; ---------------------------------------------------------------------------
Pal_FadeOutWait:
	link.w	a6,#$0
	clr.b	g_PalBaseDirty(a5)
	jsr	Pal_SaveBase(pc)
	jsr	Pal_SaveCycle(pc)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	Pal_StartFadeDelay(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F6900
loc_1F68FC:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_1F6900:
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_1F68FC
	jsr	Pal_ClearBase(pc)
	unlk	a6
	rts
