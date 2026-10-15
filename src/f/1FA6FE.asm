; ---------------------------------------------------------------------------
; sub_1FA6FE	[jt 2556]
; ---------------------------------------------------------------------------
sub_1FA6FE:
	link.w	a6,#$0
	clr.w	-$359A(a5)
	moveq	#$0,d0
	move.l	d0,-$3A10(a5)
	clr.w	-$3A22(a5)
	clr.w	-$3A24(a5)
	clr.b	-$38C2(a5)
	move.w	-$3598(a5),-$3888(a5)
	tst.l	-$35B6(a5)
	bne.s	loc_1FA744
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,-$35B6(a5)
	addq.w	#$8,a7
loc_1FA744:
	jsr	$5042(a5)	; -> sub_1FA956
	jsr	$50FA(a5)	; -> sub_1FDA56
	ori.w	#$40,-$1D48(a5)
	move.w	-$1D48(a5),($C00004).l
	tst.b	-$38B4(a5)
	beq.s	loc_1FA764
	jsr	$62(a5)	; -> sub_006584
loc_1FA764:
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
	clr.b	-$38C6(a5)
	move.b	#$1,-$38BE(a5)
	jsr	sub_1FA7E8(pc)
	jsr	sub_1FA124(pc)
	jsr	sub_1FA878(pc)
	clr.b	-$38BE(a5)
	clr.b	-$3A1A(a5)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> sub_1FD998
	lea.l	$18(a7),a7
	bra.s	loc_1FA7C8
loc_1FA7C4:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_1FA7C8:
	tst.b	-$3A02(a5)
	bne.s	loc_1FA7C4
	tst.l	-$3A44(a5)
	beq.s	loc_1FA7DE
	move.w	-$204(a5),d0
	move.w	d0,($C00004).l
loc_1FA7DE:
	moveq	#$0,d0
	move.l	d0,-$3A18(a5)
	unlk	a6
	rts
