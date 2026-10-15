; ---------------------------------------------------------------------------
; WallCrawlBio_Move - WallCrawlBio Move override (class slot 18, +$4E): on the last frame of the crawl animation step the crawl position 7 px along the wall in the velocity's direction (+$9C when +$BC == 2, else +$A0), keep it inside [+$AC, +$AE] (stop there if +$B7/+$B8 is set, else BabyBio_StateFallOff), then copy +$9C/+$A0 to x/y
; In:  8(a6) = this  $C(a6) = word frame step (unused)
; Out: none
; Evidence: no velocity/acceleration integration: only the sign of +$16/+$18 is read; step when +$4A == animation length - 1 and +$48 == 3; +$9C/+$A0 -> +$8/+$C at the end; method 18 of class descriptor $11BAA0 (name string "WALLCRAWLBIO", parent BABYBIO); TAS 32657-33098
; ---------------------------------------------------------------------------
WallCrawlBio_Move:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$BC(a4),d0
	cmpi.w	#$2,d0
	bne.s	loc_11E1CC
	movea.l	$44(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	subq.l	#$1,d0
	move.w	$4A(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	bgt.s	loc_11E208
	moveq	#$3,d0
	cmp.w	$48(a4),d0
	bne.s	loc_11E208
	tst.w	$16(a4)
	ble.s	loc_11E1BC
	addi.l	#$700,$9C(a4)
	bra.s	loc_11E208
loc_11E1BC:
	tst.w	$16(a4)
	bge.s	loc_11E208
	subi.l	#$700,$9C(a4)
	bra.s	loc_11E208
loc_11E1CC:
	movea.l	$44(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	subq.l	#$1,d0
	move.w	$4A(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	bgt.s	loc_11E208
	moveq	#$3,d0
	cmp.w	$48(a4),d0
	bne.s	loc_11E208
	tst.w	$18(a4)
	ble.s	loc_11E1FA
	addi.l	#$700,$A0(a4)
	bra.s	loc_11E208
loc_11E1FA:
	tst.w	$18(a4)
	bge.s	loc_11E208
	subi.l	#$700,$A0(a4)
loc_11E208:
	moveq	#$0,d0
	move.b	$BC(a4),d0
	cmpi.w	#$2,d0
	bne.s	loc_11E280
	move.l	$9C(a4),d6
	asr.l	#$8,d6
	cmp.w	$AC(a4),d6
	bge.s	loc_11E24E
	tst.b	$B7(a4)
	beq.s	loc_11E23E
	move.w	$AC(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.w	loc_11E2E4
loc_11E23E:
	lea.l	BabyBio_StateFallOff(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_11E2E4
loc_11E24E:
	cmp.w	$AE(a4),d6
	ble.w	loc_11E2E4
	tst.b	$B8(a4)
	beq.s	loc_11E272
	move.w	$AE(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_11E2E4
loc_11E272:
	lea.l	BabyBio_StateFallOff(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11E2E4
loc_11E280:
	move.l	$A0(a4),d7
	asr.l	#$8,d7
	cmp.w	$AC(a4),d7
	bge.s	loc_11E2B6
	tst.b	$B7(a4)
	beq.s	loc_11E2A8
	move.w	$AC(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_11E2E4
loc_11E2A8:
	lea.l	BabyBio_StateFallOff(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11E2E4
loc_11E2B6:
	cmp.w	$AE(a4),d7
	ble.s	loc_11E2E4
	tst.b	$B8(a4)
	beq.s	loc_11E2D8
	move.w	$AE(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_11E2E4
loc_11E2D8:
	lea.l	BabyBio_StateFallOff(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
loc_11E2E4:
	move.l	$9C(a4),$8(a4)
	move.l	$A0(a4),$C(a4)
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
