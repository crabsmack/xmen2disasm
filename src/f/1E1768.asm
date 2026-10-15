; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_CutVertical - Cyclops_DrawBeam cut case for vertical beams: limit y only
; In:  d4 = distance probed
; Out: none
; Evidence: Tbl_BeamCutCases entries 1-2: d6 = d4, d7 = -1 (x unlimited); not reached in the corpus
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_CutVertical:
	move.w	d4,d6
	moveq	#-$1,d7
	bra.s	loc_1E1772
