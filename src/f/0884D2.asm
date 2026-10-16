; ---------------------------------------------------------------------------
; CloneA5_ResetPalCycle - CloneA5: clear the three palette-cycle counters g_CloneA5PalTimer/Colour/Seq
; In:  none
; Out: none
; Evidence: counters passed to Pal_CycleStep by CloneA5_FrameHook; caller CloneA5_RunScene; TAS 49256
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_ResetPalCycle:
	link.w	a6,#$0
	clr.w	g_CloneA5PalTimer(a5)
	clr.w	g_CloneA5PalColour(a5)
	clr.w	g_CloneA5PalSeq(a5)
	unlk	a6
	rts
