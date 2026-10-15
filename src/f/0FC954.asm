; ---------------------------------------------------------------------------
; SiberiaB1_StepWind - SiberiaB1 blizzard: step the wind toward the next Tbl_SiberiaB1Wind keyframe (angle, strength), play wind sound $20/$21, compute the snow scroll vector
; In:  none
; Out: none
; Evidence: keyframe pointer $FFC6EC, angle $FFC6FC, strength $FFC6FA, Math_CosDeg/SinDeg -> $FFC744/$FFC742 used by SiberiaB1_CamApply
; ---------------------------------------------------------------------------
SiberiaB1_StepWind:
	link.w	a6,#$FFF8
	movem.l	d3-d7,-(a7)
	clr.w	d6
	move.w	-$3B06(a5),d5
	tst.w	-$3B08(a5)
	bgt.w	loc_0FCB84
	move.w	-$3B40(a5),d0
	add.w	d0,-$3B04(a5)
	move.w	-$3B48(a5),d0
	add.w	d0,-$3B06(a5)
	move.w	#$8,-$3B08(a5)
	tst.w	-$3B48(a5)
	blt.s	loc_0FC994
	movea.l	-$3B14(a5),a0
	move.w	-$3B06(a5),d0
	cmp.w	$4(a0),d0
	bge.s	loc_0FC9AC
loc_0FC994:
	tst.w	-$3B48(a5)
	bge.w	loc_0FCB1E
	movea.l	-$3B14(a5),a0
	move.w	-$3B06(a5),d0
	cmp.w	$4(a0),d0
	bgt.w	loc_0FCB1E
loc_0FC9AC:
	movea.l	-$3B14(a5),a0
	move.w	$4(a0),-$3B06(a5)
	tst.w	-$3B40(a5)
	blt.s	loc_0FC9C6
	move.w	-$3B04(a5),d0
	cmp.w	$2(a0),d0
	bge.s	loc_0FC9DE
loc_0FC9C6:
	tst.w	-$3B40(a5)
	bge.w	loc_0FCB1E
	movea.l	-$3B14(a5),a0
	move.w	-$3B04(a5),d0
	cmp.w	$2(a0),d0
	bgt.w	loc_0FCB1E
loc_0FC9DE:
	movea.l	-$3B14(a5),a0
	move.w	$2(a0),d5
	move.w	$4(a0),d7
	move.w	(a0),d4
	move.l	a0,d0
	addq.l	#$8,-$3B14(a5)
	movea.l	-$3B14(a5),a0
	tst.w	(a0)
	bge.s	loc_0FCA04
	lea.l	$2992(a5),a0
	move.l	$2(a0),-$3B14(a5)
loc_0FCA04:
	movea.l	-$3B14(a5),a0
	tst.w	$2(a0)
	bne.s	loc_0FCA2A
	moveq	#$20,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$21,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$21,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$C(a7),a7
loc_0FCA2A:
	movea.l	-$3B14(a5),a0
	moveq	#$37,d0
	cmp.w	$2(a0),d0
	bne.s	loc_0FCA52
	moveq	#$21,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$20,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$20,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$C(a7),a7
loc_0FCA52:
	movea.l	-$3B14(a5),a0
	move.w	$4(a0),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	asr.l	#$7,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0FCA7A
	movea.l	-$3B14(a5),a0
	move.w	$4(a0),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	asr.l	#$7,d0
	bra.s	loc_0FCA8C
loc_0FCA7A:
	movea.l	-$3B14(a5),a0
	move.w	$4(a0),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	asr.l	#$7,d0
	neg.l	d0
loc_0FCA8C:
	move.w	d0,d6
	bne.s	loc_0FCAA0
	movea.l	-$3B14(a5),a0
	move.w	$2(a0),d0
	sub.w	d5,d0
	move.w	d0,-$3B40(a5)
	bra.s	loc_0FCABA
loc_0FCAA0:
	movea.l	-$3B14(a5),a0
	move.w	$2(a0),d0
	ext.l	d0
	ext.l	d5
	sub.l	d5,d0
	ext.l	d6
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.w	d0,-$3B40(a5)
loc_0FCABA:
	tst.w	-$3B40(a5)
	ble.s	loc_0FCADA
	moveq	#$5,d0
	cmp.w	-$3B40(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0FCAD2
	move.w	-$3B40(a5),d0
	bra.s	loc_0FCAD4
loc_0FCAD2:
	moveq	#$5,d0
loc_0FCAD4:
	move.w	d0,-$3B40(a5)
	bra.s	loc_0FCAF8
loc_0FCADA:
	tst.w	-$3B40(a5)
	bge.s	loc_0FCAF8
	moveq	#-$5,d0
	cmp.w	-$3B40(a5),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0FCAF2
	move.w	-$3B40(a5),d0
	bra.s	loc_0FCAF4
loc_0FCAF2:
	moveq	#-$5,d0
loc_0FCAF4:
	move.w	d0,-$3B40(a5)
loc_0FCAF8:
	movea.l	-$3B14(a5),a0
	cmp.w	$4(a0),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0FCB0C
	move.w	#$80,d0
	bra.s	loc_0FCB0E
loc_0FCB0C:
	moveq	#-$80,d0
loc_0FCB0E:
	move.w	d0,-$3B48(a5)
	move.w	d5,-$3B04(a5)
	move.w	d7,-$3B06(a5)
	move.w	d4,-$3B08(a5)
loc_0FCB1E:
	move.w	-$3B06(a5),d0
	ext.l	d0
	move.l	d0,-$4(a6)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.l	-$4(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> Math_LMul
	move.l	d0,d4
	move.w	-$3B06(a5),d0
	ext.l	d0
	move.l	d0,-$8(a6)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	-$8(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> Math_LMul
	move.l	d0,d5
	move.l	d4,d7
	swap	d7
	ext.l	d7
	asr.w	#$8,d7
	move.l	d5,d4
	swap	d4
	ext.l	d4
	asr.w	#$8,d4
	tst.l	d4
	addq.w	#$8,a7
	move.w	d7,g_BgOffsetX(a5)
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
	move.w	d0,g_BgOffsetY(a5)
loc_0FCB84:
	movem.l	-$1C(a6),d3-d7
	unlk	a6
	rts
