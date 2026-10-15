; ---------------------------------------------------------------------------
; sub_085696	[link-after-rts]
; ---------------------------------------------------------------------------
sub_085696:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8E(a3),a4
	move.w	$2(a4),-$A(a6)
	move.w	$4(a4),-$8(a6)
	move.w	$8(a4),d5
	move.w	$A(a4),d6
	tst.w	$E(a4)
	beq.s	loc_0856C4
	moveq	#$1,d0
	bra.s	loc_0856C6
loc_0856C4:
	moveq	#$0,d0
loc_0856C6:
	move.b	d0,-$6(a6)
	clr.b	-$5(a6)
	move.w	-$A(a6),d0
	ext.l	d0
	ext.l	d5
	add.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	move.w	-$8(a6),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	move.l	d0,d4
	lsl.l	#$8,d4
	moveq	#$0,d7
loc_0856EE:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0856FE
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_085704
loc_0856FE:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_085704:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_08575E
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	move.l	-$4(a6),$8(a4)
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	addq.w	#$4,a7
	bne.s	loc_085748
	move.l	#$1000,d6
	tst.w	d5
	bge.s	loc_085744
	move.l	d6,d0
	neg.l	d0
	move.l	d0,d6
loc_085744:
	add.l	d6,$8(a4)
loc_085748:
	move.l	d4,$C(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$3C,$6A(a4)
loc_08575E:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.s	loc_0856EE
	jsr	$1182(a5)	; -> CloneA2_SetCameraLimitsToMap
	moveq	#$0,d0
	move.b	-$5(a6),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$6(a6),d0
	move.l	d0,-(a7)
	pea.l	($3E8).w
	pea.l	($3E8).w
	move.w	-$8(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	move.w	#$1,-$3B04(a5)
	lea.l	$853FA(pc),a0
	move.l	a0,-$38FC(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4E9A(a5)	; -> sub_1F68CE
	move.w	#$1E,$6E(a3)
	lea.l	$20(a7),a7
	clr.w	$6C(a3)
	lea.l	sub_0857DC(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
