; ---------------------------------------------------------------------------
; Deathbird_Update - ACTOR Update, then while active: take the body box from the current frame of the second sprite record (+$B0, when +$B4 is set) and replay the wing sound $A9 every 13 frames while frame byte +$2F is 1 (Deathbird override of slot 17 Update)
; In:  8(a6) = this
; Out: d0 = garbage
; Evidence: parent +$4A first; frame record = sprdef +$24 + frame*$14, box bytes +8..+$B mirrored by the flip bits; Snd_Stop/Snd_Play($A9); method 17 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Update:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2B1A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.w	loc_112144
	tst.b	$B4(a4)
	beq.w	loc_112106
	movea.l	$B0(a4),a0
	moveq	#$0,d0
	move.b	$A(a0),d0
	cmpi.w	#$FF,d0
	beq.w	loc_112106
	movea.l	$B0(a4),a0
	move.l	$2(a0),d0
	moveq	#$24,d1
	add.l	d1,d0
	moveq	#$0,d2
	move.b	$A(a0),d2
	lsl.l	#$4,d2
	add.l	d0,d2
	moveq	#$0,d0
	move.b	$A(a0),d0
	lsl.l	#$2,d0
	movea.l	d0,a3
	adda.l	d2,a3
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$10,d0
	and.b	(a0),d0
	beq.s	loc_1120AE
	move.b	$A(a3),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$56(a4)
	move.b	$8(a3),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$5A(a4)
	bra.s	loc_1120C6
loc_1120AE:
	move.b	$8(a3),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$56(a4)
	move.b	$A(a3),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$5A(a4)
loc_1120C6:
	movea.l	$B0(a4),a0
	moveq	#$8,d0
	and.b	(a0),d0
	beq.s	loc_1120EE
	move.b	$9(a3),d0
	ext.w	d0
	move.w	d7,d1
	sub.w	d0,d1
	move.w	d1,$58(a4)
	move.b	$B(a3),d0
	ext.w	d0
	move.w	d7,d1
	sub.w	d0,d1
	move.w	d1,$54(a4)
	bra.s	loc_112106
loc_1120EE:
	move.b	$B(a3),d0
	ext.w	d0
	add.w	d7,d0
	move.w	d0,$58(a4)
	move.b	$9(a3),d0
	ext.w	d0
	add.w	d7,d0
	move.w	d0,$54(a4)
loc_112106:
	tst.w	-$3B02(a5)
	beq.s	loc_11211A
	subq.w	#$1,-$3B02(a5)
	tst.w	-$3B02(a5)
	bgt.s	loc_11211A
	clr.w	-$3B02(a5)
loc_11211A:
	tst.w	-$3B02(a5)
	bne.s	loc_112144
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_112144
	move.w	#$D,-$3B02(a5)
	pea.l	($A9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($A9).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_112144:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
