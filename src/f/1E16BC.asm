; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_StepLevel - Cyclops_DrawBeam direction case 0 (level) and, at +8, case 1 (up): set the wall-probe step
; In:  a6 frame of Cyclops_DrawBeam
; Out: d0/d1 = step x/y, d2 = distance per step
; Evidence: targets of Tbl_BeamStepCases: (20, 0, 20) and (0, -20, 20)
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_StepLevel:
	moveq	#$14,d0
	moveq	#$0,d1
	moveq	#$14,d2
	bra.s	loc_1E16E2
loc_1E16C4:
	moveq	#$0,d0
	moveq	#-$14,d1
	moveq	#$14,d2
	bra.s	loc_1E16E2
