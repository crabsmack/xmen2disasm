; ---------------------------------------------------------------------------
; Pause_Loop - paused: wait frame by frame running the pause input until a resume is requested
; In:  none
; Out: none
; Evidence: clears the direction/button latch bits $F0, then loop {g_DmaFlushReq = 1, Pause_HandleInput, VDP_WaitVBlank} until g_PauseExit
; ---------------------------------------------------------------------------
Pause_Loop:
	link.w	a6,#$0
	move.w	#$FF0F,d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	move.w	#$FF0F,d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_15CA88:
	clr.b	g_FrameTick(a5)
	move.b	#$1,g_DmaFlushReq(a5)
	jsr	Pause_HandleInput(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	tst.b	g_PauseExit(a5)
	beq.s	loc_15CA88
	unlk	a6
	rts
