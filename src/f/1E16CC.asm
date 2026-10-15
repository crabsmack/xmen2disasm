; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_StepDown	[targets of the beam-direction jump tables at $1E1902 (entry 2) and $1E190C (entries 1-2) in the Cyclops beam drawer Cyclops_DrawBeam; down-beam step and vertical cut cases]
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_StepDown:
	moveq	#$0,d0
	moveq	#$14,d1
	moveq	#$14,d2
	bra.s	loc_1E16E2
