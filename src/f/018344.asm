; ---------------------------------------------------------------------------
; ShootAcolyte_StateWalkToPlayer - SHOOTACOLYTE: walk (speed $220) to 96 px from the nearest player, inside its x range +$AA..+$AE; stop when close, at a range end or out of time, then next step after 10
; In:  8(a6) = this
; Out: d0
; Evidence: walk animation jt $186D4 (sub_1F6296); velocity +$16
; ---------------------------------------------------------------------------
ShootAcolyte_StateWalkToPlayer:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d5
	asr.l	#$8,d5
	cmp.w	d6,d5
	addq.w	#$4,a7
	ble.s	loc_018386
	move.w	d5,d7
	sub.w	#$60,d7
	cmp.w	$AA(a4),d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_01837E
	move.w	d7,d0
	bra.s	loc_018382
loc_01837E:
	move.w	$AA(a4),d0
loc_018382:
	move.w	d0,d7
	bra.s	loc_0183A0
loc_018386:
	move.w	d5,d7
	add.w	#$60,d7
	cmp.w	$AE(a4),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_01839A
	move.w	d7,d0
	bra.s	loc_01839E
loc_01839A:
	move.w	$AE(a4),d0
loc_01839E:
	move.w	d0,d7
loc_0183A0:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0183B8
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	bra.s	loc_0183C2
loc_0183B8:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_0183C2:
	moveq	#$A,d1
	cmp.l	d0,d1
	bgt.s	loc_0183E6
	cmp.w	$AE(a4),d6
	bne.s	loc_0183D4
	cmp.w	$AE(a4),d7
	bgt.s	loc_0183E6
loc_0183D4:
	cmp.w	$AA(a4),d6
	bne.s	loc_0183E0
	cmp.w	$AA(a4),d7
	blt.s	loc_0183E6
loc_0183E0:
	tst.w	$6E(a4)
	bgt.s	loc_01844C
loc_0183E6:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_01841C
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_01849A
loc_01841C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_018430
	clr.w	$96(a4)
loc_018430:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_01849A
loc_01844C:
	cmp.w	d6,d7
	ble.s	loc_018458
	andi.b	#$EF,$2E(a4)
	bra.s	loc_01845E
loc_018458:
	ori.b	#$10,$2E(a4)
loc_01845E:
	lea.l	$3A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_01847C
	move.l	#$FFFFFDE0,d0
	bra.s	loc_018482
loc_01847C:
	move.l	#$220,d0
loc_018482:
	move.w	d0,$16(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	ShootAcolyte_StateWalkToPlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_01849A:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
