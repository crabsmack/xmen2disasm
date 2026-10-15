; ---------------------------------------------------------------------------
; Seg_AlignObjVelocity_Store - Seg_AlignObjVelocity tail: store the new velocity and call Seg_ApplyObjPos
; In:  a4 = object, d7/d6 = vx/vy
; Out: d0
; Evidence: writes +$16/+$18, calls Seg_ApplyObjPos; also the target for types 4, $10-$12, $1D-$20
; ---------------------------------------------------------------------------
Seg_AlignObjVelocity_Store:
	move.w	d7,$16(a4)
	move.w	d6,$18(a4)
	move.l	a4,-(a7)
	jsr	Seg_ApplyObjPos(pc)
	addq.w	#$4,a7
loc_1F6FEA:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
