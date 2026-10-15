; ---------------------------------------------------------------------------
; Seg_CollideObj_Ret - Seg_CollideObj exit keeping d0 (result of Seg_CollideBlock or the type hook)
; In:  d0
; Out: d0
; Evidence: restores d3-d7/a2-a4 and returns
; ---------------------------------------------------------------------------
Seg_CollideObj_Ret:
	movem.l	-$20(a6),d3-d7/a2-a4
	unlk	a6
	rts
