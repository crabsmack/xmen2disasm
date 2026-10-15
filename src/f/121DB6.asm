; ---------------------------------------------------------------------------
; sub_121DB6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_121DB6:
	link.w	a6,#$FFE8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	-$1A8C(a5),-$C(a6)
	clr.w	d5
	move.b	#$1,-$7(a6)
	move.l	$8(a3),d4
	asr.l	#$8,d4
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	move.w	#$18,-$4(a6)
	move.w	$A0(a3),d0
	asr.w	#$4,d0
	moveq	#$30,d6
	sub.w	d0,d6
	move.w	d6,d0
	asr.w	#$2,d0
	move.w	d0,-$2(a6)
	moveq	#$0,d7
loc_121DFA:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_121E0A
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_121E10
loc_121E0A:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_121E10:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_121E9A
	tst.w	$6A(a4)
	bne.s	loc_121E9A
	ext.l	d4
	ext.l	d6
	move.l	d4,d0
	add.l	d6,d0
	move.w	$56(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	blt.s	loc_121E9A
	ext.l	d4
	ext.l	d6
	move.l	d4,d0
	sub.l	d6,d0
	move.w	$5A(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	bgt.s	loc_121E9A
	move.w	-$6(a6),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	move.w	$54(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	blt.s	loc_121E9A
	move.w	-$6(a6),d0
	ext.l	d0
	ext.l	d6
	sub.l	d6,d0
	move.w	$58(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	bgt.s	loc_121E9A
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_121E9A:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_121DFA
	clr.w	d7
loc_121EA6:
	btst	#$0,d7
	beq.s	loc_121F28
	ext.l	d5
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d5,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.w	-$2(a6),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$10(a6)
	ext.l	d5
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d5,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.w	-$2(a6),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$E(a6)
	move.w	-$10(a6),d0
	ext.l	d0
	move.l	d0,-$14(a6)
	movea.l	-$C(a6),a0
	move.w	$4(a0),d0
	ext.l	d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	-$14(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	d4,d0
	movea.l	-$C(a6),a0
	move.w	d0,(a0)
	lea.l	$C(a7),a7
	bra.s	loc_121F9C
loc_121F28:
	ext.l	d5
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d5,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	ext.l	d6
	move.l	d6,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$10(a6)
	ext.l	d5
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d5,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	ext.l	d6
	move.l	d6,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$E(a6)
	move.w	-$10(a6),d0
	ext.l	d0
	move.l	d0,-$18(a6)
	movea.l	-$C(a6),a0
	move.w	$4(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	-$18(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	d4,d0
	movea.l	-$C(a6),a0
	move.w	d0,(a0)
	lea.l	$C(a7),a7
loc_121F9C:
	movea.l	-$C(a6),a0
	move.w	$9C(a3),$4(a0)
	move.w	-$6(a6),d0
	sub.w	-$E(a6),d0
	movea.l	-$C(a6),a0
	move.w	d0,$2(a0)
	add.w	-$4(a6),d5
	move.l	-$C(a6),d0
	addq.l	#$6,-$C(a6)
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$10,d7
	blt.w	loc_121EA6
	cmpi.w	#$14,d6
	bgt.s	loc_121FDC
	move.b	#$1,-$7(a6)
	bra.s	loc_121FE6
loc_121FDC:
	clr.b	-$7(a6)
	addi.w	#$A,$A0(a3)
loc_121FE6:
	move.w	$A0(a3),d0
	asr.w	#$4,d0
	add.w	d0,$9C(a3)
	move.w	$A0(a3),d0
	asr.w	#$4,d0
	add.w	d0,$9E(a3)
	cmpi.w	#$168,$9C(a3)
	ble.s	loc_122008
	subi.w	#$168,$9C(a3)
loc_122008:
	cmpi.w	#$168,$9E(a3)
	ble.s	loc_122016
	subi.w	#$168,$9E(a3)
loc_122016:
	move.b	-$7(a6),d0
	movem.l	-$34(a6),d3-d7/a3-a4
	unlk	a6
	rts
