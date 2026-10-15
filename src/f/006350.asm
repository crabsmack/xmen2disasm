; ---------------------------------------------------------------------------
; Player2_StartLife_Beast - switch cases 0-3 (Beast, Cyclops, Gambit, Nightcrawler) of Player2_StartLife
; In:  d7 = character index
; Out: none
; Evidence: jump table $006344 entries 0-3 -> Player2_SetBeast/Cyclops/Gambit/Nightcrawler, then the common tail
; ---------------------------------------------------------------------------
Player2_StartLife_Beast:
	jsr	Player2_SetBeast(pc)
	bra.s	$6372
loc_006356:
	jsr	Player2_SetCyclops(pc)
	bra.s	$6372
loc_00635C:
	jsr	Player2_SetGambit(pc)
	bra.s	$6372
loc_006362:
	jsr	Player2_SetNightcrawler(pc)
	bra.s	$6372
