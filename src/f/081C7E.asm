; ---------------------------------------------------------------------------
; CloneA2_FlickerUpdate_Color15Case0 - switch cases of CloneA2_FlickerUpdate: pick the colour-15 value ($A0/$80/$A0/$C0/$A0/$80)
; Evidence: targets of the 6-entry switch at $081C72 in CloneA2_FlickerUpdate; fall into CloneA2_FlickerUpdate_SetColor15
; ---------------------------------------------------------------------------
CloneA2_FlickerUpdate_Color15Case0:
	move.l	#$A0,d7
	bra.s	CloneA2_FlickerUpdate_SetColor15
loc_081C86:
	move.l	#$80,d7
	bra.s	CloneA2_FlickerUpdate_SetColor15
loc_081C8E:
	move.l	#$A0,d7
	bra.s	CloneA2_FlickerUpdate_SetColor15
loc_081C96:
	move.l	#$C0,d7
	bra.s	CloneA2_FlickerUpdate_SetColor15
loc_081C9E:
	move.l	#$A0,d7
	bra.s	CloneA2_FlickerUpdate_SetColor15
loc_081CA6:
	move.l	#$80,d7
