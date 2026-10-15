; ---------------------------------------------------------------------------
; Seg_ObjPosUnclamped_Done - Seg_ObjPosUnclamped exit (also the case for types without a position)
; In:  none
; Out: none
; Evidence: restores a3-a4 and returns
; ---------------------------------------------------------------------------
Seg_ObjPosUnclamped_Done:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
