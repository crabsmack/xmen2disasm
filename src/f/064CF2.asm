; ---------------------------------------------------------------------------
; Cerebro_AnimatePalettes_CasesA - cases of the first palette sequence in Cerebro_AnimatePalettes
; In:  none
; Out: none
; Evidence: targets of Sw_064CA2
; ---------------------------------------------------------------------------
Cerebro_AnimatePalettes_CasesA:
	move.w	#$60,-$390A(a5)
	move.w	#$40,-$390C(a5)
	move.w	#$6,-$390E(a5)
	move.w	#$4,-$3910(a5)
	move.w	#$1,-$3B48(a5)
	bra.w	Cerebro_AnimatePalettes_StepB
loc_064D14:
	move.w	#$60,-$390A(a5)
	move.w	#$40,-$390C(a5)
	move.w	#$6,-$390E(a5)
	move.w	#$4,-$3910(a5)
	bra.w	Cerebro_AnimatePalettes_StepB
loc_064D30:
	move.w	#$80,-$390A(a5)
	move.w	#$60,-$390C(a5)
	move.w	#$8,-$390E(a5)
	move.w	#$6,-$3910(a5)
	bra.w	Cerebro_AnimatePalettes_StepB
loc_064D4C:
	move.w	#$80,-$390A(a5)
	move.w	#$80,-$390C(a5)
	move.w	#$8,-$390E(a5)
	move.w	#$8,-$3910(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064D66:
	move.w	#$A0,-$390A(a5)
	move.w	#$80,-$390C(a5)
	move.w	#$A,-$390E(a5)
	move.w	#$8,-$3910(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064D80:
	move.w	#$A0,-$390A(a5)
	move.w	#$A0,-$390C(a5)
	move.w	#$A,-$390E(a5)
	move.w	#$A,-$3910(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064D9A:
	move.w	#$C0,-$390A(a5)
	move.w	#$A0,-$390C(a5)
	move.w	#$C,-$390E(a5)
	move.w	#$A,-$3910(a5)
	bra.s	Cerebro_AnimatePalettes_StepB
loc_064DB4:
	move.w	#$C0,-$390A(a5)
	move.w	#$C0,-$390C(a5)
	move.w	#$C,-$390E(a5)
	move.w	#$C,-$3910(a5)
	move.w	#$FFFF,-$3B48(a5)
