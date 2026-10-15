; ---------------------------------------------------------------------------
; Seg_SetLayerFromObj - set a floor segment's layer byte (+2) from its object's layer (+$42)
; In:  8(a6) = object   $C(a6) = segment
; Out: none
; Evidence: segment+2 = object+$42; callback of Obj_InheritLayer via Seg_ForEachOfObj
; ---------------------------------------------------------------------------
Seg_SetLayerFromObj:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	movea.l	$C(a6),a1
	move.b	$42(a0),$2(a1)
	unlk	a6
	rts
