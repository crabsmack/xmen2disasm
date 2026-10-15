; ---------------------------------------------------------------------------
; sub_1E2B48	[jt 2387]
; ---------------------------------------------------------------------------
sub_1E2B48:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	movea.l	a0,a1
	adda.w	$30(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
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
	beq.s	loc_1E2BA0
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1E2BA8
loc_1E2BA0:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1E2BA8:
	lea.l	$10(a7),a7
	beq.s	loc_1E2BCA
	ori.b	#$10,$2E(a4)
	move.w	#$514,$22(a4)
	move.w	#$FAEC,$16(a4)
	clr.w	$18(a4)
	clr.w	$1E(a4)
	bra.s	loc_1E2C02
loc_1E2BCA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E2BDE
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1E2BE6
loc_1E2BDE:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1E2BE6:
	beq.s	loc_1E2C02
	andi.b	#$EF,$2E(a4)
	move.w	#$514,$22(a4)
	move.w	#$514,$16(a4)
	clr.w	$18(a4)
	clr.w	$1E(a4)
loc_1E2C02:
	lea.l	$4C9A(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
