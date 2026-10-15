; ---------------------------------------------------------------------------
; sub_1F0582	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F0582:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F05A2
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_1F05A8
loc_1F05A2:
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
loc_1F05A8:
	movea.l	d0,a3
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	move.l	$8(a3),-$8(a6)
	move.l	$C(a3),-$4(a6)
	moveq	#$0,d4
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F05DE
	moveq	#$0,d0
	bra.w	loc_1F0744
loc_1F05DE:
	move.l	#$3C000,d4
	and.l	$90(a4),d4
	move.l	#$FFFC3FFF,d0
	and.l	$90(a4),d0
	moveq	#$0,d1
	or.l	d0,d1
	move.l	d1,$90(a4)
	move.l	d5,d7
	sub.l	-$8(a6),d7
	tst.l	d7
	bge.s	loc_1F0628
	addi.l	#$11A00,d7
	tst.l	d7
	bge.s	loc_1F064C
	pea.l	($4000).w
	move.l	d5,d0
	sub.l	d7,d0
	move.l	d0,-(a7)
	pea.l	$8(a4)
	move.l	a4,-(a7)
	jsr	sub_1F0542(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F064C
loc_1F0628:
	subi.l	#$11A00,d7
	tst.l	d7
	ble.s	loc_1F064C
	move.l	#$8000,-(a7)
	move.l	d5,d0
	sub.l	d7,d0
	move.l	d0,-(a7)
	pea.l	$8(a4)
	move.l	a4,-(a7)
	jsr	sub_1F0542(pc)
	lea.l	$10(a7),a7
loc_1F064C:
	move.l	d6,d7
	sub.l	-$4(a6),d7
	tst.l	d7
	bge.s	loc_1F0692
	addi.l	#$E000,d7
	tst.l	d7
	bge.w	loc_1F0742
	move.l	#$20000,d0
	and.l	$90(a3),d0
	bne.w	loc_1F0742
	clr.w	$18(a4)
	move.l	#$10000,-(a7)
	move.l	d6,d0
	sub.l	d7,d0
	move.l	d0,-(a7)
	pea.l	$C(a4)
	move.l	a4,-(a7)
	jsr	sub_1F0542(pc)
	lea.l	$10(a7),a7
	bra.w	loc_1F0742
loc_1F0692:
	subi.l	#$E000,d7
	tst.l	d7
	ble.w	loc_1F0742
	move.w	#$1000,d0
	and.w	$4(a3),d0
	beq.s	loc_1F06B6
	move.l	a3,-(a7)
	jsr	sub_1F429E(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.w	loc_1F0742
loc_1F06B6:
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F06CA
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	addq.w	#$4,a7
loc_1F06CA:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F0728
	move.l	a4,-(a7)
	jsr	sub_1F429E(pc)
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_1F0728
	ori.l	#$20000,$90(a4)
	move.l	#$20000,d0
	and.l	d4,d0
	bne.s	loc_1F0742
	tst.w	$68(a4)
	ble.s	loc_1F0742
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	clr.w	$6C(a4)
	move.w	#$3C,$6A(a4)
	ori.w	#$80,$6(a4)
	movea.l	g_Camera(a5),a0
	ori.w	#$2,$4A(a0)
	lea.l	sub_1F0998(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$1,d0
	bra.s	loc_1F0744
loc_1F0728:
	move.l	#$20000,-(a7)
	move.l	d6,d0
	sub.l	d7,d0
	move.l	d0,-(a7)
	pea.l	$C(a4)
	move.l	a4,-(a7)
	jsr	sub_1F0542(pc)
	lea.l	$10(a7),a7
loc_1F0742:
	moveq	#$0,d0
loc_1F0744:
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
