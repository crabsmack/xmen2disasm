; ---------------------------------------------------------------------------
; sub_066B26
; ---------------------------------------------------------------------------
sub_066B26:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	moveq	#$9,d6
	moveq	#$0,d0
	move.b	-$3B86(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_066B3E
	moveq	#-$1,d6
loc_066B3E:
	cmpi.w	#$FFFF,d6
	beq.s	loc_066B48
	jsr	$5242(a5)	; -> sub_1FE5F2
loc_066B48:
	lea.l	$DD2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$6,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$DC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$DC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$DCA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$DCA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	clr.b	-$38B4(a5)
	clr.w	-$3496(a5)
	clr.w	-$3498(a5)
	jsr	sub_0654F4(pc)
	lea.l	sub_064E9C(pc),a0
	move.l	a0,-$388E(a5)
	clr.b	-$38DE(a5)
	jsr	sub_064EDE(pc)
	move.w	#$2,-$3B34(a5)
	clr.w	-$3B3C(a5)
	move.w	#$1,-$3B44(a5)
	move.w	#$2,-$3B36(a5)
	clr.w	-$3B3E(a5)
	move.w	#$1,-$3B46(a5)
	move.w	#$2,-$3B38(a5)
	clr.w	-$3B40(a5)
	move.w	#$1,-$3B48(a5)
	move.w	#$3,-$3C58(a5)
	move.w	#$5,-$3C56(a5)
	move.w	#$16,-$3C5C(a5)
	move.w	#$22,-$3C5A(a5)
	move.w	-$3C58(a5),-$3B04(a5)
	move.w	-$3C56(a5),-$3B06(a5)
	clr.w	-$359A(a5)
	moveq	#$0,d0
	move.l	d0,-$3A10(a5)
	clr.w	-$3A22(a5)
	clr.w	-$3A24(a5)
	clr.b	-$38C2(a5)
	move.w	-$3598(a5),-$3888(a5)
	jsr	$5042(a5)	; -> sub_1FA956
	jsr	$50FA(a5)	; -> sub_1FDA56
	ori.w	#$40,-$1D48(a5)
	move.w	-$1D48(a5),($C00004).l
	move.w	#$9100,($C00004).l
	move.w	#$929C,($C00004).l
	clr.b	-$3A06(a5)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> sub_1FD998
	moveq	#$0,d0
	move.b	-$3B8E(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	lea.l	$4C(a7),a7
	bne.s	loc_066CA2
	clr.w	-$3C58(a5)
	clr.w	-$3C56(a5)
	move.w	#$1F,-$3C5C(a5)
	move.w	#$27,-$3C5A(a5)
	jsr	sub_065400(pc)
	addq.w	#$2,-$3C58(a5)
	addq.w	#$2,-$3C56(a5)
	subq.w	#$2,-$3C5C(a5)
	subq.w	#$2,-$3C5A(a5)
	moveq	#$A,d6
	bra.s	loc_066CB2
loc_066CA2:
	moveq	#$0,d0
	move.b	-$3B8C(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_066CB2
	jsr	sub_065494(pc)
loc_066CB2:
	tst.w	-$3B0C(a5)
	beq.s	loc_066D24
	bra.s	loc_066CBE
loc_066CBA:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066CBE:
	tst.b	-$3A02(a5)
	bne.s	loc_066CBA
	jsr	sub_065494(pc)
	jsr	sub_065E6C(pc)
	tst.l	-$3B14(a5)
	bne.s	loc_066CD8
	tst.w	-$3B0A(a5)
	beq.s	loc_066D24
loc_066CD8:
	clr.w	d7
	lea.l	-$3960(a5),a4
	moveq	#$30,d3
	bra.s	loc_066CEA
loc_066CE2:
	clr.w	(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$2,a4
loc_066CEA:
	cmp.w	d7,d3
	bgt.s	loc_066CE2
	move.b	#$1,-$3A06(a5)
	move.b	#$1,-$1D4A(a5)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	jsr	sub_065494(pc)
	jsr	sub_065400(pc)
	lea.l	$3E72(a5),a0
	movea.l	$2(a0),a4
	lea.l	-$3960(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_066D16:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_066D16
	jsr	sub_064EDE(pc)
loc_066D24:
	tst.l	-$3B14(a5)
	beq.s	loc_066D90
	cmpi.w	#$FFFF,d6
	beq.s	loc_066D4C
	jsr	$5242(a5)	; -> sub_1FE5F2
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
	bra.s	loc_066D4C
loc_066D48:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066D4C:
	tst.b	-$3A02(a5)
	bne.s	loc_066D48
	move.w	#$A0,-$3902(a5)
	move.w	#$80,-$3904(a5)
	move.w	#$660,-$3906(a5)
	move.w	#$862,-$3908(a5)
	move.w	#$A0,-$390A(a5)
	move.w	#$80,-$390C(a5)
	move.w	#$A,-$390E(a5)
	move.w	#$8,-$3910(a5)
	clr.w	-$391E(a5)
	move.b	#$1,-$3A06(a5)
	jsr	sub_065532(pc)
loc_066D90:
	tst.w	-$3B0A(a5)
	beq.w	loc_066E38
	jsr	$5242(a5)	; -> sub_1FE5F2
	moveq	#$8,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$8,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
	bra.s	loc_066DB4
loc_066DB0:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066DB4:
	tst.b	-$3A02(a5)
	bne.s	loc_066DB0
	jsr	sub_065400(pc)
	move.w	#$A0,-$3902(a5)
	move.w	#$80,-$3904(a5)
	move.w	#$A,-$3906(a5)
	move.w	#$8,-$3908(a5)
	move.w	#$A0,-$390A(a5)
	move.w	#$80,-$390C(a5)
	move.w	#$A,-$390E(a5)
	move.w	#$8,-$3910(a5)
	clr.w	-$391E(a5)
	move.b	#$1,-$3A06(a5)
	moveq	#-$1,d7
	tst.w	g_P1Health(a5)
	beq.s	loc_066E0C
	move.l	g_Player1(a5),-(a7)
	jsr	$42(a5)	; -> sub_0061D0
	move.w	d0,d7
	addq.w	#$4,a7
loc_066E0C:
	moveq	#-$1,d6
	tst.w	g_P2Health(a5)
	beq.s	loc_066E20
	move.l	g_Player2(a5),-(a7)
	jsr	$42(a5)	; -> sub_0061D0
	move.w	d0,d6
	addq.w	#$4,a7
loc_066E20:
	move.b	d7,g_P1CharIndex(a5)
	move.b	d6,g_P2CharIndex(a5)
	clr.w	-$1754(a5)
	clr.w	-$1844(a5)
	jsr	sub_0656B0(pc)
	jsr	$5242(a5)	; -> sub_1FE5F2
loc_066E38:
	clr.b	-$3A06(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_066E60
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> sub_1FD998
	lea.l	$C(a7),a7
	bra.s	loc_066E60
loc_066E5C:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_066E60:
	tst.b	-$3A02(a5)
	bne.s	loc_066E5C
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.w	g_P1Health(a5),-$16F0(a5)
	move.w	g_P2Health(a5),-$17E0(a5)
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
