; ---------------------------------------------------------------------------
; HornetBullet_Update - HornetBullet: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $137708 (name string "HORNETBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
HornetBullet_Update:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_13748A
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1375D0
loc_13748A:
	move.w	$16(a3),d0
	ext.l	d0
	add.l	d0,$8(a3)
	move.w	$18(a3),d0
	ext.l	d0
	add.l	d0,$C(a3)
	tst.b	-$38DE(a5)
	beq.s	loc_1374B8
	move.w	$16(a3),d0
	ext.l	d0
	add.l	d0,$8(a3)
	move.w	$18(a3),d0
	ext.l	d0
	add.l	d0,$C(a3)
loc_1374B8:
	move.l	$8(a3),d5
	asr.l	#$8,d5
	move.l	$C(a3),d6
	asr.l	#$8,d6
	moveq	#$0,d3
	move.l	d5,d0
	asr.l	#$5,d0
	blt.s	loc_1374F0
	move.l	d5,d0
	asr.l	#$5,d0
	move.w	-$3A6E(a5),d1
	ext.l	d1
	cmp.l	d0,d1
	ble.s	loc_1374F0
	move.l	d6,d0
	asr.l	#$5,d0
	blt.s	loc_1374F0
	move.l	d6,d0
	asr.l	#$5,d0
	move.w	-$3A78(a5),d1
	ext.l	d1
	cmp.l	d0,d1
	ble.s	loc_1374F0
	moveq	#$1,d3
loc_1374F0:
	tst.b	d3
	beq.s	loc_137522
	move.l	d6,d0
	asr.l	#$5,d0
	movea.l	-$3A72(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	move.l	d5,d1
	asr.l	#$5,d1
	add.l	d0,d1
	movea.l	-$3A84(a5),a0
	add.l	d1,d1
	move.w	#$4000,d0
	and.w	(a0,d1.l),d0
	beq.s	loc_13751E
	moveq	#$1,d0
	bra.s	loc_137524
loc_13751E:
	moveq	#$0,d0
	bra.s	loc_137524
loc_137522:
	moveq	#$1,d0
loc_137524:
	beq.s	loc_137536
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1375D0
loc_137536:
	tst.w	g_SceneExitTimer(a5)
	bne.w	loc_1375D0
	moveq	#$0,d7
loc_137540:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_137550
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_137556
loc_137550:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_137556:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1375C6
	tst.w	$6A(a4)
	bne.s	loc_1375C6
	move.w	$56(a4),d0
	ext.l	d0
	cmp.l	d5,d0
	bgt.s	loc_1375C6
	move.w	$5A(a4),d0
	ext.l	d0
	cmp.l	d5,d0
	blt.s	loc_1375C6
	move.w	$54(a4),d0
	ext.l	d0
	cmp.l	d6,d0
	bgt.s	loc_1375C6
	move.w	$58(a4),d0
	ext.l	d0
	cmp.l	d6,d0
	blt.s	loc_1375C6
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	move.b	$70(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$71(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_1375C6:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_137540
loc_1375D0:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
