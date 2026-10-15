; ---------------------------------------------------------------------------
; Cam_TrackPlayer - camera tracking fn for one player: x/y follow the target with climbing, ledge, lift and airborne special cases; switches to two-player mode when P2 joins
; In:  8(a6) = this
; Out: none
; Evidence: Player_ClimbState 2/3 = on a wall (x pinned near the edge +$68), Seg_WouldLeaveEnd = near a ledge (look ahead by facing), Player_ClimbStateNcWolv/BeastPsy, Obj_GetLiftCarrier; runs twice when g_TwoPlayerStep; clamps to $FFC76C-$FFC772; $FFC920 == 2 -> vtable +$1A Cam_FollowBoth
; ---------------------------------------------------------------------------
Cam_TrackPlayer:
	link.w	a6,#$FFEC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$24(a4),a3
	moveq	#$0,d0
	move.l	d0,-$8(a6)
	moveq	#$0,d1
	move.b	g_TwoPlayerStep(a5),d1
	addq.w	#$1,d1
	move.w	d1,-$4(a6)
	clr.b	d5
	clr.b	-$1(a6)
	move.l	a3,d1
	beq.w	loc_16173A
	moveq	#$0,d0
	move.b	g_PlayersAlive(a5),d0
	cmpi.w	#$2,d0
	bne.s	loc_1613E4
	pea.l	($C0).w
	pea.l	($AA).w
	moveq	#$40,d0
	move.l	d0,-(a7)
	pea.l	($96).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	move.b	#$1,g_CamModeSwitched(a5)
	move.l	$1C(a4),-$E(a6)
	lea.l	$14(a7),a7
	beq.w	loc_16173A
	move.l	a4,-(a7)
	movea.l	-$E(a6),a0
	jsr	(a0)
	addq.w	#$4,a7
	bra.w	loc_16173A
loc_1613E4:
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$A(a6)
	move.l	$C(a3),d7
	asr.l	#$8,d7
	bra.w	loc_1616D0
loc_1613F8:
	moveq	#$1,d0
	and.w	$4A(a4),d0
	bne.w	loc_16154C
	move.l	a3,-(a7)
	jsr	$4D72(a5)	; -> Player_ClimbState
	move.b	d0,d6
	moveq	#$0,d0
	move.b	d6,d0
	cmpi.w	#$2,d0
	addq.w	#$4,a7
	beq.s	loc_161420
	moveq	#$0,d0
	move.b	d6,d0
	cmpi.w	#$3,d0
	bne.s	loc_161484
loc_161420:
	tst.w	$2E(a4)
	bne.s	loc_161484
	move.b	d6,d0
	subq.b	#$2,d0
	beq.s	loc_161432
	subq.b	#$1,d0
	beq.s	loc_16143A
	bra.s	loc_161446
loc_161432:
	move.w	$68(a4),-$12(a6)
	bra.s	loc_161446
loc_16143A:
	move.w	#$140,d0
	sub.w	$68(a4),d0
	move.w	d0,-$12(a6)
loc_161446:
	move.w	$28(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$46(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$30(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Cam_EaseAxis(pc)
	move.w	d0,$30(a4)
	move.b	#$1,-$1(a6)
	lea.l	$14(a7),a7
	bra.w	loc_16154C
loc_161484:
	moveq	#$0,d0
	move.b	$6A(a4),d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E62(a5)	; -> Seg_WouldLeaveEnd
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_1614EC
	moveq	#$10,d0
	and.b	$2E(a3),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1614AA
	move.w	$3C(a4),d0
	bra.s	loc_1614AE
loc_1614AA:
	move.w	$3E(a4),d0
loc_1614AE:
	move.w	d0,-$12(a6)
	move.w	$28(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$46(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	move.w	$30(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Cam_EaseAxis(pc)
	move.w	d0,$30(a4)
	moveq	#$1,d5
	lea.l	$14(a7),a7
	bra.s	loc_16154C
loc_1614EC:
	moveq	#$0,d0
	move.b	d6,d0
	cmpi.w	#$1,d0
	bne.s	loc_161502
	move.l	a3,-(a7)
	jsr	$4D8A(a5)	; -> sub_1F4334
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_16154C
loc_161502:
	pea.l	$50(a4)
	pea.l	$4C(a4)
	pea.l	$54(a4)
	pea.l	$30(a4)
	move.w	$58(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$44(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$3E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$3C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$28(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Cam_SpringAxis(pc)
	moveq	#$1,d5
	lea.l	$28(a7),a7
loc_16154C:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.w	loc_1616D0
	move.w	$40(a4),-$10(a6)
	move.w	$42(a4),d4
	move.w	$32(a4),-$E(a6)
	move.l	a3,-(a7)
	jsr	$4D7A(a5)	; -> Player_ClimbStateNcWolv
	move.b	d0,-$B(a6)
	addq.w	#$4,a7
	beq.w	loc_161616
	moveq	#$0,d0
	move.b	-$B(a6),d0
	cmpi.w	#$1,d0
	bne.s	loc_1615D0
	move.w	$66(a4),-$14(a6)
	lea.l	$2BB2(a5),a0
	move.l	(a3),d0
	cmp.l	$2(a0),d0
	bne.s	loc_16159A
	addi.w	#$20,-$14(a6)
loc_16159A:
	move.w	$2A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$46(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$32(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$14(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Cam_EaseAxis(pc)
	move.w	d0,$32(a4)
	moveq	#$1,d5
	lea.l	$14(a7),a7
	bra.w	loc_1616D0
loc_1615D0:
	pea.l	$52(a4)
	pea.l	$4E(a4)
	pea.l	$56(a4)
	pea.l	$32(a4)
	move.w	$5A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$44(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	($C0).w
	moveq	#$40,d0
	move.l	d0,-(a7)
	move.w	$2A(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	Cam_SpringAxis(pc)
	move.b	#$1,-$1(a6)
	lea.l	$28(a7),a7
	bra.w	loc_1616D0
loc_161616:
	move.l	a3,-(a7)
	jsr	$4D82(a5)	; -> Player_ClimbStateBeastPsy
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_161630
	move.l	a3,-(a7)
	jsr	Obj_GetLiftCarrier(pc)
	move.l	d0,-$8(a6)
	addq.w	#$4,a7
	beq.s	loc_16165E
loc_161630:
	move.w	$2A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$46(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$32(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$70,d0
	move.l	d0,-(a7)
	jsr	Cam_EaseAxis(pc)
	move.w	d0,$32(a4)
	lea.l	$14(a7),a7
	bra.s	loc_1616D0
loc_16165E:
	move.w	#$1000,d0
	and.w	$4(a3),d0
	bne.s	loc_161698
	move.w	$2A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$46(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$32(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	Cam_EaseAxis(pc)
	move.w	d0,$32(a4)
	moveq	#$1,d5
	lea.l	$14(a7),a7
	bra.s	loc_1616D0
loc_161698:
	ext.l	d7
	move.w	-$E(a6),d0
	ext.l	d0
	move.w	-$10(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d7,d1
	ble.s	loc_1616B8
	move.w	d7,d0
	sub.w	-$10(a6),d0
	move.w	d0,$32(a4)
	bra.s	loc_1616D0
loc_1616B8:
	ext.l	d7
	move.w	-$E(a6),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	cmp.l	d7,d0
	bge.s	loc_1616D0
	move.w	d7,d0
	sub.w	d4,d0
	move.w	d0,$32(a4)
loc_1616D0:
	move.w	-$4(a6),d0
	subq.w	#$1,-$4(a6)
	tst.w	d0
	bne.w	loc_1613F8
	move.w	$30(a4),d6
	move.w	$32(a4),d4
	cmp.w	g_CamMaxX(a5),d6
	ble.s	loc_1616F2
	move.w	g_CamMaxX(a5),$30(a4)
loc_1616F2:
	cmp.w	g_CamMinX(a5),d6
	bge.s	loc_1616FE
	move.w	g_CamMinX(a5),$30(a4)
loc_1616FE:
	cmp.w	g_CamMaxY(a5),d4
	ble.s	loc_16170A
	move.w	g_CamMaxY(a5),$32(a4)
loc_16170A:
	cmp.w	g_CamMinY(a5),d4
	bge.s	loc_161716
	move.w	g_CamMinY(a5),$32(a4)
loc_161716:
	tst.b	-$1(a6)
	beq.s	loc_161724
	clr.w	$54(a4)
	clr.w	$4C(a4)
loc_161724:
	tst.b	d5
	beq.s	loc_161730
	clr.w	$56(a4)
	clr.w	$4E(a4)
loc_161730:
	move.w	-$A(a6),$28(a4)
	move.w	d7,$2A(a4)
loc_16173A:
	movem.l	-$30(a6),d3-d7/a3-a4
	unlk	a6
	rts
