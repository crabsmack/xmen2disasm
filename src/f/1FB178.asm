; ---------------------------------------------------------------------------
; Obj_ShiftTree - move an object and all its attached children by the shift delta (-$CA8, -$CAA) and refresh their boxes
; In:  8(a6) = unused (parent, callback form)   $C(a6) = object
; Out: none
; Evidence: x += word -$CA8(a5) << 8, y += word -$CAA(a5) << 8, Obj_UpdateBoxes, then Obj_ForEachChild(obj, Obj_ShiftTree); Spr_PlaceAttached sets the deltas
; ---------------------------------------------------------------------------
Obj_ShiftTree:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	move.w	-$CA8(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	move.w	-$CAA(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	addq.w	#$4,a7
	beq.s	loc_1FB1BA
	pea.l	Obj_ShiftTree(pc)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> Obj_ForEachChild
	addq.w	#$8,a7
loc_1FB1BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
