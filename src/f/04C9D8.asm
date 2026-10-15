; ---------------------------------------------------------------------------
; Apocalypse_Move - circling (+$8C bit 0): place on the ellipse x = $100 - $AF*sin(a), y = $85 + 10*cos(a), advance a (+$8E) by +$90 (doubled in two-player step) and pick frame 0/$81/$82/$83 by angle; else n times: moving to +$9A/+$9C (bit 4) with jitter countdown +$A0 (Apocalypse_StartJitter) and stop within 16 px, integrate velocity and acceleration, plus wave offsets from +$B2 when bit 6 (APOCALYPSE override of slot +$4E Move; replaces it)
; In:  8(a6) = this (APOCALYPSE object), $E(a6) = word step count
; Out: none
; Evidence: class descriptor APOCALYPSE slot +$4E (tools/classes.py); TAS frames 24088-27245 (3157 active)
; ---------------------------------------------------------------------------
Apocalypse_Move:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$8C(a4),d0
	tst.l	d0
	btst	#$0,d0
	beq.w	loc_04CAF2
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	d0,d1
	mulu.w	#$AF,d0
	swap	d1
	mulu.w	#$AF,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.l	d0,d5
	swap	d5
	ext.l	d5
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	add.l	d0,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	move.l	d0,d4
	swap	d4
	ext.l	d4
	ext.l	d5
	move.l	#$100,d0
	sub.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	ext.l	d4
	move.l	d4,d0
	add.l	#$85,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_04CA62
	move.w	$90(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	bra.s	loc_04CA68
loc_04CA62:
	move.w	$90(a4),d0
	ext.l	d0
loc_04CA68:
	add.w	d0,$8E(a4)
	cmpi.w	#$168,$8E(a4)
	addq.w	#$8,a7
	blt.s	loc_04CA7E
	subi.w	#$168,$8E(a4)
	bra.s	loc_04CA8A
loc_04CA7E:
	tst.w	$8E(a4)
	bge.s	loc_04CA8A
	addi.w	#$168,$8E(a4)
loc_04CA8A:
	moveq	#$64,d0
	cmp.w	$8E(a4),d0
	ble.s	loc_04CA96
	clr.w	d4
	bra.s	loc_04CADE
loc_04CA96:
	moveq	#$7D,d0
	cmp.w	$8E(a4),d0
	ble.s	loc_04CAA4
	move.w	#$81,d4
	bra.s	loc_04CADE
loc_04CAA4:
	cmpi.w	#$96,$8E(a4)
	bge.s	loc_04CAB2
	move.w	#$82,d4
	bra.s	loc_04CADE
loc_04CAB2:
	moveq	#$1E,d0
	cmp.w	$8E(a4),d0
	ble.s	loc_04CAC0
	move.w	#$83,d4
	bra.s	loc_04CADE
loc_04CAC0:
	cmpi.w	#$EB,$8E(a4)
	bge.s	loc_04CACE
	move.w	#$82,d4
	bra.s	loc_04CADE
loc_04CACE:
	cmpi.w	#$104,$8E(a4)
	bge.s	loc_04CADC
	move.w	#$81,d4
	bra.s	loc_04CADE
loc_04CADC:
	clr.w	d4
loc_04CADE:
	ext.l	d4
	move.l	d4,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_04CC38
loc_04CAF2:
	moveq	#$0,d0
	move.w	$8C(a4),d0
	moveq	#$10,d1
	and.w	d0,d1
	beq.w	loc_04CB9E
	moveq	#-$64,d0
	cmp.w	$A0(a4),d0
	beq.s	loc_04CB1C
	tst.w	$A0(a4)
	bgt.s	loc_04CB18
	move.l	a4,-(a7)
	jsr	Apocalypse_StartJitter(pc)
	addq.w	#$4,a7
	bra.s	loc_04CB1C
loc_04CB18:
	subq.w	#$1,$A0(a4)
loc_04CB1C:
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_04CB40
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	bra.s	loc_04CB50
loc_04CB40:
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	neg.l	d0
loc_04CB50:
	move.w	$9C(a4),d1
	ext.l	d1
	move.l	$C(a4),d2
	asr.l	#$8,d2
	sub.l	d2,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_04CB74
	move.w	$9C(a4),d1
	ext.l	d1
	move.l	$C(a4),d2
	asr.l	#$8,d2
	sub.l	d2,d1
	bra.s	loc_04CB84
loc_04CB74:
	move.w	$9C(a4),d1
	ext.l	d1
	move.l	$C(a4),d2
	asr.l	#$8,d2
	sub.l	d2,d1
	neg.l	d1
loc_04CB84:
	add.l	d0,d1
	moveq	#$10,d0
	cmp.l	d1,d0
	blt.s	loc_04CB9E
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	andi.w	#$FFEF,$8C(a4)
loc_04CB9E:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	moveq	#$0,d0
	move.w	$8C(a4),d0
	moveq	#$40,d1
	and.w	d0,d1
	beq.s	loc_04CC30
	move.b	$B6(a4),d6
	moveq	#$0,d0
	move.b	d6,d0
	moveq	#$0,d1
	move.b	$B8(a4),d1
	add.w	d0,d1
	moveq	#$1F,d0
	and.w	d1,d0
	move.b	d0,-$1(a6)
	moveq	#$0,d7
	move.b	$B7(a4),d7
	moveq	#$0,d0
	move.b	d6,d0
	movea.l	$B2(a4),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	asr.w	d7,d0
	ext.l	d0
	move.l	d0,d4
	moveq	#$0,d0
	move.b	-$1(a6),d0
	movea.l	$B2(a4),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	asr.w	d7,d0
	ext.l	d0
	move.l	d0,d5
	add.l	d4,$8(a4)
	add.l	d5,$C(a4)
	addq.b	#$1,$B6(a4)
	moveq	#$0,d0
	move.b	$B6(a4),d0
	moveq	#$1F,d1
	and.b	d0,d1
	move.b	d1,$B6(a4)
loc_04CC30:
	subq.w	#$1,$E(a6)
	bne.w	loc_04CAF2
loc_04CC38:
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
