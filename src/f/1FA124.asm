; ---------------------------------------------------------------------------
; sub_1FA124	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FA124:
	link.w	a6,#$FFF4
	movem.l	d3/d5-d7/a3-a4,-(a7)
loc_1FA12C:
	clr.b	-$38E0(a5)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1FA14C
	addq.b	#$1,-$38E0(a5)
loc_1FA14C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1FA168
	addq.b	#$1,-$38E0(a5)
loc_1FA168:
	moveq	#$0,d0
	move.b	-$38E0(a5),d0
	cmpi.w	#$2,d0
	seq.b	d3
	neg.b	d3
	move.b	d3,-$38DE(a5)
	jsr	$504A(a5)	; -> sub_1FA99C
	tst.b	-$38B4(a5)
	beq.w	loc_1FA480
	tst.b	-$38B2(a5)
	beq.s	loc_1FA190
	jsr	$5A(a5)	; -> HUD_UpdateHealthBars
loc_1FA190:
	lea.l	g_Player1(a5),a0
	move.l	a0,-$4(a6)
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_1FA292
	movea.l	-$4(a6),a0
	cmpi.w	#$200,$68(a0)
	bgt.s	loc_1FA1CA
	moveq	#$E,d0
	and.l	g_FrameCounter(a5),d0
	bne.s	loc_1FA1CA
	jsr	$5A(a5)	; -> HUD_UpdateHealthBars
loc_1FA1CA:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$132,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$F,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7E8,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A5,$6(a0)
	tst.b	-$18A8(a5)
	beq.s	loc_1FA252
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$133,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$7,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7F8,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$8F,$6(a0)
	bra.s	loc_1FA292
loc_1FA252:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$133,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$3,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7FC,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$97,$6(a0)
loc_1FA292:
	lea.l	g_Player2(a5),a0
	move.l	a0,-$4(a6)
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_1FA39A
	movea.l	-$4(a6),a0
	cmpi.w	#$200,$68(a0)
	bgt.s	loc_1FA2CC
	moveq	#$E,d0
	and.l	g_FrameCounter(a5),d0
	bne.s	loc_1FA2CC
	jsr	$5A(a5)	; -> HUD_UpdateHealthBars
loc_1FA2CC:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$132,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$F,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7D0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$17A,$6(a0)
	tst.b	-$18AA(a5)
	beq.s	loc_1FA356
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$133,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$7,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7E0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1A1,$6(a0)
	bra.w	loc_1FA43A
loc_1FA356:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$133,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$3,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7E0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1A1,$6(a0)
	bra.w	loc_1FA43A
loc_1FA39A:
	tst.b	-$3BBA(a5)
	beq.s	loc_1FA3A8
	jsr	$51BA(a5)	; -> Pad_IsP2Connected
	tst.b	d0
	bne.s	loc_1FA3B0
loc_1FA3A8:
	tst.b	-$3A1A(a5)
	beq.w	loc_1FA43A
loc_1FA3B0:
	moveq	#$10,d0
	and.l	g_FrameCounter(a5),d0
	beq.w	loc_1FA43A
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$148,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$C,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7D0,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$16D,$6(a0)
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$148,(a0)
	movea.l	-$1FE6(a5),a0
	move.b	#$C,$2(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$A7D4,$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$191,$6(a0)
loc_1FA43A:
	moveq	#$51,d0
	cmp.w	-$1FE2(a5),d0
	bne.s	loc_1FA4BC
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	clr.w	$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1C,$6(a0)
	bra.s	loc_1FA4BC
loc_1FA480:
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	clr.w	$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1C,$6(a0)
loc_1FA4BC:
	movea.l	-$388E(a5),a0
	jsr	(a0)
	move.w	-$3A24(a5),d0
	addq.w	#$1,-$3A24(a5)
	clr.b	-$3A08(a5)
	tst.b	-$3A1A(a5)
	beq.s	loc_1FA4D8
	jsr	sub_1F9DE8(pc)
loc_1FA4D8:
	jsr	$50FA(a5)	; -> Pad_Update
	tst.b	-$38E4(a5)
	bne.w	loc_1FA638
	tst.b	-$3894(a5)
	beq.w	loc_1FA61A
	tst.l	-$BCC(a5)
	beq.s	loc_1FA4FC
	movea.l	-$BCC(a5),a0
	jsr	(a0)
	bra.w	loc_1FA5B0
loc_1FA4FC:
	move.w	-$BD8(a5),d0
	ext.l	d0
	move.l	d0,d5
loc_1FA504:
	tst.w	-$BCE(a5)
	bne.s	loc_1FA516
	move.w	-$38D8(a5),-$BCE(a5)
	move.l	-$BD6(a5),-$BD2(a5)
loc_1FA516:
	subq.w	#$1,-$BCE(a5)
	moveq	#-$E,d0
	add.l	d0,-$BD2(a5)
	movea.l	-$BD2(a5),a4
	moveq	#$0,d7
	move.b	$4(a4),d7
	moveq	#$1,d0
	and.l	d7,d0
	beq.s	loc_1FA558
	moveq	#$8,d0
	and.l	d7,d0
	bne.s	loc_1FA548
	move.l	a4,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$2A(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_1FA558
loc_1FA548:
	move.l	a4,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$2E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_1FA5AA
loc_1FA558:
	moveq	#$0,d0
	move.b	$5(a4),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1FA56C
	moveq	#$0,d0
	bra.s	loc_1FA57C
loc_1FA56C:
	moveq	#$0,d0
	move.b	$5(a4),d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1FA57C:
	move.l	d0,-$C(a6)
	beq.s	loc_1FA5AA
	move.l	a4,-(a7)
	movea.l	-$C(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$32(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_1FA5AA
	move.l	a4,-(a7)
	movea.l	-$C(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_1FA5AA:
	subq.l	#$1,d5
	bne.w	loc_1FA504
loc_1FA5B0:
	tst.l	-$38F0(a5)
	beq.s	loc_1FA5BE
	movea.l	-$38F0(a5),a0
	jsr	(a0)
	bra.s	loc_1FA61A
loc_1FA5BE:
	move.w	-$13F2(a5),d0
	ext.l	d0
	move.l	d0,d6
	subq.l	#$2,d6
	move.w	-$13F2(a5),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	-$34A6(a5),d0
	move.l	d0,-$8(a6)
loc_1FA5D8:
	subq.l	#$4,-$8(a6)
	movea.l	-$8(a6),a0
	movea.l	(a0),a3
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$C000,d0
	bne.s	loc_1FA616
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1FA616
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1FA616:
	subq.l	#$1,d6
	bne.s	loc_1FA5D8
loc_1FA61A:
	jsr	sub_1F9D52(pc)
	jsr	sub_1FA05A(pc)
	tst.b	-$3890(a5)
	beq.s	loc_1FA638
	movea.l	-$35B6(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1FA638:
	tst.b	-$3A1A(a5)
	bne.s	loc_1FA644
	tst.b	-$38B6(a5)
	beq.s	loc_1FA660
loc_1FA644:
	jsr	sub_1F97DE(pc)
	tst.b	d0
	beq.s	loc_1FA660
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> sub_1F944E
	clr.b	-$3A1A(a5)
	move.b	#$1,-$38C6(a5)
	addq.w	#$4,a7
loc_1FA660:
	tst.b	-$38E4(a5)
	bne.s	loc_1FA672
	movea.l	-$3A48(a5),a0
	jsr	(a0)
	movea.l	-$3A4C(a5),a0
	jsr	(a0)
loc_1FA672:
	movea.l	-$38F4(a5),a0
	jsr	(a0)
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.b	#$1,-$1D4A(a5)
	move.w	#$80,d0
	and.w	-$3A26(a5),d0
	bne.s	loc_1FA696
	move.w	#$80,d0
	and.w	-$3A28(a5),d0
	beq.s	loc_1FA6AE
loc_1FA696:
	tst.b	-$3A02(a5)
	bne.s	loc_1FA6AE
	tst.w	-$359A(a5)
	bne.s	loc_1FA6AE
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	-$38FC(a5),a0
	jsr	(a0)
	addq.w	#$4,a7
loc_1FA6AE:
	tst.b	-$38C2(a5)
	bne.s	loc_1FA6F4
	tst.b	-$38DE(a5)
	beq.s	loc_1FA6C6
	tst.b	-$38E4(a5)
	bne.s	loc_1FA6C6
loc_1FA6C0:
	tst.b	-$3A08(a5)
	beq.s	loc_1FA6C0
loc_1FA6C6:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	tst.b	-$38E4(a5)
	bne.w	loc_1FA12C
	tst.w	-$359A(a5)
	ble.w	loc_1FA12C
	tst.b	-$38DE(a5)
	beq.s	loc_1FA6E4
	moveq	#$2,d0
	bra.s	loc_1FA6E6
loc_1FA6E4:
	moveq	#$1,d0
loc_1FA6E6:
	ext.w	d0
	sub.w	d0,-$359A(a5)
	tst.w	-$359A(a5)
	bgt.w	loc_1FA12C
loc_1FA6F4:
	movem.l	-$24(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
