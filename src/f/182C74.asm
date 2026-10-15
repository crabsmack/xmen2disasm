; ---------------------------------------------------------------------------
; sub_182C74	[jt 2133]
; ---------------------------------------------------------------------------
sub_182C74:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$BC(a4),a3
	andi.l	#$FFFFFFFD,$90(a4)
	andi.l	#$FFFFFFFB,$90(a4)
	move.b	#$1,-$3892(a5)
	clr.l	$A6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$9D(a4)
	bne.s	loc_182CC6
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_182CD4
loc_182CC6:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_182CD4:
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$3,d1
	and.w	d0,d1
	subq.w	#$2,d1
	beq.s	loc_182CEA
	subq.w	#$1,d1
	beq.s	loc_182D1E
	bra.w	loc_182DB8
loc_182CEA:
	andi.b	#$EF,$2E(a4)
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	move.w	$C(a3),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	lea.l	$C(a7),a7
	bra.s	loc_182D50
loc_182D1E:
	ori.b	#$10,$2E(a4)
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	move.w	$8(a3),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	lea.l	$C(a7),a7
loc_182D50:
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$40,d1
	and.w	d0,d1
	beq.s	loc_182D84
	pea.l	($9E).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($9E).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	move.w	#$6,$6C(a4)
	lea.l	sub_182BDE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_182DB8
loc_182D84:
	moveq	#$10,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($81).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($81).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_182DC2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_182DB8:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
