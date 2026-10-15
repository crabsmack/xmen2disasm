; ---------------------------------------------------------------------------
; SmallBrood_StateLand - SMALLBROOD state: settle onto the floor or ceiling inside its x range, then run the next AI-script step
; In:  8(a6) = this
; Out: d0
; Evidence: when y is the floor (+$A8) or ceiling (+$AA) and x in [+$A2, +$A4]: v-flip on the ceiling, next script step (+$98/+$96, else +$64); otherwise clamps x/y and falls with gravity +$20 = $100; TAS 46554-57115
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateLand:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	cmp.w	$A8(a4),d7
	addq.w	#$8,a7
	beq.s	loc_0846E6
	cmp.w	$AA(a4),d7
	bne.s	loc_08474A
loc_0846E6:
	cmp.w	$A2(a4),d6
	blt.s	loc_08474A
	cmp.w	$A4(a4),d6
	bgt.s	loc_08474A
	cmp.w	$AA(a4),d7
	bne.s	loc_084700
	ori.b	#$8,$2E(a4)
	bra.s	loc_084706
loc_084700:
	andi.b	#$F7,$2E(a4)
loc_084706:
	tst.l	$98(a4)
	bne.s	loc_08471A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_08484A
loc_08471A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_08472E
	clr.w	$96(a4)
loc_08472E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_08484A
loc_08474A:
	cmp.w	$A2(a4),d6
	bge.s	loc_084788
	tst.b	$A0(a4)
	beq.s	loc_08476C
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0847C6
loc_08476C:
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_08484A
loc_084788:
	cmp.w	$A4(a4),d6
	ble.s	loc_0847C6
	tst.b	$A1(a4)
	beq.s	loc_0847AA
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0847C6
loc_0847AA:
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_08484A
loc_0847C6:
	cmp.w	$A8(a4),d7
	ble.s	loc_0847DA
	move.w	$A8(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.s	loc_084808
loc_0847DA:
	cmp.w	$AA(a4),d7
	bge.s	loc_0847EE
	move.w	$AA(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	bra.s	loc_084808
loc_0847EE:
	move.w	#$100,$20(a4)
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_08484A
loc_084808:
	cmp.w	$AA(a4),d7
	bne.s	loc_084816
	ori.b	#$8,$2E(a4)
	bra.s	loc_08481C
loc_084816:
	andi.b	#$F7,$2E(a4)
loc_08481C:
	tst.l	$98(a4)
	bne.s	loc_08482E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_08484A
loc_08482E:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_08484A:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
