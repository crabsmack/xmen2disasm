; ---------------------------------------------------------------------------
; CloneA2_BgPalTimer - timer callback (every frame): swap palette line 2 among four background palettes as the camera scrolls vertically
; In:  8(a6) = timer argument (the timer itself)
; Out: none
; Evidence: index = (g_CameraY >> 4) & 3 (changes every 16 px); on change copies jt[546..549] (16 words) to g_PalBase+$40 and sets g_PalBaseDirty; skipped during fades (-$3A02) and -$3B04; started by CloneA2_StartBgPalTimer; TAS 47906-48905 every frame
; ---------------------------------------------------------------------------
CloneA2_BgPalTimer:
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
	bmi.s	CloneA2_BgPalTimer_Copy
	cmpi.w	#$3,d0
	bgt.s	CloneA2_BgPalTimer_Copy
	add.w	d0,d0
	move.w	Sw_081F62(pc,d0.w),d0
	jmp	Sw_081F62-2(pc,d0.w)
