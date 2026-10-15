; ---------------------------------------------------------------------------
; sub_1979A4	[jt 2173]
; ---------------------------------------------------------------------------
sub_1979A4:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1979E2
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1979EA
loc_1979E2:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1979EA:
	addq.w	#$8,a7
	beq.s	loc_1979F6
	andi.b	#$EF,$2E(a4)
	bra.s	loc_197A1A
loc_1979F6:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_197A0A
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_197A12
loc_197A0A:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_197A12:
	beq.s	loc_197A1A
	ori.b	#$10,$2E(a4)
loc_197A1A:
	move.w	#$14,$A6(a4)
	clr.w	$6C(a4)
	lea.l	sub_19777E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
