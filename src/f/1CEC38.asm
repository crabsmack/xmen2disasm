; ---------------------------------------------------------------------------
; Magneto_SelectFrame - return the frame number of Magneto's player-select sprite
; In:  none
; Out: d0 = 5
; Evidence: moveq #5,d0; called by PlayerSelect_CharFrameNum case 6, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Magneto_SelectFrame:
	link.w	a6,#$0
	moveq	#$5,d0
	unlk	a6
	rts
