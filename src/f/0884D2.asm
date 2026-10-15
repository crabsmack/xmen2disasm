; ---------------------------------------------------------------------------
; CloneA5_ResetPalCycle - CloneA5: clear the three palette-cycle counters -$3C50/-$3C52/-$3C54
; In:  none
; Out: none
; Evidence: counters passed to Pal_CycleStep by CloneA5_FrameHook; caller CloneA5_RunScene; TAS 49256
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_ResetPalCycle:
	link.w	a6,#$0
	clr.w	g_CloneA5PalCycles+$4(a5)
	clr.w	g_CloneA5PalCycles+$2(a5)
	clr.w	g_CloneA5PalCycles(a5)
	unlk	a6
	rts
