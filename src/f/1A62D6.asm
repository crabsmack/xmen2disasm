; ---------------------------------------------------------------------------
; sub_1A62D6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A62D6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_1A632C
	move.l	$BC(a4),-(a7)
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BE2(a5)	; -> sub_1F1424
	tst.b	d0
	lea.l	$C(a7),a7
	beq.s	loc_1A632C
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	$4462(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1A65EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6408
loc_1A632C:
	move.l	$BC(a4),-(a7)
	moveq	#-$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BDA(a5)	; -> sub_1F13D0
	tst.b	d0
	lea.l	$C(a7),a7
	beq.s	loc_1A6370
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	$445A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1A65EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6408
loc_1A6370:
	move.w	#$80,d0
	and.w	$4(a4),d0
	bne.s	loc_1A6380
	tst.w	$18(a4)
	bne.s	loc_1A63B2
loc_1A6380:
	clr.w	$18(a4)
	clr.w	$20(a4)
	ori.w	#$80,$4(a4)
	lea.l	$445A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1A65EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6408
loc_1A63B2:
	tst.l	$44(a4)
	bne.s	loc_1A63F6
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_1A63D2
	lea.l	$4462(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	bra.s	loc_1A63E2
loc_1A63D2:
	lea.l	$445A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1A63E2:
	clr.w	$6C(a4)
	lea.l	sub_1A65EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6408
loc_1A63F6:
	clr.w	$6C(a4)
	lea.l	sub_1A62D6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A6408:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
