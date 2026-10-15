; ---------------------------------------------------------------------------
; sub_13E36E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13E36E:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.b	$17(a6),d7
	movea.l	$8(a6),a4
	move.b	$15(a4),d6
	pea.l	($BE).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$4(a4)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.b	d6,$C(a4)
	tst.b	d7
	beq.s	loc_13E39E
	moveq	#$1,d0
	bra.s	loc_13E3A0
loc_13E39E:
	moveq	#$0,d0
loc_13E3A0:
	ext.w	d0
	or.w	#$8010,d0
	move.w	d0,$4(a4)
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	#$6,$D(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	pea.l	sub_13E4EA(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$8(a4)
	lea.l	$24(a7),a7
	beq.s	loc_13E3E4
	move.l	$8(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_13E3E4:
	moveq	#$0,d0
	move.l	d0,-(a7)
	tst.b	$1B(a6)
	beq.s	loc_13E3F2
	moveq	#$8,d1
	bra.s	loc_13E3F4
loc_13E3F2:
	moveq	#$0,d1
loc_13E3F4:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$F(a6),d0
	move.l	d0,-(a7)
	tst.b	d7
	beq.s	loc_13E406
	moveq	#$4,d0
	bra.s	loc_13E408
loc_13E406:
	moveq	#$0,d0
loc_13E408:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	sub_13E6EE(pc)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$6(a4)
	lea.l	$18(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
