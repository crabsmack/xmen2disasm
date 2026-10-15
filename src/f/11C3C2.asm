; ---------------------------------------------------------------------------
; BabyBio_Move - patrol movement on the home position +$9C/+$A0: during the hop animation (Tbl_BabyBioAnim5) jump 7 px in the velocity direction on its last step, else the parent Move; clamp to the patrol limits (+$AC/+$AE; an open edge switches to BabyBio_StateFallOff) and to y +$B2..+$B0; on bob frames 5/6/8/9 add the next offset of the bob table +$A4 (Tbl_BabyBioBobOffsets) to the shown position (BABYBIO override of slot 18 Move)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: parent +$4E only on the non-hop path; wall flags +$B7/+$B8 from BabyBio_Init; method 18 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_Move:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2F82(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_11C41A
	movea.l	$44(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	subq.l	#$1,d0
	move.w	$4A(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	bgt.s	loc_11C450
	moveq	#$3,d0
	cmp.w	$48(a4),d0
	bne.s	loc_11C450
	tst.w	$16(a4)
	ble.s	loc_11C40A
	addi.l	#$700,$9C(a4)
	bra.s	loc_11C450
loc_11C40A:
	tst.w	$16(a4)
	bge.s	loc_11C450
	subi.l	#$700,$9C(a4)
	bra.s	loc_11C450
loc_11C41A:
	move.l	$9C(a4),$8(a4)
	move.l	$A0(a4),$C(a4)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	lea.l	$308A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	move.l	$8(a4),$9C(a4)
	move.l	$C(a4),$A0(a4)
	addq.w	#$8,a7
loc_11C450:
	move.l	$9C(a4),d6
	asr.l	#$8,d6
	cmp.w	$AC(a4),d6
	bge.s	loc_11C486
	tst.b	$B7(a4)
	beq.s	loc_11C478
	move.w	$AC(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_11C4B6
loc_11C478:
	lea.l	BabyBio_StateFallOff(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11C4F2
loc_11C486:
	cmp.w	$AE(a4),d6
	ble.s	loc_11C4B6
	tst.b	$B8(a4)
	beq.s	loc_11C4A8
	move.w	$AE(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_11C4B6
loc_11C4A8:
	lea.l	BabyBio_StateFallOff(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11C4F2
loc_11C4B6:
	move.l	$A0(a4),d7
	asr.l	#$8,d7
	cmp.w	$B2(a4),d7
	bge.s	loc_11C4D8
	move.w	$B2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_11C4F2
loc_11C4D8:
	cmp.w	$B0(a4),d7
	ble.s	loc_11C4F2
	move.w	$B0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
loc_11C4F2:
	move.l	$9C(a4),$8(a4)
	move.l	$A0(a4),$C(a4)
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$5,d0
	beq.s	loc_11C52E
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$6,d0
	beq.s	loc_11C52E
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$8,d0
	beq.s	loc_11C52E
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$9,d0
	bne.s	loc_11C56C
loc_11C52E:
	movea.l	$A4(a4),a0
	cmpi.w	#$6400,(a0)
	blt.s	loc_11C542
	lea.l	$2FDA(a5),a0
	move.l	$2(a0),$A4(a4)
loc_11C542:
	tst.w	$16(a4)
	bne.s	loc_11C554
	movea.l	$A4(a4),a0
	move.w	(a0),d0
	ext.l	d0
	add.l	d0,$8(a4)
loc_11C554:
	tst.w	$18(a4)
	bne.s	loc_11C568
	movea.l	$A4(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	add.l	d0,$C(a4)
loc_11C568:
	addq.l	#$4,$A4(a4)
loc_11C56C:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
