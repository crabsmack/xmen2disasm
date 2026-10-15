; ---------------------------------------------------------------------------
; Seg_ObjPosUnclamped_Reverse - Seg_ObjPosUnclamped case for reversed segments (types 4/$22): +$72 = (x2 - x) << 8
; In:  a3 = segment, a4 = object
; Out: none
; Evidence: target of Sw_1F71F2 entries 3, 33
; ---------------------------------------------------------------------------
Seg_ObjPosUnclamped_Reverse:
	move.w	$C(a3),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
	bra.s	Seg_ObjPosUnclamped_Done
loc_1F72CC:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	$A(a3),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
	bra.s	Seg_ObjPosUnclamped_Done
loc_1F72E2:
	move.w	$E(a3),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
