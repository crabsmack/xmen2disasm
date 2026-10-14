; ---------------------------------------------------------------------------
; sub_112664	[link-after-rts]
; ---------------------------------------------------------------------------
sub_112664:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,-$3A06(a5)
	tst.l	$44(a4)
	bne.s	loc_11268A
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_11268A:
	subq.w	#$1,-$3B06(a5)
	tst.w	-$3B06(a5)
	bge.s	loc_112700
	move.w	#$2,-$393C(a5)
	move.w	#$22,-$393A(a5)
	move.w	#$24,-$3938(a5)
	clr.w	-$393E(a5)
	tst.w	$68(a4)
	bgt.s	loc_1126C6
	clr.w	$6C(a4)
	lea.l	sub_112754(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_11274C
loc_1126C6:
	andi.w	#$FFFD,$6(a4)
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$84(a4)
	pea.l	-$1656(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,$80(a4)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_112C9E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_11274C
loc_112700:
	cmpi.w	#$462,-$393C(a5)
	bne.s	loc_112720
	move.w	#$2,-$393C(a5)
	move.w	#$22,-$393A(a5)
	move.w	#$24,-$3938(a5)
	clr.w	-$393E(a5)
	bra.s	loc_112738
loc_112720:
	move.w	#$462,-$393C(a5)
	move.w	#$484,-$393A(a5)
	move.w	#$886,-$3938(a5)
	move.w	#$CCC,-$393E(a5)
loc_112738:
	move.w	#$2,$6C(a4)
	lea.l	sub_112664(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11274C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
