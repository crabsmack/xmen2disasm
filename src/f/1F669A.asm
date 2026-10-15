; ---------------------------------------------------------------------------
; Obj_ForEachChild - call func(parent, child) for each object attached to a parent
; In:  8(a6) = parent object   $C(a6) = func(parent, child)
; Out: none
; Evidence: first child index = parent+$3B, next = child+$3C ($FF ends); index into the object pointer table at g_ObjTable(a5); used recursively by Obj_ShiftTree and Obj_InheritLayer
; ---------------------------------------------------------------------------
Obj_ForEachChild:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d7
	move.b	$3B(a3),d7
	tst.l	d7
	bra.s	loc_1F66E0
loc_1F66B0:
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F66BE
	moveq	#$0,d0
	bra.s	loc_1F66CC
loc_1F66BE:
	ext.l	d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F66CC:
	movea.l	d0,a4
	moveq	#$0,d7
	move.b	$3C(a4),d7
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	$C(a6),a0
	jsr	(a0)
	addq.w	#$8,a7
loc_1F66E0:
	cmpi.w	#$FF,d7
	bne.s	loc_1F66B0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
