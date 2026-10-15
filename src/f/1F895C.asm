; ---------------------------------------------------------------------------
; Seg_CollideObj_Trigger - Seg_CollideObj case for type $1D: a player (index < 2) overlapping the segment box raises contact event 2
; In:  a2 = contact, a3 = segment, a4 = object
; Out: d0 = 2 on overlap, else 1
; Evidence: Tbl_SegCollideCases entry $1D; contact +7 = 2, flags |= $8000
; ---------------------------------------------------------------------------
Seg_CollideObj_Trigger:
	cmpi.b	#$2,$15(a4)
	bge.w	Seg_CollideObj_RetNone
	move.w	$4C(a4),d0
	cmp.w	$E(a3),d0
	bge.w	Seg_CollideObj_RetNone
	move.w	$4E(a4),d0
	cmp.w	$C(a3),d0
	bge.w	Seg_CollideObj_RetNone
	move.w	$52(a4),d0
	cmp.w	$8(a3),d0
	blt.w	Seg_CollideObj_RetNone
	move.w	$50(a4),d0
	cmp.w	$A(a3),d0
	ble.w	Seg_CollideObj_RetNone
	move.b	#$2,$7(a2)
	ori.w	#$8000,(a2)
	bra.w	Seg_CollideObj_RetHit
