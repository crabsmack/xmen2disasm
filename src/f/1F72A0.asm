; ---------------------------------------------------------------------------
; Seg_ObjPosUnclamped_Horiz - Seg_ObjPosUnclamped case for horizontal-ish segments: +$72 = (x - x1) << 8
; In:  a3 = segment, a4 = object
; Out: none
; Evidence: target of Sw_1F71F2 entries 2, 13, 14, 18-27, 32
; ---------------------------------------------------------------------------
Seg_ObjPosUnclamped_Horiz:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$8(a3),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
	bra.s	Seg_ObjPosUnclamped_Done
