; ---------------------------------------------------------------------------
; Seg_CollideObj_RetNone - Seg_CollideObj exit: return 1 (no contact)
; In:  none
; Out: d0 = 1
; Evidence: default target of Tbl_SegCollideCases
; ---------------------------------------------------------------------------
Seg_CollideObj_RetNone:
	moveq	#$1,d0
	movem.l	-$20(a6),d3-d7/a2-a4
	unlk	a6
	rts
