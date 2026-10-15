; ---------------------------------------------------------------------------
; Player1_StartLife_Beast - switch cases 0 (Beast) and 1 (Cyclops) of Player1_StartLife
; In:  d7 = character index
; Out: none (joins the common tail)
; Evidence: targets of the jump table at $0062A2 in Player1_StartLife; call Player1_SetBeast / Player1_SetCyclops
; ---------------------------------------------------------------------------
Player1_StartLife_Beast:
	jsr	Player1_SetBeast(pc)
	bra.s	$62D0
Player1_StartLife_Cyclops:
	jsr	Player1_SetCyclops(pc)
	bra.s	$62D0
