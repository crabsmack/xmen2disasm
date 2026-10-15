; ---------------------------------------------------------------------------
; sub_05A940	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05A940:
	link.w	a6,#$FFFA
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$A(a6),d6
	move.w	$E(a6),d5
	ext.l	d5
	movea.l	-$3A72(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d7
	and.w	(a0,d0.l),d7
	move.w	#$7D00,-$2(a6)
	cmpi.w	#$8,d7
	bne.s	loc_05A982
	moveq	#$9,d4
	bra.s	loc_05A99C
loc_05A982:
	cmpi.w	#$9,d7
	bne.s	loc_05A98C
	moveq	#$A,d4
	bra.s	loc_05A99C
loc_05A98C:
	cmpi.w	#$A,d7
	bne.s	loc_05A996
	moveq	#$B,d4
	bra.s	loc_05A99C
loc_05A996:
	moveq	#$0,d0
	bra.w	loc_05AB4E
loc_05A99C:
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	bne.s	loc_05A9D2
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$13,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.w	loc_05AB4C
loc_05A9D2:
	move.w	$8(a3),d0
	ext.l	d0
	addq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$6(a6)
	move.w	$C(a3),d0
	ext.l	d0
	subq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$4(a6)
	cmpi.w	#$B,d4
	bne.s	loc_05AA3E
	pea.l	($3E8).w
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	moveq	#$20,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	moveq	#$10,d2
	add.l	d2,d0
	move.l	d0,-(a7)
	jsr	$3EFA(a5)	; -> sub_15A8FE
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$C(a7),a7
	beq.s	loc_05AA3E
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_05AA32
	move.w	$A(a4),d0
	bra.s	loc_05AA36
loc_05AA32:
	move.w	$E(a4),d0
loc_05AA36:
	sub.w	-$3490(a5),d0
	move.w	d0,-$2(a6)
loc_05AA3E:
	move.w	-$6(a6),d0
	ext.l	d0
	move.l	d0,d6
	bra.w	loc_05AB40
loc_05AA4A:
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	cmpi.w	#$B,d4
	lea.l	$10(a7),a7
	bne.w	loc_05AB3C
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$67,d1
	move.l	d1,-(a7)
	ext.l	d5
	move.l	d5,d2
	addq.l	#$1,d2
	move.l	d2,-(a7)
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	ext.l	d5
	movea.l	-$3A72(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	andi.w	#$C7FF,(a0,d0.l)
	moveq	#$0,d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	lea.l	$10(a7),a7
	bra.s	loc_05AAF8
loc_05AAAA:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05AAEA
	cmpa.l	$76(a4),a3
	bne.s	loc_05AAD0
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	addq.w	#$4,a7
loc_05AAD0:
	move.l	a4,-(a7)
	jsr	$4D6A(a5)	; -> sub_1F41C2
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_05AAEA
	cmpa.l	$BC(a4),a3
	bne.s	loc_05AAEA
	move.l	a4,-(a7)
	jsr	sub_05A938(pc)
	addq.w	#$4,a7
loc_05AAEA:
	addq.l	#$1,d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_05AAF8:
	move.w	-$13F2(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_05AAAA
	move.l	a3,-(a7)
	jsr	$4F22(a5)	; -> sub_1F7CFE
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.l	d6,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	$CCA(a5)	; -> sub_05B322
	pea.l	($E3).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E3).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$18(a7),a7
loc_05AB3C:
	move.l	d6,d0
	addq.l	#$1,d6
loc_05AB40:
	move.w	-$4(a6),d0
	ext.l	d0
	cmp.l	d6,d0
	bge.w	loc_05AA4A
loc_05AB4C:
	moveq	#$0,d0
loc_05AB4E:
	movem.l	-$22(a6),d3-d7/a3-a4
	unlk	a6
	rts
