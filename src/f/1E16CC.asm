; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_StepDown - Cyclops_DrawBeam direction case 2 (down): wall-probe step (0, +20, 20)
; In:  a6 frame of Cyclops_DrawBeam
; Out: d0/d1 = step x/y, d2 = distance per step
; Evidence: Tbl_BeamStepCases entry 2; not reached in the corpus
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_StepDown:
	moveq	#$0,d0
	moveq	#$14,d1
	moveq	#$14,d2
	bra.s	loc_1E16E2
