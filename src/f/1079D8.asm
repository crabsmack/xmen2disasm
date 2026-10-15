; ---------------------------------------------------------------------------
; sub_1079D8	[jt 1348]
; ---------------------------------------------------------------------------
sub_1079D8:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	-$3BCE(a5),a4
	tst.b	-$3BCA(a5)
	beq.s	loc_1079EE
	moveq	#$0,d0
	bra.s	loc_107A34
loc_1079EE:
	move.b	#$1,-$3BCA(a5)
	move.w	$A(a6),$8(a4)
	move.w	$E(a6),$A(a4)
	move.l	-$38D6(a5),(a4)
	move.w	-$38D8(a5),d0
	ext.l	d0
	movea.l	-$38D6(a5),a0
	asl.l	#$4,d0
	adda.l	d0,a0
	move.l	a0,$4(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	pea.l	sub_107860(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a3
	move.l	a3,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	moveq	#$0,d0
	lea.l	$14(a7),a7
loc_107A34:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
