; ---------------------------------------------------------------------------
; sub_122B96	[link-after-rts]
; ---------------------------------------------------------------------------
sub_122B96:
	link.w	a6,#$FFE4
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	-$1A8C(a5),a4
	moveq	#$1,d7
	clr.w	d4
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	clr.w	$1E(a3)
	clr.l	$16(a3)
	clr.w	$20(a3)
	move.w	#$18,-$A(a6)
	move.w	$A0(a3),d0
	asr.w	#$4,d0
	moveq	#$30,d1
	sub.w	d0,d1
	move.w	d1,d0
	move.w	d0,-$6(a6)
	asr.w	#$2,d0
	move.w	d0,-$8(a6)
	clr.w	-$10(a6)
loc_122BEA:
	move.w	-$10(a6),d0
	btst	#$0,d0
	beq.s	loc_122C6C
	ext.l	d4
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d4,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.w	-$8(a6),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$14(a6)
	ext.l	d4
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d4,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.w	-$8(a6),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$12(a6)
	move.w	-$14(a6),d0
	ext.l	d0
	move.l	d0,-$18(a6)
	move.w	$4(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	-$18(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	-$E(a6),d0
	move.w	d0,-$4(a6)
	lea.l	$C(a7),a7
	bra.s	loc_122CE0
loc_122C6C:
	ext.l	d4
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d4,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.w	-$6(a6),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$14(a6)
	ext.l	d4
	move.w	$9E(a3),d0
	ext.l	d0
	add.l	d4,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.w	-$6(a6),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.w	d0,-$12(a6)
	move.w	-$14(a6),d0
	ext.l	d0
	move.l	d0,-$1C(a6)
	move.w	$4(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	-$1C(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	-$E(a6),d0
	move.w	d0,-$4(a6)
	lea.l	$C(a7),a7
loc_122CE0:
	move.w	$9C(a3),$4(a4)
	move.w	-$4(a6),d5
	sub.w	(a4),d5
	cmpi.w	#$8,d5
	ble.s	loc_122CF8
	addq.w	#$8,(a4)
	clr.b	d7
	bra.s	loc_122D16
loc_122CF8:
	tst.w	d5
	ble.s	loc_122D02
	add.w	d5,(a4)
	clr.b	d7
	bra.s	loc_122D16
loc_122D02:
	cmpi.w	#$FFF8,d5
	bge.s	loc_122D0E
	subq.w	#$8,(a4)
	clr.b	d7
	bra.s	loc_122D16
loc_122D0E:
	tst.w	d5
	bge.s	loc_122D16
	add.w	d5,(a4)
	clr.b	d7
loc_122D16:
	move.w	-$C(a6),d0
	sub.w	-$12(a6),d0
	move.w	d0,d6
	move.w	d6,-$2(a6)
	sub.w	$2(a4),d6
	cmpi.w	#$8,d6
	ble.s	loc_122D36
	addq.w	#$8,$2(a4)
	clr.b	d7
	bra.s	loc_122D5A
loc_122D36:
	tst.w	d6
	ble.s	loc_122D42
	add.w	d6,$2(a4)
	clr.b	d7
	bra.s	loc_122D5A
loc_122D42:
	cmpi.w	#$FFF8,d6
	bge.s	loc_122D50
	subq.w	#$8,$2(a4)
	clr.b	d7
	bra.s	loc_122D5A
loc_122D50:
	tst.w	d6
	bge.s	loc_122D5A
	add.w	d6,$2(a4)
	clr.b	d7
loc_122D5A:
	add.w	-$A(a6),d4
	addq.w	#$6,a4
	move.w	-$10(a6),d0
	addq.w	#$1,-$10(a6)
	moveq	#$10,d0
	cmp.w	-$10(a6),d0
	bgt.w	loc_122BEA
	tst.b	d7
	beq.s	loc_122DA2
	move.w	#$F,$6E(a3)
	pea.l	($FB).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($FB).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	clr.w	$6C(a3)
	lea.l	sub_122AFA(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_122DB4
loc_122DA2:
	clr.w	$6C(a3)
	lea.l	sub_122B96(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_122DB4:
	movem.l	-$38(a6),d3-d7/a3-a4
	unlk	a6
	rts
