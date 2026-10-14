; ---------------------------------------------------------------------------
; sub_1FD8D2	[jt 2585]
; ---------------------------------------------------------------------------
sub_1FD8D2:
	link.w	a6,#$FFFC
	move.l	d3,-(a7)
	tst.b	-$3A02(a5)
	beq.w	loc_1FD966
	move.w	-$7C4(a5),d0
	subq.w	#$1,-$7C4(a5)
	tst.w	-$7C4(a5)
	bgt.w	loc_1FD990
	move.w	-$3A04(a5),-$7C4(a5)
	pea.l	-$3A00(a5)
	jsr	$51EA(a5)	; -> sub_1FE316
	tst.b	-$7BA(a5)
	addq.w	#$4,a7
	beq.s	loc_1FD910
	move.w	-$7BC(a5),d0
	addq.w	#$1,-$7BC(a5)
	bra.s	loc_1FD918
loc_1FD910:
	move.w	-$7BC(a5),d0
	subq.w	#$1,-$7BC(a5)
loc_1FD918:
	moveq	#$0,d0
	move.b	-$7BA(a5),d0
	moveq	#$7,d1
	cmp.w	-$7BC(a5),d1
	slt.b	d3
	neg.b	d3
	ext.w	d3
	and.b	d0,d3
	bne.s	loc_1FD94C
	tst.b	-$7BA(a5)
	seq.b	d3
	neg.b	d3
	move.l	d3,-$4(a6)
	tst.w	-$7BC(a5)
	slt.b	d3
	neg.b	d3
	move.l	-$4(a6),d0
	and.b	d0,d3
	tst.b	d3
	beq.s	loc_1FD952
loc_1FD94C:
	clr.b	-$3A02(a5)
	bra.s	loc_1FD990
loc_1FD952:
	move.l	-$7C2(a5),-(a7)
	move.w	-$7BC(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	sub_1FD77E(pc)
	addq.w	#$8,a7
	bra.s	loc_1FD990
loc_1FD966:
	tst.b	-$7C6(a5)
	beq.s	loc_1FD97C
	clr.b	-$7C6(a5)
	pea.l	-$3A00(a5)
	jsr	$51EA(a5)	; -> sub_1FE316
	addq.w	#$4,a7
	bra.s	loc_1FD990
loc_1FD97C:
	tst.b	-$3A06(a5)
	beq.s	loc_1FD990
	clr.b	-$3A06(a5)
	pea.l	-$3980(a5)
	jsr	$51EA(a5)	; -> sub_1FE316
	addq.w	#$4,a7
loc_1FD990:
	move.l	-$8(a6),d3
	unlk	a6
	rts
