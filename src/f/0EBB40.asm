; ---------------------------------------------------------------------------
; sub_0EBB40	[jt 1289]
; ---------------------------------------------------------------------------
sub_0EBB40:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$288A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	-$3BD8(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	lea.l	sub_0EB796(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$81,$6(a4)
	ori.b	#$4,$2E(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$9A(a4)
	clr.w	$90(a4)
	moveq	#$8,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	$92(a4)
	jsr	$4DB2(a5)	; -> sub_1F4900
	move.w	$6(a3),d7
	beq.s	loc_0EBBC4
	move.w	d7,$8C(a4)
	bra.s	loc_0EBBCA
loc_0EBBC4:
	move.w	#$28,$8C(a4)
loc_0EBBCA:
	move.w	$8(a3),d7
	beq.s	loc_0EBBD6
	move.w	d7,$8C(a4)
	bra.s	loc_0EBBDC
loc_0EBBD6:
	move.w	#$B4,$8C(a4)
loc_0EBBDC:
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	move.w	d6,d0
	add.w	#$FFCB,d0
	move.w	d0,$56(a4)
	move.w	d7,d0
	add.w	#$FFDB,d0
	move.w	d0,$54(a4)
	move.w	d6,d0
	add.w	#$FFFB,d0
	move.w	d0,$5A(a4)
	move.w	d7,d0
	add.w	#$FFFC,d0
	move.w	d0,$58(a4)
	move.w	$56(a4),$4E(a4)
	move.w	$54(a4),$4C(a4)
	move.w	$5A(a4),$52(a4)
	move.w	$58(a4),$50(a4)
	move.w	#$2,-$391C(a5)
	move.w	#$4,-$391A(a5)
	move.w	#$6,-$3918(a5)
	move.w	#$8,-$3916(a5)
	move.w	#$A,-$3914(a5)
	move.w	#$C,-$3912(a5)
	move.w	#$AE,-$390E(a5)
	move.w	#$CE,-$390C(a5)
	move.w	#$EE,-$390A(a5)
	move.w	#$2EE,-$3908(a5)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
