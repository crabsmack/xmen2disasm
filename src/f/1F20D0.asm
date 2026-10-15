; ---------------------------------------------------------------------------
; XPlayer_Nop72 - XPLAYER slot +$72: empty per-frame hook after the state (characters override)
; In:  none
; Out: none
; Evidence: called by XPlayer_Update after the state function; Beast/Psylocke/Gambit override
; ---------------------------------------------------------------------------
XPlayer_Nop72:
	link.w	a6,#$0
	unlk	a6
	rts
