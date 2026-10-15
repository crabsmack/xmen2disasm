; ---------------------------------------------------------------------------
; AvalonB1_FrameHook - AvalonB1 per-frame hook: advance the frame counters and the palette cycles
; In:  none
; Out: none
; Evidence: installed in -$388E (scene frame hook) by AvalonB1_RunScene; g_FrameCounter and -$3B32 += 1 (2 when -$38DE); AvalonB1_CyclePalettes; TAS frames 10316-11480
; ---------------------------------------------------------------------------
AvalonB1_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	move.w	-$3B32(a5),d0
	addq.w	#$1,-$3B32(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_00FDA2
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	move.w	-$3B32(a5),d0
	addq.w	#$1,-$3B32(a5)
loc_00FDA2:
	jsr	AvalonB1_CyclePalettes(pc)
	unlk	a6
	rts
