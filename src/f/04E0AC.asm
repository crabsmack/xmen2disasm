; ---------------------------------------------------------------------------
; ApocBomb_Move - orbit the arena: x = $100 - $E0*sin(a), ground y +$A6 = $C2 + 32*cos(a), angle += -$3C70 (doubled in two-player step); after 3 passes through 180 flag expiry (+$92 bit 2); while dropping (bit 0) fall with gravity $50 to the ground (then sound $E9, start bouncing if +$96); while bouncing (bit 1) height +$9A moves 0..$2800 by +$9E; y = ground - height (APOCBOMB override of slot +$4E Move; replaces it)
; In:  8(a6) = this (APOCBOMB object), $E(a6) = word step count
; Out: none
; Evidence: class descriptor APOCBOMB slot +$4E (tools/classes.py); TAS frames 24410-26319 (1722 active)
; ---------------------------------------------------------------------------
ApocBomb_Move:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.l	$8C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	d0,d6
	move.l	$8C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.l	d0,d4
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d6,d1
	lsl.l	#$5,d1
	move.l	d0,d5
	sub.l	d1,d5
	move.l	d4,d6
	lsl.l	#$5,d6
	move.l	$8C(a4),d4
	swap	d5
	ext.l	d5
	swap	d6
	ext.l	d6
	move.l	#$100,d0
	sub.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	d6,d0
	add.w	#$C2,d0
	move.w	d0,$A6(a4)
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	g_ApocBombSpeed(a5),$90(a4)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_04E128
	move.w	$90(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	bra.s	loc_04E12E
loc_04E128:
	move.w	$90(a4),d0
	ext.l	d0
loc_04E12E:
	add.l	d0,$8C(a4)
	cmpi.l	#$16800,$8C(a4)
	addq.w	#$8,a7
	blt.s	loc_04E148
	subi.l	#$16800,$8C(a4)
	bra.s	loc_04E156
loc_04E148:
	tst.l	$8C(a4)
	bge.s	loc_04E156
	addi.l	#$16800,$8C(a4)
loc_04E156:
	cmpi.l	#$B400,d4
	bge.s	loc_04E17E
	cmpi.l	#$B400,$8C(a4)
	blt.s	loc_04E17E
	addq.w	#$1,$94(a4)
	moveq	#$3,d0
	cmp.w	$94(a4),d0
	bgt.s	loc_04E17E
	ori.w	#$4,$92(a4)
	bra.w	loc_04E22E
loc_04E17E:
	move.w	$92(a4),d0
	btst	#$0,d0
	beq.s	loc_04E1C8
	cmp.l	$C(a4),d6
	ble.s	loc_04E1A2
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	addi.w	#$50,$18(a4)
	bra.w	loc_04E22E
loc_04E1A2:
	andi.w	#$FFFE,$92(a4)
	pea.l	($E9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E9).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	$96(a4)
	addq.w	#$8,a7
	beq.s	loc_04E22E
	ori.w	#$2,$92(a4)
	bra.s	loc_04E22E
loc_04E1C8:
	moveq	#$2,d0
	and.w	$92(a4),d0
	beq.s	loc_04E224
loc_04E1D0:
	move.w	$9E(a4),d0
	ext.l	d0
	add.l	d0,$9A(a4)
	subq.w	#$1,d7
	bne.s	loc_04E1D0
	cmpi.l	#$2800,$9A(a4)
	ble.s	loc_04E20C
	move.l	#$2800,$9A(a4)
	moveq	#$1,d0
	cmp.w	$96(a4),d0
	bne.s	loc_04E1FE
	andi.w	#$FFFD,$92(a4)
loc_04E1FE:
	move.w	$9E(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$9E(a4)
	bra.s	loc_04E224
loc_04E20C:
	tst.l	$9A(a4)
	bge.s	loc_04E224
	moveq	#$0,d0
	move.l	d0,$9A(a4)
	move.w	$9E(a4),d1
	ext.l	d1
	neg.l	d1
	move.w	d1,$9E(a4)
loc_04E224:
	move.l	d6,d0
	sub.l	$9A(a4),d0
	move.l	d0,$C(a4)
loc_04E22E:
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
