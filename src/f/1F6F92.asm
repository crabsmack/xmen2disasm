; ---------------------------------------------------------------------------
; Seg_AlignObjVelocity_Reverse - Seg_AlignObjVelocity case for type $22 (reversed segment): negated vx and slope
; In:  a3 = segment, a4 = object
; Out: d6/d7
; Evidence: target of Sw_1F6EC4 entry 33
; ---------------------------------------------------------------------------
Seg_AlignObjVelocity_Reverse:
	move.w	$4(a3),d0
	muls.w	$16(a4),d0
	neg.l	d0
	move.l	d0,d6
	asr.l	#$8,d6
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,d7
	bra.s	Seg_AlignObjVelocity_Store
loc_1F6FAC:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,d6
	move.w	$4(a3),d0
	muls.w	$18(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	bra.s	Seg_AlignObjVelocity_Store
loc_1F6FC4:
	move.w	$16(a4),d6
	move.w	$4(a3),d0
	muls.w	$18(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	bra.s	Seg_AlignObjVelocity_Store
