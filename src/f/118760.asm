; ---------------------------------------------------------------------------
; sub_118760	[jt 1473]
; ---------------------------------------------------------------------------
sub_118760:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$E(a6),d6
	moveq	#$0,d0
	movea.l	d0,a4
	move.w	$12(a6),-$1CAE(a5)
	move.l	$8(a6),-$1CB2(a5)
	tst.w	-$1CAE(a5)
	beq.s	loc_118788
	tst.l	-$1CB2(a5)
	bne.s	loc_118798
loc_118788:
	clr.w	-$1CAE(a5)
	clr.w	-$1CB4(a5)
	moveq	#$0,d0
	move.l	d0,-$1CB2(a5)
	bra.s	loc_1187B8
loc_118798:
	move.w	d6,-$1CB4(a5)
	moveq	#$0,d7
	movea.l	-$1CB2(a5),a4
	bra.s	loc_1187AE
loc_1187A4:
	clr.w	$4(a4)
	move.l	d7,d0
	addq.l	#$1,d7
	adda.w	d6,a4
loc_1187AE:
	move.w	-$1CAE(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_1187A4
loc_1187B8:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
