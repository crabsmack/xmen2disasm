; ---------------------------------------------------------------------------
; Explosion_Update - explosion timer: step the animation, draw the 32x32 sprite, hurt actors in the box if damaging; free after 5 steps
; In:  8(a6) = slot
; Out: none
; Evidence: g_SpriteTable entry size $F; ObjList_ForEachInBox(.., Explosion_HurtActor); TAS 2770-50086
; ---------------------------------------------------------------------------
Explosion_Update:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$5(a4)
	bgt.s	loc_11831E
	move.b	#$4,$5(a4)
	addq.b	#$1,$4(a4)
	moveq	#$0,d0
	move.b	$4(a4),d0
	cmpi.b	#$4,d0
	bls.s	loc_118308
	move.l	a4,-(a7)
	jsr	Explosion_Free(pc)
	addq.w	#$4,a7
	bra.w	loc_11841C
loc_118308:
	andi.w	#$F800,$A(a4)
	moveq	#$0,d0
	move.b	$4(a4),d0
	lsl.l	#$4,d0
	add.w	g_FxTileBase(a5),d0
	or.w	d0,$A(a4)
loc_11831E:
	move.w	(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.w	$2(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmpi.w	#$FFE0,d6
	ble.s	loc_11839E
	cmpi.w	#$140,d6
	bge.s	loc_11839E
	cmpi.w	#$FFE0,d7
	ble.s	loc_11839E
	cmpi.w	#$E0,d7
	bge.s	loc_11839E
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	d7,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$F,$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	$A(a4),$4(a0)
	move.w	d6,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
loc_11839E:
	tst.w	$C(a4)
	beq.s	loc_11840C
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	Explosion_HurtActor(pc)
	move.l	g_HitListEnemyBody(a5),-(a7)
	move.w	$2(a4),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	move.w	(a4),d1
	ext.l	d1
	add.l	d2,d1
	move.l	d1,-(a7)
	move.w	$2(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	ObjList_ForEachInBox(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	Explosion_HurtActor(pc)
	move.l	g_HitListPlayerBody(a5),-(a7)
	move.w	$2(a4),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	move.w	(a4),d1
	ext.l	d1
	add.l	d2,d1
	move.l	d1,-(a7)
	move.w	$2(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	ObjList_ForEachInBox(pc)
	lea.l	$38(a7),a7
loc_11840C:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_118416
	moveq	#$2,d0
	bra.s	loc_118418
loc_118416:
	moveq	#$1,d0
loc_118418:
	sub.b	d0,$5(a4)
loc_11841C:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
