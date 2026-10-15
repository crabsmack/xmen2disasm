; ---------------------------------------------------------------------------
; Cerebro_AnimatePalettes_CasesA - cases of the first palette sequence in Cerebro_AnimatePalettes
; In:  none
; Out: none
; Evidence: targets of Sw_064CA2
; ---------------------------------------------------------------------------
Cerebro_AnimatePalettes_CasesA:
	move.w	#$60,g_PalBase+$76(a5)
	move.w	#$40,g_PalBase+$74(a5)
	move.w	#$6,g_PalBase+$72(a5)
	move.w	#$4,g_PalBase+$70(a5)
	move.w	#$1,-$3B48(a5)
	bra.w	Cerebro_AnimatePalettes_StepB
loc_064D14:
	move.w	#$60,g_PalBase+$76(a5)
	move.w	#$40,g_PalBase+$74(a5)
	move.w	#$6,g_PalBase+$72(a5)
	move.w	#$4,g_PalBase+$70(a5)
	bra.w	Cerebro_AnimatePalettes_StepB
loc_064D30:
	move.w	#$80,g_PalBase+$76(a5)
	move.w	#$60,g_PalBase+$74(a5)
	move.w	#$8,g_PalBase+$72(a5)
	move.w	#$6,g_PalBase+$70(a5)
	bra.w	Cerebro_AnimatePalettes_StepB
loc_064D4C:
	move.w	#$80,g_PalBase+$76(a5)
	move.w	#$80,g_PalBase+$74(a5)
	move.w	#$8,g_PalBase+$72(a5)
	move.w	#$8,g_PalBase+$70(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064D66:
	move.w	#$A0,g_PalBase+$76(a5)
	move.w	#$80,g_PalBase+$74(a5)
	move.w	#$A,g_PalBase+$72(a5)
	move.w	#$8,g_PalBase+$70(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064D80:
	move.w	#$A0,g_PalBase+$76(a5)
	move.w	#$A0,g_PalBase+$74(a5)
	move.w	#$A,g_PalBase+$72(a5)
	move.w	#$A,g_PalBase+$70(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064D9A:
	move.w	#$C0,g_PalBase+$76(a5)
	move.w	#$A0,g_PalBase+$74(a5)
	move.w	#$C,g_PalBase+$72(a5)
	move.w	#$A,g_PalBase+$70(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064DB4:
	move.w	#$C0,g_PalBase+$76(a5)
	move.w	#$C0,g_PalBase+$74(a5)
	move.w	#$C,g_PalBase+$72(a5)
	move.w	#$C,g_PalBase+$70(a5)
	move.w	#$FFFF,-$3B48(a5)
