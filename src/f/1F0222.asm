; ---------------------------------------------------------------------------
; XPlayer_CheckGrabNo - XPLAYER slot +$96: base 'grab a wall/ceiling' test, always no
; In:  8(a6) = player
; Out: d0 = 0
; Evidence: XCLIMBER overrides it with XClimber_CheckGrab
; ---------------------------------------------------------------------------
XPlayer_CheckGrabNo:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
