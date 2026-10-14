; ---------------------------------------------------------------------------
; sub_15D988	[jt 2047]
; ---------------------------------------------------------------------------
sub_15D988:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$A(a6),d7
	addq.w	#$2,d7
	pea.l	$15DA36(pc)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$2,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$34A6(a5)
	pea.l	$15DA34(pc)
	move.w	#$C2,d0
	muls.w	d7,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$13F6(a5)
	move.w	d7,-$13F2(a5)
	lea.l	-$1758(a5),a0
	movea.l	-$34A6(a5),a1
	move.l	a0,(a1)
	lea.l	-$1848(a5),a0
	movea.l	-$34A6(a5),a1
	move.l	a0,$4(a1)
	movea.l	-$13F6(a5),a3
	moveq	#$2,d7
	lea.l	$10(a7),a7
	bra.s	loc_15D9FA
loc_15D9E4:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	a3,(a0,d0.l)
	move.w	d7,d0
	addq.w	#$1,d7
	adda.w	#$C2,a3
loc_15D9FA:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_15D9E4
	moveq	#$2,d7
	movea.l	-$34A6(a5),a0
	movea.l	$8(a0),a4
	bra.s	loc_15DA24
loc_15DA0C:
	clr.w	$4(a4)
	move.b	d7,$15(a4)
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_15DA24:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_15DA0C
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
