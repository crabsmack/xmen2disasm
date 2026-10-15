; ---------------------------------------------------------------------------
; sub_1CF1EC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CF1EC:
	link.w	a6,#$FFFA
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$22(a6),d6
	move.w	$1E(a6),d4
	move.w	$16(a6),d5
	movea.l	$8(a6),a3
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	move.l	$C(a3),d7
	asr.l	#$8,d7
	ext.l	d6
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.l	d0,d1
	move.l	d6,d0
	jsr	$3F9A(a5)	; -> Math_LMul
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
	ext.l	d6
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	d0,d1
	move.l	d6,d0
	jsr	$3F9A(a5)	; -> Math_LMul
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	move.l	a3,-(a7)
	jsr	sub_1CF1B6(pc)
	movea.l	d0,a4
	move.w	-$6(a6),d0
	ext.l	d0
	moveq	#$10,d1
	and.b	$2E(a3),d1
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CF264
	ext.l	d5
	move.l	d5,d1
	bra.s	loc_1CF26A
loc_1CF264:
	ext.l	d5
	move.l	d5,d1
	neg.l	d1
loc_1CF26A:
	add.l	d0,d1
	move.l	d1,d4
	lsl.l	#$8,d4
	ext.l	d7
	move.w	$1A(a6),d0
	ext.l	d0
	add.l	d7,d0
	move.l	d0,d5
	lsl.l	#$8,d5
	move.l	d4,d6
	asr.l	#$8,d6
	move.l	d5,d7
	asr.l	#$8,d7
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
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	tst.b	d0
	lea.l	$24(a7),a7
	beq.s	loc_1CF2BA
	moveq	#$0,d0
	bra.w	loc_1CF364
loc_1CF2BA:
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
	ext.l	d6
	moveq	#$10,d1
	and.b	$2E(a3),d1
	beq.s	loc_1CF2E2
	moveq	#-$20,d1
	bra.s	loc_1CF2E4
loc_1CF2E2:
	moveq	#$20,d1
loc_1CF2E4:
	ext.w	d1
	ext.l	d1
	move.l	d6,d0
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1CF302
	moveq	#$0,d0
	bra.s	loc_1CF364
loc_1CF302:
	move.l	a4,d0
	bne.s	loc_1CF30A
	moveq	#$0,d0
	bra.s	loc_1CF364
loc_1CF30A:
	move.b	$F(a6),$E(a4)
	move.l	d4,(a4)
	move.l	d5,$4(a4)
	moveq	#$10,d0
	and.b	$2E(a3),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CF32A
	move.w	-$4(a6),d0
	ext.l	d0
	bra.s	loc_1CF332
loc_1CF32A:
	move.w	-$4(a6),d0
	ext.l	d0
	neg.l	d0
loc_1CF332:
	move.w	d0,$8(a4)
	tst.b	$27(a6)
	beq.s	loc_1CF346
	move.w	-$2(a6),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_1CF34C
loc_1CF346:
	move.w	-$2(a6),d0
	ext.l	d0
loc_1CF34C:
	move.w	d0,$A(a4)
	move.b	#$8,$F(a4)
	move.b	$71(a3),$C(a4)
	move.b	$13(a6),$D(a4)
	move.l	a4,d0
loc_1CF364:
	movem.l	-$22(a6),d3-d7/a3-a4
	unlk	a6
	rts
