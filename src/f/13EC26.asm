; ---------------------------------------------------------------------------
; sub_13EC26	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13EC26:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	-$8(a6)
	movea.l	a3,a4
	lea.l	$20(a4),a4
	clr.b	-$5(a6)
	tst.b	$D(a3)
	ble.s	loc_13EC4A
	subq.b	#$1,$D(a3)
loc_13EC4A:
	tst.w	$12(a3)
	ble.s	loc_13EC62
	tst.b	-$38DE(a5)
	beq.s	loc_13EC5A
	moveq	#$2,d0
	bra.s	loc_13EC5C
loc_13EC5A:
	moveq	#$1,d0
loc_13EC5C:
	ext.w	d0
	sub.w	d0,$12(a3)
loc_13EC62:
	tst.l	$18(a3)
	beq.s	loc_13EC76
	tst.w	$12(a3)
	bgt.s	loc_13EC76
	move.l	a3,-(a7)
	jsr	sub_13EA46(pc)
	addq.w	#$4,a7
loc_13EC76:
	moveq	#$1B,d0
	cmp.w	-$8(a6),d0
	ble.w	loc_13EDC6
	tst.b	$5(a4)
	beq.w	loc_13EDB8
	clr.b	d4
	move.w	(a4),d6
	sub.w	g_CameraX(a5),d6
	move.w	$2(a4),d7
	sub.w	g_CameraY(a5),d7
	cmp.w	-$35C2(a5),d6
	ble.s	loc_13ECA2
	moveq	#$1,d4
	bra.s	loc_13ECBE
loc_13ECA2:
	cmp.w	-$35C0(a5),d6
	bge.s	loc_13ECAC
	moveq	#$1,d4
	bra.s	loc_13ECBE
loc_13ECAC:
	cmp.w	-$35C6(a5),d7
	ble.s	loc_13ECB6
	moveq	#$1,d4
	bra.s	loc_13ECBE
loc_13ECB6:
	cmp.w	-$35C4(a5),d7
	bge.s	loc_13ECBE
	moveq	#$1,d4
loc_13ECBE:
	tst.b	d4
	beq.s	loc_13ECCA
	clr.b	$5(a4)
	bra.w	loc_13EDB8
loc_13ECCA:
	moveq	#$0,d0
	move.b	$4(a4),d0
	moveq	#$F,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	move.w	d0,-$4(a6)
	move.b	$4(a4),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,-$2(a6)
	tst.b	-$38DE(a5)
	beq.s	loc_13ECF4
	moveq	#$2,d0
	bra.s	loc_13ECF6
loc_13ECF4:
	moveq	#$1,d0
loc_13ECF6:
	ext.w	d0
	sub.w	d0,-$4(a6)
	tst.w	-$4(a6)
	bgt.s	loc_13ED2C
	move.w	-$2(a6),d0
	addq.w	#$1,-$2(a6)
	moveq	#$6,d0
	cmp.w	-$2(a6),d0
	bge.s	loc_13ED1A
	clr.b	$5(a4)
	bra.w	loc_13EDB8
loc_13ED1A:
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$4,d0
	moveq	#$6,d1
	or.l	d0,d1
	move.b	d1,$4(a4)
	bra.s	loc_13ED3C
loc_13ED2C:
	andi.b	#$F0,$4(a4)
	moveq	#$F,d0
	and.w	-$4(a6),d0
	or.b	d0,$4(a4)
loc_13ED3C:
	moveq	#$0,d0
	move.b	$16(a3),d0
	tst.l	d0
	btst	#$0,d0
	beq.s	loc_13EDB2
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	sub_13EBB6(pc)
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
	jsr	$2DE2(a5)	; -> ObjList_ForEachInBox
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	sub_13EBB6(pc)
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
	jsr	$2DE2(a5)	; -> ObjList_ForEachInBox
	lea.l	$38(a7),a7
loc_13EDB2:
	move.b	#$1,-$5(a6)
loc_13EDB8:
	move.w	-$8(a6),d0
	addq.w	#$1,-$8(a6)
	addq.w	#$6,a4
	bra.w	loc_13EC76
loc_13EDC6:
	tst.b	-$5(a6)
	bne.s	loc_13EE16
	clr.b	d5
	move.w	$E(a3),d6
	sub.w	g_CameraX(a5),d6
	move.w	$10(a3),d7
	sub.w	g_CameraY(a5),d7
	cmp.w	-$35C2(a5),d6
	ble.s	loc_13EDE8
	moveq	#$1,d5
	bra.s	loc_13EE04
loc_13EDE8:
	cmp.w	-$35C0(a5),d6
	bge.s	loc_13EDF2
	moveq	#$1,d5
	bra.s	loc_13EE04
loc_13EDF2:
	cmp.w	-$35C6(a5),d7
	ble.s	loc_13EDFC
	moveq	#$1,d5
	bra.s	loc_13EE04
loc_13EDFC:
	cmp.w	-$35C4(a5),d7
	bge.s	loc_13EE04
	moveq	#$1,d5
loc_13EE04:
	tst.w	$12(a3)
	ble.s	loc_13EE0E
	tst.b	d5
	beq.s	loc_13EE16
loc_13EE0E:
	move.l	a3,-(a7)
	jsr	sub_13D8F6(pc)
	addq.w	#$4,a7
loc_13EE16:
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
