; ---------------------------------------------------------------------------
; Psylocke_SelectFrame - return the frame number of Psylocke's player-select sprite
; In:  none
; Out: d0 = 3
; Evidence: moveq #3,d0; called by PlayerSelect_CharFrameNum case 4, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Psylocke_SelectFrame:
	link.w	a6,#$0
	moveq	#$3,d0
	unlk	a6
	rts
