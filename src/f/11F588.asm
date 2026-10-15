; ---------------------------------------------------------------------------
; BioBalls_MotionGather - BIOBALLS motion: pull every ball toward the object (+offset) a few pixels per step; clear the motion when all have arrived
; In:  8(a6) = this  $E(a6) = word steps
; Out: d0.b = 1
; Evidence: motion function slot +$A2 called by BioBalls_Move; set by XClone_ActBallsMotionD (jt $33BA)
; ---------------------------------------------------------------------------
BioBalls_MotionGather:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$1,d4
	move.b	#$1,-$1(a6)
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	$9E(a3),d1
	ext.l	d1
	add.l	d0,d1
	subq.w	#$8,d1
	move.w	d1,-$6(a6)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	$A0(a3),d1
	add.w	d0,d1
	move.w	d1,-$4(a6)
	movea.l	$92(a3),a0
	move.w	(a0),-$8(a6)
	andi.w	#$FFFE,$98(a3)
loc_11F5CE:
	movea.l	$92(a3),a4
	addq.w	#$2,a4
	clr.w	d7
	bra.s	loc_11F646
loc_11F5D8:
	tst.w	(a4)
	bge.s	loc_11F5E2
	tst.w	$2(a4)
	blt.s	loc_11F654
loc_11F5E2:
	move.w	-$6(a6),d5
	sub.w	(a4),d5
	move.w	-$4(a6),d6
	sub.w	$2(a4),d6
	tst.w	d5
	bne.s	loc_11F5F8
	tst.w	d6
	beq.s	loc_11F640
loc_11F5F8:
	tst.w	d5
	sge.b	d3
	neg.b	d3
	beq.s	loc_11F606
	ext.l	d5
	move.l	d5,d0
	bra.s	loc_11F60C
loc_11F606:
	ext.l	d5
	move.l	d5,d0
	neg.l	d0
loc_11F60C:
	moveq	#$8,d1
	cmp.l	d0,d1
	bgt.s	loc_11F614
	asr.w	#$3,d5
loc_11F614:
	cmpi.w	#$FFFB,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11F622
	moveq	#-$5,d0
	bra.s	loc_11F624
loc_11F622:
	move.w	d6,d0
loc_11F624:
	move.w	d0,d6
	cmpi.w	#$5,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11F634
	move.w	d6,d0
	bra.s	loc_11F636
loc_11F634:
	moveq	#$5,d0
loc_11F636:
	move.w	d0,d6
	add.w	d5,(a4)
	add.w	d6,$2(a4)
	clr.b	d4
loc_11F640:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
loc_11F646:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$8(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_11F5D8
loc_11F654:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_11F5CE
	tst.b	d4
	beq.s	loc_11F66E
	moveq	#$0,d0
	move.l	d0,$A2(a3)
loc_11F66E:
	move.b	-$1(a6),d0
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
