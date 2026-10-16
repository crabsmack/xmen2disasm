; ---------------------------------------------------------------------------
; Irq_VBlank - V-int handler (hook $210): read pads, count frames and call the system and game V-blank hooks
; In:  none
; Out: none
; Evidence: Pad_ReadBoth; long g_VBlankCount(a5) += 1; calls pointer g_VBlankHook(a5) if set; calls pointer g_VBlankGameHook(a5) unless byte -$38C0 or -$359E is set; clears byte g_VBlankFrameDone
; ---------------------------------------------------------------------------
Irq_VBlank:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.b	g_FrameUpdated(a5),d7
	jsr	$51B2(a5)	; -> Pad_ReadBoth
	addq.l	#$1,g_VBlankCount(a5)
	tst.l	g_VBlankHook(a5)
	beq.s	loc_1FDCE8
	movea.l	g_VBlankHook(a5),a0
	jsr	(a0)
loc_1FDCE8:
	tst.b	g_GameHookOff(a5)
	bne.s	loc_1FDD00
	tst.b	g_GameHookOff2(a5)
	bne.s	loc_1FDD00
	tst.l	g_VBlankGameHook(a5)
	beq.s	loc_1FDD00
	movea.l	g_VBlankGameHook(a5),a0
	jsr	(a0)
loc_1FDD00:
	clr.b	g_VBlankFrameDone(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
