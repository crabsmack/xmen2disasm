; ---------------------------------------------------------------------------
; Obj_InheritLayer - copy a parent's layer byte (+$42) to an object, its children and its floor segments
; In:  8(a6) = parent   $C(a6) = object
; Out: none
; Evidence: obj+$42 = parent+$42; Obj_ForEachChild(obj, Obj_InheritLayer); Seg_ForEachOfObj(obj, Seg_SetLayerFromObj); +$42 is the layer DrawList_Add sorts by
; ---------------------------------------------------------------------------
Obj_InheritLayer:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	movea.l	$8(a6),a0
	move.b	$42(a0),$42(a4)
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F7982
	pea.l	Obj_InheritLayer(pc)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> Obj_ForEachChild
	addq.w	#$8,a7
loc_1F7982:
	moveq	#$0,d0
	move.b	$7A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F799A
	pea.l	Seg_SetLayerFromObj(pc)
	move.l	a4,-(a7)
	jsr	Seg_ForEachOfObj(pc)
	addq.w	#$8,a7
loc_1F799A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
