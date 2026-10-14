; ---------------------------------------------------------------------------
; sub_118166	[jt 1462]
; ---------------------------------------------------------------------------
sub_118166:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.b	$13(a6),d1
	move.l	d1,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	sub_118074(pc)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_1181A2
	tst.l	$6(a4)
	beq.s	loc_11819E
	movea.l	$6(a4),a0
	move.w	$16(a6),(a0)
	bra.s	loc_1181A4
loc_11819E:
	moveq	#$0,d0
	bra.s	loc_1181A4
loc_1181A2:
	moveq	#$0,d0
loc_1181A4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
