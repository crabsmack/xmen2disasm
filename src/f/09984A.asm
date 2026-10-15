; ---------------------------------------------------------------------------
; XClone_FrameHook - scene hook in clone-maker mode: palette flicker (CloneA2_FlickerUpdate) and the reward timer -$3B06
; In:  none
; Out: none
; Evidence: installed by XClone_StartMakerMode; TAS 52808-57465 every frame
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_099860
	jsr	$116A(a5)	; -> CloneA2_FlickerUpdate
loc_099860:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_099878
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_099878
	jsr	$116A(a5)	; -> CloneA2_FlickerUpdate
loc_099878:
	tst.w	g_SceneVar3B06(a5)
	ble.s	loc_099890
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_099888
	moveq	#$2,d0
	bra.s	loc_09988A
loc_099888:
	moveq	#$1,d0
loc_09988A:
	ext.w	d0
	sub.w	d0,g_SceneVar3B06(a5)
loc_099890:
	tst.w	g_SceneVar3B06(a5)
	bge.s	loc_09989A
	clr.w	g_SceneVar3B06(a5)
loc_09989A:
	unlk	a6
	rts
