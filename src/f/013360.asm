; ---------------------------------------------------------------------------
; CapedAcolyte_Init - parent Init, then home position +$9C/+$A0 = placement, stats jt $2B2 (+$8C, health = stats byte 2), sprite set jt $2BA, AI script jt $2A2 (+$96), flags |= $80, face like the live player, animation jt $28A, hover-offset table jt $342 (+$B4); x range +$A4..+$A6 = x -/+ (placement +6 or $40), y range +$AA..+$A8 = y - (placement +8 or $60)..y, +$B2/+$B0/+$AC from placement +$A/+$C/+$E (defaults $78/2/$14) (CAPEDACOLYTE override of slot +$12 Init)
; In:  8(a6) = this (CAPEDACOLYTE object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = placement entry
; Out: none
; Evidence: class descriptor CAPEDACOLYTE slot +$12 (tools/classes.py); TAS frames 10847-11399 (6 active)
; ---------------------------------------------------------------------------
CapedAcolyte_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$282(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	move.l	$9C(a4),$8(a4)
	move.l	$A0(a4),$C(a4)
	lea.l	$2B2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$2BA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	$2A2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	lea.l	$18(a7),a7
	bne.s	loc_013406
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_013422
loc_013406:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_013422:
	ori.w	#$80,$6(a4)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_013458
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_013450
	ori.b	#$4,$2E(a4)
	bra.s	loc_01349E
loc_013450:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_01349E
loc_013458:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_013488
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_013480
	ori.b	#$4,$2E(a4)
	bra.s	loc_01349E
loc_013480:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_01349E
loc_013488:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_013498
	ori.b	#$4,$2E(a4)
	bra.s	loc_01349E
loc_013498:
	andi.b	#$FB,$2E(a4)
loc_01349E:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$28A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$342(a5),a0
	move.l	$2(a0),$B4(a4)
	move.w	$6(a3),d7
	addq.w	#$8,a7
	beq.s	loc_013506
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0134D8
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0134DE
loc_0134D8:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_0134DE:
	move.w	$2(a3),d1
	sub.w	d0,d1
	move.w	d1,$A4(a4)
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0134F6
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_0134FC
loc_0134F6:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_0134FC:
	add.w	$2(a3),d0
	move.w	d0,$A6(a4)
	bra.s	loc_01351E
loc_013506:
	move.w	$2(a3),d0
	sub.w	#$40,d0
	move.w	d0,$A4(a4)
	move.w	$2(a3),d0
	add.w	#$40,d0
	move.w	d0,$A6(a4)
loc_01351E:
	move.w	$4(a3),$A8(a4)
	move.w	$8(a3),d7
	beq.s	loc_01354A
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_013538
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_01353E
loc_013538:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_01353E:
	move.w	$A8(a4),d1
	sub.w	d0,d1
	move.w	d1,$AA(a4)
	bra.s	loc_013556
loc_01354A:
	move.w	$A8(a4),d0
	sub.w	#$60,d0
	move.w	d0,$AA(a4)
loc_013556:
	move.w	$A(a3),d7
	beq.s	loc_013562
	move.w	d7,$B2(a4)
	bra.s	loc_013568
loc_013562:
	move.w	#$78,$B2(a4)
loc_013568:
	move.w	$C(a3),d7
	beq.s	loc_013574
	move.w	d7,$B0(a4)
	bra.s	loc_01357A
loc_013574:
	move.w	#$2,$B0(a4)
loc_01357A:
	move.w	$E(a3),d7
	beq.s	loc_013586
	move.w	d7,$AC(a4)
	bra.s	loc_01358C
loc_013586:
	move.w	#$14,$AC(a4)
loc_01358C:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
