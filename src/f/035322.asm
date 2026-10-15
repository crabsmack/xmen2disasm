; ---------------------------------------------------------------------------
; sub_035322	[link-after-rts]
; ---------------------------------------------------------------------------
sub_035322:
	link.w	a6,#$FFF4
	movem.l	d3-d7/a4,-(a7)
	move.w	$A(a6),d4
	movea.l	$10(a6),a0
	move.l	(a0),d0
	cmp.l	$3E6C(a5),d0
	beq.s	loc_035340
	moveq	#$0,d0
	bra.w	loc_03559C
loc_035340:
	clr.b	-$1(a6)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,d5
	moveq	#$0,d6
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#$3,d3
	bra.s	loc_035394
loc_03535A:
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$3800,d1
	and.w	(a0,d0.l),d1
	moveq	#$B,d0
	lsr.w	d0,d1
	move.w	d1,-$4(a6)
	moveq	#$3,d0
	cmp.w	-$4(a6),d0
	bne.s	loc_035398
	move.l	d7,d5
	move.l	d6,d0
	addq.l	#$1,d6
	move.l	d7,d0
	subq.l	#$1,d7
loc_035394:
	cmp.l	d6,d3
	bgt.s	loc_03535A
loc_035398:
	moveq	#$0,d6
	move.l	d5,d7
	bra.w	loc_035554
loc_0353A0:
	movea.l	-$3A72(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d1
	and.w	(a0,d0.l),d1
	move.w	d1,-$C(a6)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$A(a6)
	move.l	d7,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$6(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	-$6(a6),-(a7)
	move.l	-$A(a6),-(a7)
	jsr	$2DD2(a5)	; -> Explosion_SpawnSetTimerWord
	cmpi.w	#$8C,-$C(a6)
	lea.l	$10(a7),a7
	bne.s	loc_035418
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($A9).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_03554C
loc_035418:
	cmpi.w	#$A9,-$C(a6)
	bne.s	loc_03543A
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($AA).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_03554C
loc_03543A:
	cmpi.w	#$AA,-$C(a6)
	bne.s	loc_03545C
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($AB).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_03554C
loc_03545C:
	cmpi.w	#$AB,-$C(a6)
	bne.s	loc_03547E
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($AC).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_03554C
loc_03547E:
	cmpi.w	#$AC,-$C(a6)
	bne.s	loc_0354A6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$11,d1
	move.l	d1,-(a7)
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	move.b	#$1,-$1(a6)
	lea.l	$10(a7),a7
	bra.w	loc_03554C
loc_0354A6:
	cmpi.w	#$9F,-$C(a6)
	bne.s	loc_0354C8
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($A3).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_03554C
loc_0354C8:
	cmpi.w	#$A3,-$C(a6)
	bne.s	loc_0354E8
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($A4).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.s	loc_03554C
loc_0354E8:
	cmpi.w	#$A4,-$C(a6)
	bne.s	loc_035508
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($A5).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.s	loc_03554C
loc_035508:
	cmpi.w	#$A5,-$C(a6)
	bne.s	loc_035528
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($A6).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.s	loc_03554C
loc_035528:
	cmpi.w	#$A6,-$C(a6)
	bne.s	loc_03554C
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($A7).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	move.b	#$1,-$1(a6)
	lea.l	$10(a7),a7
loc_03554C:
	move.l	d6,d0
	addq.l	#$1,d6
	move.l	d7,d0
	addq.l	#$1,d7
loc_035554:
	moveq	#$3,d0
	cmp.l	d6,d0
	bgt.w	loc_0353A0
	tst.b	-$1(a6)
	beq.s	loc_035588
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$C(a7),a7
	beq.s	loc_035588
	move.l	a4,-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	addq.w	#$4,a7
loc_035588:
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	moveq	#$0,d0
loc_03559C:
	movem.l	-$24(a6),d3-d7/a4
	unlk	a6
	rts
