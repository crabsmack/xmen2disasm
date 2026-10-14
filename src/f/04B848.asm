; ---------------------------------------------------------------------------
; sub_04B848	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04B848:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	-$3B08(a5)
	bne.w	loc_04B98E
	moveq	#$3,d0
	cmp.w	-$3B0C(a5),d0
	bne.s	loc_04B8AC
	lea.l	$A02(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$A4(a4)
	addq.w	#$8,a7
	bne.s	loc_04B88A
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_04B98E
loc_04B88A:
	clr.w	$A2(a4)
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_04B98E
loc_04B8AC:
	moveq	#$7,d0
	cmp.w	-$3B0C(a5),d0
	bne.s	loc_04B8FE
	lea.l	$A0A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$A4(a4)
	addq.w	#$8,a7
	bne.s	loc_04B8DC
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_04B98E
loc_04B8DC:
	clr.w	$A2(a4)
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.w	loc_04B98E
loc_04B8FE:
	moveq	#$C,d0
	cmp.w	-$3B0C(a5),d0
	bne.s	loc_04B94C
	lea.l	$A12(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$A4(a4)
	addq.w	#$8,a7
	bne.s	loc_04B92C
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_04B98E
loc_04B92C:
	clr.w	$A2(a4)
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_04B98E
loc_04B94C:
	tst.l	$A4(a4)
	bne.s	loc_04B960
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_04B98E
loc_04B960:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04B974
	clr.w	$A2(a4)
loc_04B974:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_04B98E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
