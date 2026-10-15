; ---------------------------------------------------------------------------
; CloneA2_BgPalTask - task: swap palette line 2 among four background palettes as the camera scrolls vertically
; In:  8(a6) = task
; Out: none
; Evidence: index = (g_CameraY >> 4) & 3 (changes every 16 px); on change copies jt[546..549] (16 words) to g_PalBase+$40 and sets g_PalBaseDirty; skipped during fades (-$3A02) and -$3B04; started by CloneA2_StartBgPalTask; TAS 47906-48905 every frame
; ---------------------------------------------------------------------------
CloneA2_BgPalTask:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	tst.w	-$3B04(a5)
	bne.w	loc_081FF4
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_081FF4
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_081FF4
	move.w	-$3B02(a5),d7
	move.w	g_CameraY(a5),d0
	asr.w	#$4,d0
	moveq	#$3,d1
	and.w	d0,d1
	move.w	d1,-$3B02(a5)
	cmp.w	-$3B02(a5),d7
	beq.s	loc_081FF4
	move.w	-$3B02(a5),d0
	bmi.s	CloneA2_BgPalTask_Copy
	cmpi.w	#$3,d0
	bgt.s	CloneA2_BgPalTask_Copy
	add.w	d0,d0
	move.w	$81FAC(pc,d0.w),d0
	jmp	$81FAA(pc,d0.w)
