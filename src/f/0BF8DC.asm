; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate - Savage jungle per-frame: when the phase timer runs out step the palette phase -$3C1C (5-case switch writing palette colours) and reload the timer from the script (x 60 frames)
; In:  none
; Out: none
; Evidence: phases gate SwampFly_SpawnRecInView; g_PalBaseDirty unless fading; TAS 29691-30594
; Found: jt 1083
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate:
	link.w	a6,#$0
	move.l	d3,-(a7)
	tst.w	g_JunglePalTimer(a5)
	bne.w	loc_0BF9DE
	addq.w	#$1,g_JunglePalPhase(a5)
	move.w	g_JunglePalPhase(a5),d0
	subq.w	#$1,d0
	bmi.w	SavageJungle_PalPhaseUpdate_Done
	cmpi.w	#$4,d0
	bgt.w	SavageJungle_PalPhaseUpdate_Done
	add.w	d0,d0
	move.w	Sw_0BF8DC(pc,d0.w),d0
	jmp	Sw_0BF8DC-2(pc,d0.w)
