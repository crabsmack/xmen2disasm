; ---------------------------------------------------------------------------
; sub_04C36C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C36C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$2F(a4),d0
	subq.b	#$5,d0
	beq.s	loc_04C382
	subq.b	#$1,d0
	bne.s	loc_04C394
loc_04C382:
	lea.l	$9E2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	loc_04C3AA
loc_04C394:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_04C3AA:
	move.w	#$3E8,$6A(a4)
	move.w	#$14,$6E(a4)
	andi.w	#$FFFE,$8C(a4)
	andi.w	#$FFEF,$8C(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	pea.l	($EB).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EB).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	$68(a4)
	addq.w	#$8,a7
	bgt.s	loc_04C3FC
	move.w	#$14,$6C(a4)
	lea.l	sub_04C240(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_04C42A
loc_04C3FC:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_04C40C
	move.l	#$FFFFF800,d0
	bra.s	loc_04C412
loc_04C40C:
	move.l	#$800,d0
loc_04C412:
	neg.w	d0
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_04C432(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04C42A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
