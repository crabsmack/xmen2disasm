; ---------------------------------------------------------------------------
; Seg_ApplyObjPos_Store - Seg_ApplyObjPos tail: store the computed pixel position into the object's 16.16 x/y
; In:  a3 = object, d5/d6 = x/y pixels
; Out: none
; Evidence: +8 = d5 << 8, +$C = d6 << 8; also the target for types $10-$12 and $1D-$20 (position unchanged)
; ---------------------------------------------------------------------------
Seg_ApplyObjPos_Store:
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a3)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a3)
loc_1F6EBA:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
