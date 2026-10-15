; ---------------------------------------------------------------------------
; Cyclops_SelectFrame - return the frame number of Cyclops's player-select sprite
; In:  none
; Out: d0 = 9
; Evidence: moveq #9,d0; called by PlayerSelect_CharFrameNum case 1, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Cyclops_SelectFrame:
	link.w	a6,#$0
	moveq	#$9,d0
	unlk	a6
	rts
