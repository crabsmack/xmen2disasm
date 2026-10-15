; ---------------------------------------------------------------------------
; Seg_AlignObjVelocity_Slope - Seg_AlignObjVelocity case for sloped segments (types 3, $E, $F, $21): vy = slope * vx
; In:  a3 = segment, a4 = object
; Out: d6/d7 = new vy/vx
; Evidence: target of Sw_1F6EC4 entries 2, 13, 14, 32
; ---------------------------------------------------------------------------
Seg_AlignObjVelocity_Slope:
	move.w	$4(a3),d0
	muls.w	$16(a4),d0
	move.l	d0,d6
	asr.l	#$8,d6
	move.w	$16(a4),d7
	bra.s	Seg_AlignObjVelocity_Store
