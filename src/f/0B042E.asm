; ---------------------------------------------------------------------------
; SavageA3_FrameHook - SavageA3 per-frame scene hook: counter, light animation (SavageA2_AnimLights), empty stub; twice at half rate
; In:  none
; Out: none
; Evidence: installed by SavageA3_InstallFrameHook; TAS 32205-33097
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	$1C02(a5)	; -> SavageA2_AnimLights
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0B0448
	jsr	SavageA3_FrameStub(pc)
loc_0B0448:
	tst.b	-$38DE(a5)
	beq.s	loc_0B0464
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	$1C02(a5)	; -> SavageA2_AnimLights
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0B0464
	jsr	SavageA3_FrameStub(pc)
loc_0B0464:
	unlk	a6
	rts
