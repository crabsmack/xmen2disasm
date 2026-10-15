; ---------------------------------------------------------------------------
; XPlayer_OutsideActiveWindow - XPLAYER slot +$42: players never leave the active window
; In:  none
; Out: d0 = 0
; Evidence: returns 0 so Actor_Update never deactivates a player
; ---------------------------------------------------------------------------
XPlayer_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
