; ---------------------------------------------------------------------------
; Seg_ComputeLength_Flat - Seg_ComputeLength case for flat floors (types $13-$1C): length = |dx|
; In:  a4 = segment, d7 = |dx|
; Out: none
; Evidence: target of Sw_1F79A2
; ---------------------------------------------------------------------------
Seg_ComputeLength_Flat:
	move.w	d7,$6(a4)
	bra.s	loc_1F7A94
