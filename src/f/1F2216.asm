; ---------------------------------------------------------------------------
; XPlayer_LevelStart - XPLAYER slot +$62: empty
; In:  none
; Out: none
; Evidence: bare link/unlk/rts
; ---------------------------------------------------------------------------
XPlayer_LevelStart:
	link.w	a6,#$0
	unlk	a6
	rts
