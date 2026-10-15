; ---------------------------------------------------------------------------
; Nightcrawler_SelectFrame - return the frame number of Nightcrawler's player-select sprite
; In:  none
; Out: d0 = 6
; Evidence: moveq #6,d0; called by PlayerSelect_CharFrameNum case 3, PlayerSelect_LoadCharFrame and PlayerSelect_AllocCharBuffers_Cases
; ---------------------------------------------------------------------------
Nightcrawler_SelectFrame:
	link.w	a6,#$0
	moveq	#$6,d0
	unlk	a6
	rts
