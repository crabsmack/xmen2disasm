; ---------------------------------------------------------------------------
; FlyBrood_Draw - in scene -$3B5C the parent Draw; elsewhere one hardware sprite (12 tiles per frame from g_FlyBroodSprDef, palette 1, h-flip from +$2E bit 4, priority from bit 2) (FLYBROOD override of slot 5, +$1A)
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_Draw:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	g_ScnUnused3B5C(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.w	loc_134D44
	move.w	g_FlyBroodSprDef(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	move.w	#$2000,d6
	or.w	$6(a0,d0.w),d6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$10,d1
	sub.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	sub.l	d2,d0
	move.w	d0,-$2(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	moveq	#$18,d2
	sub.l	d2,d0
	move.w	g_CameraY(a5),d3
	ext.l	d3
	move.l	d0,d4
	sub.l	d3,d4
	lea.l	$2E(a4),a3
	moveq	#$0,d5
	move.b	$1(a3),d5
	tst.l	d5
	cmpi.w	#$FF,d5
	beq.w	loc_134D5A
	move.b	(a3),d7
	moveq	#$10,d0
	and.b	d7,d0
	beq.s	loc_134CDE
	ori.w	#$800,d6
loc_134CDE:
	moveq	#$4,d0
	and.b	d7,d0
	beq.s	loc_134CE8
	ori.w	#$8000,d6
loc_134CE8:
	ext.l	d5
	move.l	d5,d7
	move.l	d7,d0
	lsl.l	#$3,d0
	move.l	d7,d1
	lsl.l	#$2,d1
	add.w	d0,d1
	add.w	d1,d6
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	d4,d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.b	#$E,$2(a0)
	movea.l	g_SprWritePtr(a5),a0
	move.w	d6,$4(a0)
	move.w	-$2(a6),d0
	add.w	#$80,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
	bra.s	loc_134D5A
loc_134D44:
	move.l	a4,-(a7)
	lea.l	$3732(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_134D5A:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
