; ---------------------------------------------------------------------------
; Seg_ComputeObjPos_Done - Seg_ComputeObjPos exit (also the case for segment types without a position)
; In:  none
; Out: none
; Evidence: restores d3/a3-a4 and returns; target of Sw_1F6FF4 entries 4-12, 15-17, 28-31
; ---------------------------------------------------------------------------
Seg_ComputeObjPos_Done:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
