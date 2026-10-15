; ---------------------------------------------------------------------------
; sub_13DE5E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13DE5E:
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
	beq.s	loc_13DE8E
	moveq	#$1,d0
	bra.s	loc_13DE90
loc_13DE8E:
	moveq	#$0,d0
loc_13DE90:
	ext.w	d0
	or.w	#$8010,d0
	move.w	d0,$4(a4)
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	move.b	#$6,$D(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	pea.l	sub_13DF74(pc)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	move.l	d0,$8(a4)
	lea.l	$24(a7),a7
	beq.s	loc_13DED4
	move.l	$8(a4),-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	addq.w	#$4,a7
loc_13DED4:
	moveq	#$0,d0
	move.l	d0,-(a7)
	tst.b	$1B(a6)
	beq.s	loc_13DEE2
	moveq	#$8,d1
	bra.s	loc_13DEE4
loc_13DEE2:
	moveq	#$0,d1
loc_13DEE4:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$F(a6),d0
	move.l	d0,-(a7)
	tst.b	d7
	beq.s	loc_13DEF6
	moveq	#$4,d0
	bra.s	loc_13DEF8
loc_13DEF6:
	moveq	#$0,d0
loc_13DEF8:
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	sub_13E14A(pc)
	jsr	$4F6A(a5)	; -> sub_1F8FA2
	move.w	d0,$6(a4)
	lea.l	$18(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
