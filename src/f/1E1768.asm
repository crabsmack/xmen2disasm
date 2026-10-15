; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_CutVertical	[targets of the beam-direction jump tables at $1E1902 (entry 2) and $1E190C (entries 1-2) in the Cyclops beam drawer Cyclops_DrawBeam; down-beam step and vertical cut cases]
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_CutVertical:
	move.w	d4,d6
	moveq	#-$1,d7
	bra.s	loc_1E1772
