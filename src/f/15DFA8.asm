; ---------------------------------------------------------------------------
; Actor_Activate - ACTOR slot +$3E: make an object active (register it for update/draw lists)
; In:  8(a6) = object
; Out: none
; Evidence: counterpart of Actor_Deactivate (which unlinks the +$80/+$84 list nodes, the floor segments and the DrawList node +$88); called by Actor_New and the scene loop when InActivateWindow
; ---------------------------------------------------------------------------
Actor_Activate:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$2E(a4),d4
	move.b	$2F(a4),d5
	tst.l	$30(a4)
	beq.s	loc_15DFF6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_VramTileCursor(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	move.l	$30(a4),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,d6
	lea.l	$1C(a7),a7
	bra.s	loc_15E000
loc_15DFF6:
	move.w	g_VramTileCursor(a5),d6
	move.w	#$FFFF,$34(a4)
loc_15E000:
	cmp.w	g_VramTileLimit(a5),d6
	ble.s	loc_15E016
	movea.l	$30(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$20,d0
	bne.w	loc_15E182
loc_15E016:
	moveq	#$0,d7
	move.b	$3B(a4),d7
	move.b	d4,$2E(a4)
	move.b	d5,$2F(a4)
	move.w	d6,g_VramTileCursor(a5)
	andi.w	#$B7FF,$4(a4)
	move.w	#$200,d0
	and.w	$6(a4),d0
	beq.w	loc_15E0E2
	jsr	$4F12(a5)	; -> Seg_Alloc
	move.w	d0,d6
	move.b	d6,$7A(a4)
	move.l	d6,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	move.w	$50(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$52(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$4C(a4),d0
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	move.w	$4E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$1C,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4F0A(a5)	; -> Seg_Setup
	ori.b	#$1,(a3)
	move.b	$15(a4),$12(a3)
	lea.l	$1C(a7),a7
	bra.s	loc_15E0E2
loc_15E09C:
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_15E0AA
	moveq	#$0,d0
	bra.s	loc_15E0B8
loc_15E0AA:
	ext.l	d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_15E0B8:
	movea.l	d0,a3
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_15E0C8
	moveq	#$0,d0
	bra.s	loc_15E0D6
loc_15E0C8:
	ext.l	d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_15E0D6:
	movea.l	d0,a0
	moveq	#$0,d0
	move.b	$3C(a0),d0
	move.w	d0,d7
	movea.l	(a3),a0
loc_15E0E2:
	cmpi.w	#$FF,d7
	bne.s	loc_15E09C
	tst.l	$7C(a4)
	beq.s	loc_15E0F8
	move.l	$7C(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_15E0F8:
	moveq	#$1,d0
	and.w	$6(a4),d0
	bne.s	loc_15E12A
	moveq	#$10,d0
	and.w	$6(a4),d0
	beq.s	loc_15E11A
	pea.l	g_HitListPlayerAtk(a5)
	move.l	a4,-(a7)
	jsr	HitList_Add(pc)
	move.l	d0,$80(a4)
	addq.w	#$8,a7
	bra.s	loc_15E12A
loc_15E11A:
	pea.l	g_HitListEnemyAtk(a5)
	move.l	a4,-(a7)
	jsr	HitList_Add(pc)
	move.l	d0,$80(a4)
	addq.w	#$8,a7
loc_15E12A:
	moveq	#$2,d0
	and.w	$6(a4),d0
	bne.s	loc_15E14A
	moveq	#$10,d0
	and.w	$6(a4),d0
	bne.s	loc_15E14A
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	HitList_Add(pc)
	move.l	d0,$84(a4)
	addq.w	#$8,a7
loc_15E14A:
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	and.w	$6(a4),d1
	moveq	#$0,d2
	move.w	d1,d2
	move.l	d2,-(a7)
	moveq	#$0,d1
	move.b	$42(a4),d1
	move.l	d1,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	move.l	$1A(a0),-(a7)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$88(a4)
	lea.l	$18(a7),a7
loc_15E182:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
