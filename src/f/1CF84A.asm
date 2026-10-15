; ---------------------------------------------------------------------------
; Gambit_ThrowCards - throw the cards for the current throw kind: 1 card, 2 above 7 health, one more with a full meter, spread by 5/10 degrees
; In:  8(a6) = player (+$C2 = throw kind 0-9)
; Out: none
; Evidence: Tbl_GambitThrowKinds[kind] {direction class, card type, dx, dy, angle, speed}; attack type +$71 = $C up, $B down, 10/9 horizontal by facing; Gambit_SpawnCard x1 / x2 (angle +-5) / x3 (angle -10, 0, +10); Snd_Play($A0); clears +$90 $800 (meter full)
; ---------------------------------------------------------------------------
Gambit_ThrowCards:
	link.w	a6,#$FFFA
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d7
	moveq	#$0,d0
	move.b	$C2(a4),d0
	lea.l	$490A(a5),a0
	movea.l	$2(a0),a0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a3
	move.w	$2(a3),-$6(a6)
	move.w	$4(a3),-$4(a6)
	move.w	$6(a3),d4
	move.w	$8(a3),d5
	move.w	$A(a3),d6
	move.b	#$1,-$1(a6)
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1CF896
	addq.b	#$1,-$1(a6)
loc_1CF896:
	move.l	#$800,d0
	and.l	$90(a4),d0
	beq.s	loc_1CF8A6
	addq.b	#$1,-$1(a6)
loc_1CF8A6:
	move.w	(a3),d0
	beq.s	loc_1CF8B0
	subq.w	#$1,d0
	beq.s	loc_1CF8B8
	bra.s	loc_1CF8C2
loc_1CF8B0:
	move.b	#$C,$71(a4)
	bra.s	loc_1CF8D4
loc_1CF8B8:
	move.b	#$B,$71(a4)
	clr.b	d7
	bra.s	loc_1CF8D4
loc_1CF8C2:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1CF8CE
	moveq	#$9,d0
	bra.s	loc_1CF8D0
loc_1CF8CE:
	moveq	#$A,d0
loc_1CF8D0:
	move.b	d0,$71(a4)
loc_1CF8D4:
	move.b	-$1(a6),d0
	subq.b	#$1,d0
	beq.s	loc_1CF8EA
	subq.b	#$1,d0
	beq.s	loc_1CF91E
	subq.b	#$1,d0
	beq.w	loc_1CF986
	bra.w	loc_1CFA1A
loc_1CF8EA:
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	Gambit_SpawnCard(pc)
	lea.l	$20(a7),a7
	bra.w	loc_1CFA1A
loc_1CF91E:
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,d0
	subq.l	#$5,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	Gambit_SpawnCard(pc)
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,d0
	addq.l	#$5,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	Gambit_SpawnCard(pc)
	lea.l	$40(a7),a7
	bra.w	loc_1CFA1A
loc_1CF986:
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,d0
	moveq	#$A,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	a4,-(a7)
	jsr	Gambit_SpawnCard(pc)
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	Gambit_SpawnCard(pc)
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,d0
	moveq	#$A,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.w	-$4(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.w	-$6(a6),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	a4,-(a7)
	jsr	Gambit_SpawnCard(pc)
	lea.l	$60(a7),a7
loc_1CFA1A:
	pea.l	($9F).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($A0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($A0).w
	jsr	$521A(a5)	; -> Snd_Play
	andi.l	#$FFFFF7FF,$90(a4)
	lea.l	$C(a7),a7
	movem.l	-$1E(a6),d4-d7/a3-a4
	unlk	a6
	rts
