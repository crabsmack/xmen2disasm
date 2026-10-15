; ---------------------------------------------------------------------------
; LittleLeg_Update - LITTLELEG slot +$0E (timer callback): step the three sprite animations and follow the boss scroll
; In:  8(a6) = this
; Out: none
; Evidence: per sprite: frame counter += 1 (2 when g_TwoPlayerStep), advance the frame list, stop at the end when flag bit 1; screen pos +4/+6 = world +8/+A minus the boss offsets g_BroodBossOffsetX/g_BroodBossOffsetY; TAS 49292-51071 every frame
; Found: jt 613
; ---------------------------------------------------------------------------
LittleLeg_Update:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_085D62
	moveq	#$2,d0
	bra.s	loc_085D64
loc_085D62:
	moveq	#$1,d0
loc_085D64:
	move.w	d0,d7
	moveq	#$0,d0
	move.b	$C(a4),d0
	tst.l	d0
	beq.w	loc_085EE0
	tst.l	$E(a4)
	beq.s	loc_085DEC
	add.w	d7,$12(a4)
	movea.l	$E(a4),a0
	move.w	$12(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_085DEC
	addq.w	#$1,$14(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$14(a4),d0
	bgt.s	loc_085DB2
	clr.w	$14(a4)
	movea.l	$E(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_085DB2
	moveq	#$0,d0
	move.l	d0,$E(a4)
loc_085DB2:
	tst.l	$E(a4)
	beq.s	loc_085DEC
	move.w	$14(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$E(a4),d0
	movea.l	d0,a0
	move.b	$7(a0),$17(a4)
	moveq	#$0,d0
	move.b	$17(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_085DE2
	move.b	$17(a4),d0
	cmp.b	$20(a4),d0
	beq.s	loc_085DE8
loc_085DE2:
	andi.b	#$DF,$16(a4)
loc_085DE8:
	clr.w	$12(a4)
loc_085DEC:
	tst.l	$2A(a4)
	beq.s	loc_085E66
	add.w	d7,$2E(a4)
	movea.l	$2A(a4),a0
	move.w	$2E(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_085E66
	addq.w	#$1,$30(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$30(a4),d0
	bgt.s	loc_085E2C
	clr.w	$30(a4)
	movea.l	$2A(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_085E2C
	moveq	#$0,d0
	move.l	d0,$2A(a4)
loc_085E2C:
	tst.l	$2A(a4)
	beq.s	loc_085E66
	move.w	$30(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$2A(a4),d0
	movea.l	d0,a0
	move.b	$7(a0),$33(a4)
	moveq	#$0,d0
	move.b	$33(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_085E5C
	move.b	$33(a4),d0
	cmp.b	$3C(a4),d0
	beq.s	loc_085E62
loc_085E5C:
	andi.b	#$DF,$32(a4)
loc_085E62:
	clr.w	$2E(a4)
loc_085E66:
	tst.l	$46(a4)
	beq.s	loc_085EE0
	add.w	d7,$4A(a4)
	movea.l	$46(a4),a0
	move.w	$4A(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_085EE0
	addq.w	#$1,$4C(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$4C(a4),d0
	bgt.s	loc_085EA6
	clr.w	$4C(a4)
	movea.l	$46(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_085EA6
	moveq	#$0,d0
	move.l	d0,$46(a4)
loc_085EA6:
	tst.l	$46(a4)
	beq.s	loc_085EE0
	move.w	$4C(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$46(a4),d0
	movea.l	d0,a0
	move.b	$7(a0),$4F(a4)
	moveq	#$0,d0
	move.b	$4F(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_085ED6
	move.b	$4F(a4),d0
	cmp.b	$58(a4),d0
	beq.s	loc_085EDC
loc_085ED6:
	andi.b	#$DF,$4E(a4)
loc_085EDC:
	clr.w	$4A(a4)
loc_085EE0:
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	move.w	$8(a4),d1
	sub.w	d0,d1
	move.w	d1,$4(a4)
	move.l	g_BroodBossOffsetY(a5),d0
	asr.l	#$8,d0
	move.w	$A(a4),d1
	sub.w	d0,d1
	move.w	d1,$6(a4)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
