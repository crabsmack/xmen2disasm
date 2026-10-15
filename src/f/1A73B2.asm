; ---------------------------------------------------------------------------
; sub_1A73B2	[jt 2203]
; ---------------------------------------------------------------------------
sub_1A73B2:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.l	$90(a4),d0
	beq.s	loc_1A73DC
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A7498
loc_1A73DC:
	ori.l	#$2,$90(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	movea.l	a0,a1
	adda.w	$30(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7430
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A7438
loc_1A7430:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A7438:
	lea.l	$10(a7),a7
	beq.s	loc_1A7456
	ori.b	#$10,$2E(a4)
	move.w	#$8FC,$22(a4)
	move.w	#$F704,$16(a4)
	clr.w	$1E(a4)
	bra.s	loc_1A748A
loc_1A7456:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A746A
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A7472
loc_1A746A:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A7472:
	beq.s	loc_1A748A
	andi.b	#$EF,$2E(a4)
	move.w	#$8FC,$22(a4)
	move.w	#$8FC,$16(a4)
	clr.w	$1E(a4)
loc_1A748A:
	lea.l	$4C9A(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
loc_1A7498:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
