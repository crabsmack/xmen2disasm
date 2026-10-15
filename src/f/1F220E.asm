; ---------------------------------------------------------------------------
; XPlayer_ClassInit - XPLAYER slot +$5E: empty
; In:  none
; Out: none
; Evidence: bare link/unlk/rts
; ---------------------------------------------------------------------------
XPlayer_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
