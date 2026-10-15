; ---------------------------------------------------------------------------
; Spr_PlaceAttached - snap the objects attached to a sprite to its anchor point and call their vtable slot $1E
; In:  8(a6) = sprite instance (object+$2E)   $C(a6) = word: screen x   $10(a6) = word: screen y
; Out: none
; Evidence: chain from sprite+$D through the object table g_ObjTable (next = object+$3C); objects with flags +4 & $1800 == $1800 are moved by Obj_ShiftTree so their screen position matches (x, y - frame byte +$2B)
; ---------------------------------------------------------------------------
Spr_PlaceAttached:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$D(a3),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1FB1E2
	moveq	#$0,d0
	bra.s	loc_1FB1F2
loc_1FB1E2:
	moveq	#$0,d0
	move.b	$D(a3),d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1FB1F2:
	movea.l	d0,a4
loc_1FB1F4:
	move.w	#$1800,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	cmpi.l	#$1800,d1
	bne.w	loc_1FB304
	moveq	#$0,d6
	move.b	$2F(a4),d6
	cmpi.w	#$FF,d6
	bne.s	loc_1FB218
	clr.w	d6
loc_1FB218:
	move.l	$30(a4),d0
	moveq	#$24,d1
	add.l	d1,d0
	ext.l	d6
	move.l	d6,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$2,d0
	add.l	d2,d0
	movea.l	d0,a0
	move.b	$7(a0),d0
	ext.w	d0
	move.w	$12(a6),d7
	sub.w	d0,d7
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_1FB25E
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_1FB25E
	moveq	#$1,d3
loc_1FB25E:
	tst.b	d3
	beq.s	loc_1FB276
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	sub.w	g_CameraX(a5),d1
	bra.s	loc_1FB282
loc_1FB276:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	sub.w	g_CameraX(a5),d0
	move.l	d0,d1
loc_1FB282:
	move.w	d1,d4
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_1FB2A4
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_1FB2A4
	moveq	#$1,d3
loc_1FB2A4:
	tst.b	d3
	beq.s	loc_1FB2BC
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	sub.w	g_CameraY(a5),d1
	bra.s	loc_1FB2C8
loc_1FB2BC:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	sub.w	g_CameraY(a5),d0
	move.l	d0,d1
loc_1FB2C8:
	move.w	d1,d5
	cmp.w	$E(a6),d4
	sne.b	d3
	neg.b	d3
	move.l	d3,-$4(a6)
	cmp.w	d7,d5
	sne.b	d3
	neg.b	d3
	move.l	-$4(a6),d0
	or.b	d0,d3
	tst.b	d3
	beq.s	loc_1FB304
	move.w	$E(a6),d0
	sub.w	d4,d0
	move.w	d0,g_ShiftDX(a5)
	move.w	d7,d0
	sub.w	d5,d0
	move.w	d0,g_ShiftDY(a5)
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Obj_ShiftTree(pc)
	addq.w	#$8,a7
loc_1FB304:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1E(a0),a1
	jsr	(a1)
	moveq	#$0,d7
	move.b	$3C(a4),d7
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_1FB322
	moveq	#$0,d0
	bra.s	loc_1FB330
loc_1FB322:
	ext.l	d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1FB330:
	movea.l	d0,a4
	cmpi.w	#$FF,d7
	addq.w	#$4,a7
	bne.w	loc_1FB1F4
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
