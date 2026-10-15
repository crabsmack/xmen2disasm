; ---------------------------------------------------------------------------
; Seg_ComputeSlope_Flat - Seg_ComputeSlope case for flat floors: slope 0
; In:  a4 = segment
; Out: none
; Evidence: target of Sw_1F7AF8
; ---------------------------------------------------------------------------
Seg_ComputeSlope_Flat:
	clr.w	$4(a4)
	bra.s	loc_1F7BAC
