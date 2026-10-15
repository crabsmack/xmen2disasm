; ---------------------------------------------------------------------------
; GaussBullet_Fire - fire a GAUSSBULLET from (x, y) or attached to an owner at an offset; speed $C00 (diagonal $800), flags flip x ($800) / y ($1000), sound $ED unless flag 8
; In:  8(a6) = x  $C(a6) = y  $10(a6) = owner or 0  $16/$1A(a6) = word offset x, y  $1C(a6) = flags
; Out: d0
; Evidence: callers in acolyte code ($013A86, $018504); record +$1C flags | $6000
; ---------------------------------------------------------------------------
GaussBullet_Fire:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$10(a6),a3
	move.l	$1C(a6),d7
	movea.l	g_GaussPool(a5),a0
	movea.l	a0,a1
	move.w	(a0),d0
	cmp.w	$2(a1),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_1191C6
	move.w	(a0),d0
	addq.w	#$1,(a0)
	ext.l	d0
	movea.l	g_GaussPool(a5),a0
	asl.l	#$5,d0
	lea.l	$8(a0,d0.l),a0
	move.l	a0,d0
	bra.s	loc_1191C8
loc_1191C6:
	moveq	#$0,d0
loc_1191C8:
	movea.l	d0,a4
	move.l	a4,d0
	beq.w	loc_119280
	move.w	#$C00,d5
	clr.w	d6
	clr.b	d4
	andi.l	#$FFFFFFFF,d7
	btst	#$0,d7
	beq.s	loc_1191EE
	move.w	#$800,d6
	move.w	#$800,d5
	moveq	#$5,d4
loc_1191EE:
	move.l	#$800,d0
	and.l	d7,d0
	beq.s	loc_119200
	ext.l	d5
	move.l	d5,d0
	neg.l	d0
	move.w	d0,d5
loc_119200:
	move.l	#$1000,d0
	and.l	d7,d0
	beq.s	loc_119212
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,d6
loc_119212:
	moveq	#$2,d0
	and.l	d7,d0
	bne.s	loc_11921A
	addq.b	#$4,d4
loc_11921A:
	moveq	#$0,d0
	move.l	d0,$4(a4)
	move.w	$16(a6),$18(a4)
	move.w	$1A(a6),$1A(a4)
	move.l	a3,d1
	beq.s	loc_11923A
	move.l	a3,$4(a4)
	ori.l	#$4,d7
loc_11923A:
	move.l	#$6000,d0
	or.l	d7,d0
	move.w	d0,$1C(a4)
	move.l	$8(a6),$8(a4)
	move.l	$C(a6),$C(a4)
	move.w	d5,$10(a4)
	move.w	d6,$12(a4)
	clr.l	$14(a4)
	move.b	d4,$1E(a4)
	move.b	#$4,$1F(a4)
	moveq	#$8,d0
	and.l	d7,d0
	bne.s	loc_119280
	pea.l	($ED).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($ED).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_119280:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
