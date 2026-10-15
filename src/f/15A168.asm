; ---------------------------------------------------------------------------
; Seg_MoveAlongSteps - call Seg_MoveAlong with the object's x speed n times
; In:  8(a6) = object, $C(a6) = word steps
; Out: none
; Evidence: loop of Seg_MoveAlong(obj, +$16)
; ---------------------------------------------------------------------------
Seg_MoveAlongSteps:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	bra.s	loc_15A18A
loc_15A17A:
	move.w	$16(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Seg_MoveAlong(pc)
	addq.w	#$8,a7
loc_15A18A:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d0
	bne.s	loc_15A17A
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
