; ---------------------------------------------------------------------------
; Player1_StartLife_Nightcrawler - switch case 3 (Nightcrawler) of Player1_StartLife
; In:  d7 = character index
; Out: none
; Evidence: jump table $0062A2 entry 3 -> Player1_SetNightcrawler
; ---------------------------------------------------------------------------
Player1_StartLife_Nightcrawler:
	jsr	Player1_SetNightcrawler(pc)
	bra.s	$62D0
