; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate_Done - tail of SavageJungle_PalPhaseUpdate: mark the palette dirty and reload the timer
; Evidence: switch exit
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate_Done:
	moveq	#$3C,d0
	muls.w	g_JunglePalTimer(a5),d0
	move.w	d0,g_JunglePalTimer(a5)
	tst.b	g_PalFadeActive(a5)
	seq.b	d3
	neg.b	d3
	move.b	d3,g_PalBaseDirty(a5)
loc_0BF9DE:
	subq.w	#$1,g_JunglePalTimer(a5)
	move.l	-$4(a6),d3
	unlk	a6
	rts
