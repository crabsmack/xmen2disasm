; ---------------------------------------------------------------------------
; sub_094A88	[jt 694]
; ---------------------------------------------------------------------------
sub_094A88:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> sub_1F4900
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	move.w	#$6,-$A(a6)
	lea.l	$19EA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$10(a6)
	jsr	$15FA(a5)	; -> sub_094C90
	tst.l	$8E(a4)
	lea.l	$14(a7),a7
	bne.s	loc_094AE2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_094B0E
loc_094AE2:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_094AF6
	clr.w	$8C(a4)
loc_094AF6:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_094B0E:
	movea.l	-$14(a6),a4
	unlk	a6
	rts
