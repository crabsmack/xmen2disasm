; ---------------------------------------------------------------------------
; Game_TickFrameCounter - increment the game frame counter
; In:  none
; Out: d0 = long: old value
; Evidence: g_FrameCounter += 1; jt 2545, reached indirectly
; ---------------------------------------------------------------------------
Game_TickFrameCounter:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	unlk	a6
	rts
