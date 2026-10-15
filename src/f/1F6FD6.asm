; ---------------------------------------------------------------------------
; Seg_AlignObjVelocity_Flat - Seg_AlignObjVelocity case for flat floors (types $13-$1C): keep vx, vy = 0
; In:  a4 = object
; Out: d7 = vx, d6 = 0
; Evidence: target of Sw_1F6EC4 entries 18-27
; ---------------------------------------------------------------------------
Seg_AlignObjVelocity_Flat:
	move.w	$16(a4),d7
