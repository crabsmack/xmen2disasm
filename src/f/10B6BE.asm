; ---------------------------------------------------------------------------
; sub_10B6BE	[jt 1360]
; ---------------------------------------------------------------------------
sub_10B6BE:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.w	$E(a6),d6
	move.w	$A(a6),d7
	movea.l	$10(a6),a4
	moveq	#$0,d0
	movea.l	d0,a3
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	beq.s	loc_10B6E6
	lea.l	g_Player2(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_10B6E8
loc_10B6E6:
	movea.l	a4,a3
loc_10B6E8:
	movea.l	-$3BC4(a5),a0
	tst.b	$10(a0)
	beq.s	loc_10B706
	move.l	a4,d0
	beq.s	loc_10B702
	lea.l	$2B1A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_10B706
loc_10B702:
	moveq	#$0,d0
	bra.s	loc_10B762
loc_10B706:
	movea.l	-$3BC4(a5),a0
	tst.w	$12(a0)
	bne.s	loc_10B760
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	eori.w	#$200,(a4)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	movea.l	-$3BC4(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$14(a7),a7
loc_10B760:
	moveq	#$0,d0
loc_10B762:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
