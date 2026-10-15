; ---------------------------------------------------------------------------
; sub_0FD24C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FD24C:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$A(a6),d6
	move.w	$E(a6),d0
	ext.l	d0
	movea.l	-$3A76(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d4
	and.w	(a0,d0.l),d4
	moveq	#$1,d5
	cmpi.w	#$6E,d4
	bne.s	loc_0FD28C
	move.w	#$6F,-$2(a6)
	bra.s	loc_0FD2A8
loc_0FD28C:
	cmpi.w	#$6F,d4
	bne.s	loc_0FD29A
	move.w	#$70,-$2(a6)
	bra.s	loc_0FD2A8
loc_0FD29A:
	cmpi.w	#$70,d4
	bne.w	loc_0FD500
	clr.w	-$2(a6)
	clr.b	d5
loc_0FD2A8:
	tst.b	d5
	bne.s	loc_0FD2F2
	pea.l	($3E8).w
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	$3EFA(a5)	; -> sub_15A8FE
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_0FD2F2
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_0FD2EA
	move.w	$A(a3),d0
	bra.s	loc_0FD2EE
loc_0FD2EA:
	move.w	$E(a3),d0
loc_0FD2EE:
	move.w	d0,-$3B0C(a5)
loc_0FD2F2:
	move.w	$E(a6),d7
	subq.w	#$1,d7
	bra.w	loc_0FD37E
loc_0FD2FC:
	tst.b	d5
	bne.s	loc_0FD35C
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	sub_0FD0E0(pc)
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	andi.w	#$7FFF,(a0,d0.l)
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	andi.w	#$C7FF,(a0,d0.l)
	addq.w	#$8,a7
loc_0FD35C:
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FEA(a5)	; -> sub_15D8CC
	lea.l	$10(a7),a7
	move.w	d7,d0
	subq.w	#$1,d7
loc_0FD37E:
	ext.l	d4
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d1
	and.w	(a0,d0.l),d1
	moveq	#$0,d0
	move.w	d1,d0
	cmp.l	d4,d0
	beq.w	loc_0FD2FC
	move.w	$E(a6),d7
	bra.w	loc_0FD436
loc_0FD3B4:
	tst.b	d5
	bne.s	loc_0FD414
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	sub_0FD0E0(pc)
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	andi.w	#$7FFF,(a0,d0.l)
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	andi.w	#$C7FF,(a0,d0.l)
	addq.w	#$8,a7
loc_0FD414:
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FEA(a5)	; -> sub_15D8CC
	lea.l	$10(a7),a7
	move.w	d7,d0
	addq.w	#$1,d7
loc_0FD436:
	ext.l	d4
	ext.l	d7
	movea.l	-$3A76(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d1
	and.w	(a0,d0.l),d1
	moveq	#$0,d0
	move.w	d1,d0
	cmp.l	d4,d0
	beq.w	loc_0FD3B4
	tst.b	d5
	bne.w	loc_0FD4EC
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_0FD4D8
	moveq	#$0,d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	bra.s	loc_0FD4C6
loc_0FD492:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0FD4B8
	cmpa.l	$76(a4),a3
	bne.s	loc_0FD4B8
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	addq.w	#$4,a7
loc_0FD4B8:
	addq.l	#$1,d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_0FD4C6:
	move.w	-$13F2(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_0FD492
	move.l	a3,-(a7)
	jsr	$4F22(a5)	; -> sub_1F7CFE
	addq.w	#$4,a7
loc_0FD4D8:
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	bra.s	loc_0FD4FE
loc_0FD4EC:
	moveq	#$33,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$33,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_0FD4FE:
	moveq	#$0,d0
loc_0FD500:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
