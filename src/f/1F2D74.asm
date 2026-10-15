; ---------------------------------------------------------------------------
; sub_1F2D74	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F2D74:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F2DB2
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
	addq.w	#$8,a7
loc_1F2DB2:
	clr.w	$6E(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F2DCC
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_1F2DDA
loc_1F2DCC:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_1F2DDA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2DEE
	move.w	-$3B98(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2DF6
loc_1F2DEE:
	move.w	-$3B98(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2DF6:
	beq.s	loc_1F2E00
	ori.b	#$10,$2E(a4)
	bra.s	loc_1F2E24
loc_1F2E00:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2E14
	move.w	-$3B9A(a5),d0
	and.w	-$3A36(a5),d0
	bra.s	loc_1F2E1C
loc_1F2E14:
	move.w	-$3B9A(a5),d0
	and.w	-$3A38(a5),d0
loc_1F2E1C:
	beq.s	loc_1F2E24
	andi.b	#$EF,$2E(a4)
loc_1F2E24:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$38(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1F2B8E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
