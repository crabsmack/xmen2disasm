; ---------------------------------------------------------------------------
; sub_1B92C0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1B92C0:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1B930E
	tst.b	$9D(a4)
	bne.s	loc_1B92EC
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1B92FA
loc_1B92EC:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1B92FA:
	lea.l	sub_1B947C(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1B947C(pc)
	addq.w	#$4,a7
	bra.w	loc_1B9472
loc_1B930E:
	tst.l	$44(a4)
	bne.s	loc_1B9354
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$9D(a4)
	bne.s	loc_1B9332
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1B9340
loc_1B9332:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1B9340:
	lea.l	sub_1B947C(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1B947C(pc)
	addq.w	#$4,a7
	bra.w	loc_1B9472
loc_1B9354:
	moveq	#$2,d0
	and.l	$90(a4),d0
	beq.w	loc_1B93E6
	tst.w	$6E(a4)
	bgt.w	loc_1B93E6
	andi.l	#$FFFFFFFD,$90(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1B937A
	moveq	#$9,d0
	bra.s	loc_1B937C
loc_1B937A:
	moveq	#$A,d0
loc_1B937C:
	move.b	d0,$71(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$3C(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($92).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.b	$9D(a4)
	lea.l	$10(a7),a7
	bne.s	loc_1B93BC
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1B93CA
loc_1B93BC:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1B93CA:
	move.w	#$2710,$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_1B92C0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1B9472
loc_1B93E6:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1B93F6
	moveq	#$30,d0
	cmp.w	$16(a4),d0
	bge.s	loc_1B9406
loc_1B93F6:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1B940E
	moveq	#-$30,d0
	cmp.w	$16(a4),d0
	bgt.s	loc_1B940E
loc_1B9406:
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_1B940E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9422
	move.w	-$3BA4(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1B942A
loc_1B9422:
	move.w	-$3BA4(a5),d0
	and.w	-$3A2C(a5),d0
loc_1B942A:
	beq.s	loc_1B943A
	move.w	$16(a4),d0
	asr.w	#$4,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$1E(a4)
loc_1B943A:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B944E
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1B9456
loc_1B944E:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_1B9456:
	beq.s	loc_1B9460
	ori.l	#$2,$90(a4)
loc_1B9460:
	clr.w	$6C(a4)
	lea.l	sub_1B92C0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1B9472:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
