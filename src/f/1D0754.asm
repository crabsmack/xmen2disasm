; ---------------------------------------------------------------------------
; Gambit_SelectFrame - return the frame number of Gambit's player-select sprite
; In:  none
; Out: d0 = 19
; Evidence: moveq #19,d0; called by PlayerSelect_CharFrameNum case 2, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Gambit_SelectFrame:
	link.w	a6,#$0
	moveq	#$13,d0
	unlk	a6
	rts
