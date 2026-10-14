; ---------------------------------------------------------------------------
; sub_0B6DD4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B6DD4:
	link.w	a6,#$FFFC
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	andi.w	#$FFFD,$6(a4)
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$84(a4)
	andi.w	#$FFFE,$6(a4)
	pea.l	-$1656(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$80(a4)
	lea.l	$2F7A(a5),a0
	move.l	$2(a0),d0
	addq.l	#$4,d0
	move.l	d0,-$4(a6)
	lea.l	-$3920(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$18(a7),a7
loc_0B6E48:
	movea.l	-$4(a6),a0
	addq.l	#$2,-$4(a6)
	move.w	(a0),(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_0B6E48
	tst.l	$A0(a4)
	bne.s	loc_0B6E6E
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0B6E9C
loc_0B6E6E:
	addq.w	#$1,$9E(a4)
	movea.l	$A0(a4),a0
	move.w	$9E(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B6E82
	clr.w	$9E(a4)
loc_0B6E82:
	movea.l	$A0(a4),a0
	addq.l	#$2,a0
	move.w	$9E(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0B6E9C:
	movem.l	-$14(a6),d3/d7/a3-a4
	unlk	a6
	rts
