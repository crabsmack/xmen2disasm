; ---------------------------------------------------------------------------
; sub_09558E	[jt 717]
; ---------------------------------------------------------------------------
sub_09558E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$1902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.s	loc_095610
	tst.b	$B6(a4)
	ble.s	loc_0955D8
	tst.b	-$38DE(a5)
	beq.s	loc_0955C6
	moveq	#$2,d0
	bra.s	loc_0955C8
loc_0955C6:
	moveq	#$1,d0
loc_0955C8:
	sub.b	d0,$B6(a4)
	tst.b	$B6(a4)
	bgt.s	loc_0955D8
	andi.w	#$FFBF,$6(a4)
loc_0955D8:
	tst.b	$B7(a4)
	ble.s	loc_0955EE
	tst.b	-$38DE(a5)
	beq.s	loc_0955E8
	moveq	#$2,d0
	bra.s	loc_0955EA
loc_0955E8:
	moveq	#$1,d0
loc_0955EA:
	sub.b	d0,$B7(a4)
loc_0955EE:
	tst.b	$B8(a4)
	ble.s	loc_095604
	tst.b	-$38DE(a5)
	beq.s	loc_0955FE
	moveq	#$2,d0
	bra.s	loc_095600
loc_0955FE:
	moveq	#$1,d0
loc_095600:
	sub.b	d0,$B8(a4)
loc_095604:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_095610:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
