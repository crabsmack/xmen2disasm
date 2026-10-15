; ---------------------------------------------------------------------------
; sub_183320	[jt 2137]
; ---------------------------------------------------------------------------
sub_183320:
	link.w	a6,#$FFFA
	movem.l	d3-d7/a3-a4,-(a7)
	move.b	$1F(a6),d5
	move.b	$1B(a6),d6
	movea.l	$10(a6),a3
	movea.l	$8(a6),a4
	tst.b	d5
	beq.s	loc_183342
	move.l	-$1652(a5),d0
	bra.s	loc_183346
loc_183342:
	move.l	-$165A(a5),d0
loc_183346:
	move.l	d0,-$4(a6)
	movea.l	$C(a6),a0
	move.w	(a0),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#-$F,d0
	add.l	d0,d7
	tst.b	d6
	beq.s	loc_183360
	ori.b	#$4,(a3)
loc_183360:
	tst.b	$17(a6)
	beq.w	loc_18343E
	tst.b	d5
	beq.s	loc_183370
	moveq	#$A,d0
	bra.s	loc_183372
loc_183370:
	moveq	#$4,d0
loc_183372:
	move.w	d0,-$6(a6)
	move.w	(a4),d0
	ext.l	d0
	move.l	d0,d4
	moveq	#$1E,d0
	add.l	d0,d4
	addi.w	#$A,(a4)
	move.w	-$6(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	sub_1832B6(pc)
	move.l	-$4(a6),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4FFA(a5)	; -> ObjList_ForEachAtPoint
	andi.b	#$EF,(a3)
	movea.l	$C(a6),a0
	move.w	(a0),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.w	(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$3C(a7),a7
	beq.s	loc_183422
	moveq	#$0,d0
	move.b	d6,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$1,d0
	lea.l	$C(a7),a7
	bra.w	loc_183508
loc_183422:
	move.w	(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	cmpi.l	#$17C,d0
	ble.w	loc_183506
	moveq	#$1,d0
	bra.w	loc_183508
loc_18343E:
	tst.b	d5
	beq.s	loc_183446
	moveq	#$9,d0
	bra.s	loc_183448
loc_183446:
	moveq	#$4,d0
loc_183448:
	move.w	d0,d4
	move.w	(a4),d0
	ext.l	d0
	move.l	d0,d5
	moveq	#$1E,d0
	sub.l	d0,d5
	subi.w	#$A,(a4)
	ext.l	d4
	move.l	d4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	sub_1832B6(pc)
	move.l	-$4(a6),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4FFA(a5)	; -> ObjList_ForEachAtPoint
	ori.b	#$10,(a3)
	movea.l	$C(a6),a0
	move.w	(a0),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.w	(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$3C(a7),a7
	beq.s	loc_1834F0
	moveq	#$0,d0
	move.b	d6,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$1,d0
	lea.l	$C(a7),a7
	bra.s	loc_183508
loc_1834F0:
	move.w	(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	moveq	#-$3C,d1
	cmp.l	d0,d1
	ble.s	loc_183506
	moveq	#$1,d0
	bra.s	loc_183508
loc_183506:
	moveq	#$0,d0
loc_183508:
	movem.l	-$22(a6),d3-d7/a3-a4
	unlk	a6
	rts
