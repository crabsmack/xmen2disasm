; ---------------------------------------------------------------------------
; sub_1969C2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1969C2:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$BC(a4),a3
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1969E6
	move.w	-$3BA4(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_1969EE
loc_1969E6:
	move.w	-$3BA4(a5),d0
	and.w	-$3A30(a5),d0
loc_1969EE:
	beq.w	loc_196ACE
	moveq	#$0,d0
	move.l	d0,$44(a4)
	move.b	#$1,-$3892(a5)
	moveq	#$31,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	moveq	#$10,d0
	and.b	$2E(a4),d0
	lea.l	$C(a7),a7
	beq.s	loc_196A3C
	move.w	$C(a3),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	add.l	d0,d1
	move.w	$4E(a4),d0
	ext.l	d0
	sub.l	d0,d1
	lsl.l	#$8,d1
	move.l	d1,$8(a4)
	bra.s	loc_196A58
loc_196A3C:
	move.w	$8(a3),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	add.l	d0,d1
	move.w	$52(a4),d0
	ext.l	d0
	sub.l	d0,d1
	lsl.l	#$8,d1
	move.l	d1,$8(a4)
loc_196A58:
	eori.b	#$10,$2E(a4)
	move.l	#$10000,d0
	and.l	$90(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_196A76
	move.l	#$FFFFF7CC,d0
	bra.s	loc_196A78
loc_196A76:
	moveq	#$0,d0
loc_196A78:
	move.w	d0,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$E(a0),$20(a4)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	andi.w	#$DFFF,$6(a4)
	andi.l	#$FFF7FFFF,$90(a4)
	andi.l	#$FFEFFFFF,$90(a4)
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_196C78
loc_196ACE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_196AE2
	move.w	-$3B9E(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_196AEA
loc_196AE2:
	move.w	-$3B9E(a5),d0
	and.w	-$3A30(a5),d0
loc_196AEA:
	beq.s	loc_196B4E
	move.l	a3,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BDA(a5)	; -> sub_1F13D0
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_196B4E
	tst.b	$C2(a4)
	bne.s	loc_196B1E
	move.b	#$1,$C2(a4)
	lea.l	$435A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	bra.s	loc_196B32
loc_196B1E:
	clr.b	$C2(a4)
	lea.l	$4362(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_196B32:
	move.w	#$FDDA,$18(a4)
	clr.w	$6C(a4)
	lea.l	sub_19673A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_196C78
loc_196B4E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_196B62
	move.w	-$3BA0(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_196B6A
loc_196B62:
	move.w	-$3BA0(a5),d0
	and.w	-$3A30(a5),d0
loc_196B6A:
	beq.s	loc_196BCE
	move.l	a3,-(a7)
	moveq	#$28,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BE2(a5)	; -> sub_1F1424
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_196BCE
	tst.b	$C2(a4)
	bne.s	loc_196B9E
	move.b	#$1,$C2(a4)
	lea.l	$436A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	bra.s	loc_196BB2
loc_196B9E:
	clr.b	$C2(a4)
	lea.l	$4372(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_196BB2:
	move.w	#$2DA,$18(a4)
	clr.w	$6C(a4)
	lea.l	sub_19673A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_196C78
loc_196BCE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_196BE2
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_196BEA
loc_196BE2:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_196BEA:
	beq.s	loc_196C5E
	tst.b	$9D(a4)
	bne.s	loc_196C02
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_196C10
loc_196C02:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_196C10:
	movea.l	$8C(a4),a0
	move.b	$4(a0),$70(a4)
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$43B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1969C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_196C78
loc_196C5E:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1969C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_196C78:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
