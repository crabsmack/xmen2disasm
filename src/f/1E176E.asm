; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_CutBoth - Cyclops_DrawBeam cut case for diagonal beams: limit x and y, then store the cut length
; In:  d4 = distance probed
; Out: none
; Evidence: Tbl_BeamCutCases entries 3-4: d6 = d7 = d4, stored to instance +$1C/+$1E
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_CutBoth:
	move.w	d4,d6
	move.w	d4,d7
loc_1E1772:
	move.w	d7,$1C(a2)
	move.w	d6,$1E(a2)
