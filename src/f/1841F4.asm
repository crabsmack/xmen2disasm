; ---------------------------------------------------------------------------
; Beast_SelectFrame - return the frame number of Beast's player-select sprite
; In:  none
; Out: d0 = 8
; Evidence: moveq #8,d0; called by PlayerSelect_CharFrameNum case 0, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Beast_SelectFrame:
	link.w	a6,#$0
	moveq	#$8,d0
	unlk	a6
	rts
