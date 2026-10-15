; ---------------------------------------------------------------------------
; sub_1F8FA2	[jt 2537]
; ---------------------------------------------------------------------------
sub_1F8FA2:
	link.w	a6,#$FFFC
	movem.l	d5-d7/a3-a4,-(a7)
	move.w	$12(a6),d5
	move.w	$1A(a6),d7
	movea.l	$C(a6),a4
	jsr	sub_1F8F4C(pc)
	movea.l	d0,a3
	move.l	a3,d0
	beq.w	loc_1F9114
	tst.l	$8(a6)
	beq.s	loc_1F8FCE
	move.l	$8(a6),d0
	bra.s	loc_1F8FD0
loc_1F8FCE:
	moveq	#$0,d0
loc_1F8FD0:
	move.l	d0,$8(a3)
	tst.w	d5
	beq.s	loc_1F8FE0
	move.l	#$400,d0
	bra.s	loc_1F8FE2
loc_1F8FE0:
	moveq	#$0,d0
loc_1F8FE2:
	or.w	#$8000,d0
	tst.w	d7
	beq.s	loc_1F8FEE
	moveq	#$10,d1
	bra.s	loc_1F8FF0
loc_1F8FEE:
	moveq	#$0,d1
loc_1F8FF0:
	ext.w	d1
	or.w	d0,d1
	tst.b	$1F(a6)
	beq.s	loc_1F8FFE
	moveq	#$4,d0
	bra.s	loc_1F9000
loc_1F8FFE:
	moveq	#$0,d0
loc_1F9000:
	ext.w	d0
	or.w	d1,d0
	move.w	d0,$12(a3)
	move.l	a4,d0
	beq.s	loc_1F9046
	move.l	a4,$C(a3)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_1F9022
	ori.w	#$8,$12(a3)
	moveq	#$1,d6
	bra.s	loc_1F905C
loc_1F9022:
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_1F9034
	ori.w	#$8,$12(a3)
	moveq	#$2,d6
	bra.s	loc_1F905C
loc_1F9034:
	tst.w	d7
	beq.s	loc_1F903C
	moveq	#$0,d0
	bra.s	loc_1F903E
loc_1F903C:
	moveq	#$3,d0
loc_1F903E:
	ext.w	d0
	ext.l	d0
	move.l	d0,d6
	bra.s	loc_1F905C
loc_1F9046:
	tst.w	d7
	beq.s	loc_1F904E
	moveq	#$0,d0
	bra.s	loc_1F9050
loc_1F904E:
	moveq	#$3,d0
loc_1F9050:
	ext.w	d0
	ext.l	d0
	move.l	d0,d6
	moveq	#$0,d0
	move.l	d0,$C(a3)
loc_1F905C:
	tst.w	d5
	beq.s	loc_1F9064
	moveq	#$0,d0
	bra.s	loc_1F906A
loc_1F9064:
	move.l	#$400,d0
loc_1F906A:
	ext.l	d0
	moveq	#$0,d1
	move.b	$17(a6),d1
	lsl.l	#$2,d1
	or.l	d0,d1
	moveq	#$3,d0
	and.l	d6,d0
	move.l	d0,d7
	or.l	d1,d7
	move.w	d7,$10(a3)
	movea.l	-$1350(a5),a4
	move.l	a4,d0
	beq.s	loc_1F90F2
	bra.s	loc_1F9092
loc_1F908C:
	move.l	a4,-$4(a6)
	movea.l	(a4),a4
loc_1F9092:
	move.l	a4,d0
	beq.s	loc_1F909C
	cmp.w	$10(a4),d7
	bhi.s	loc_1F908C
loc_1F909C:
	move.l	a4,d0
	bne.s	loc_1F90CE
	movea.l	-$4(a6),a0
	move.l	a0,$4(a3)
	move.l	(a0),(a3)
	movea.l	-$4(a6),a0
	move.l	a3,(a0)
	tst.l	(a3)
	beq.s	loc_1F90BA
	movea.l	(a3),a0
	move.l	a3,$4(a0)
loc_1F90BA:
	move.l	a3,-$1354(a5)
	movea.l	-$4(a6),a0
	tst.l	$4(a0)
	bne.s	loc_1F9102
	move.l	a0,-$1350(a5)
	bra.s	loc_1F9102
loc_1F90CE:
	move.l	a4,(a3)
	move.l	$4(a4),$4(a3)
	move.l	a3,$4(a4)
	tst.l	$4(a3)
	beq.s	loc_1F90E6
	movea.l	$4(a3),a0
	move.l	a3,(a0)
loc_1F90E6:
	tst.l	$4(a3)
	bne.s	loc_1F9102
	move.l	a3,-$1350(a5)
	bra.s	loc_1F9102
loc_1F90F2:
	move.l	a3,-$1354(a5)
	move.l	a3,-$1350(a5)
	moveq	#$0,d0
	move.l	d0,$4(a3)
	move.l	d0,(a3)
loc_1F9102:
	lea.l	-$134C(a5),a0
	move.l	a3,d0
	sub.l	a0,d0
	moveq	#$14,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,d7
	bra.s	loc_1F9116
loc_1F9114:
	moveq	#-$1,d7
loc_1F9116:
	move.w	d7,d0
	movem.l	-$18(a6),d5-d7/a3-a4
	unlk	a6
	rts
