; ---------------------------------------------------------------------------
; Cerebro_AnimatePalettes_CasesB - cases of the second palette sequence in Cerebro_AnimatePalettes
; In:  none
; Out: none
; Evidence: targets of Sw_064DD2
; ---------------------------------------------------------------------------
Cerebro_AnimatePalettes_CasesB:
	move.w	#$A20,g_PalBase+$E(a5)
	move.w	#$62C,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E22:
	move.w	#$A20,g_PalBase+$E(a5)
	move.w	#$62A,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E30:
	move.w	#$820,g_PalBase+$E(a5)
	move.w	#$628,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E3E:
	move.w	#$820,g_PalBase+$E(a5)
	move.w	#$62A,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E4C:
	move.w	#$620,g_PalBase+$E(a5)
	move.w	#$62C,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E5A:
	move.w	#$620,g_PalBase+$E(a5)
	move.w	#$62A,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E68:
	move.w	#$820,g_PalBase+$E(a5)
	move.w	#$628,g_PalBase+$1E(a5)
	bra.s	Cerebro_AnimatePalettes_EndB
loc_064E76:
	move.w	#$820,g_PalBase+$E(a5)
	move.w	#$62A,g_PalBase+$1E(a5)
