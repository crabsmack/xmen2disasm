; ---------------------------------------------------------------------------
; sub_026ED8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_026ED8:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	-$38DE(a5)
	beq.s	loc_026EEE
	moveq	#$10,d0
	bra.s	loc_026EF0
loc_026EEE:
	moveq	#$8,d0
loc_026EF0:
	move.w	d0,d7
	add.w	d7,$8E(a4)
	cmpi.w	#$80,$8E(a4)
	ble.s	loc_026F12
	clr.w	$6C(a4)
	lea.l	sub_026F2E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_026F24
loc_026F12:
	clr.w	$6C(a4)
	lea.l	sub_026ED8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_026F24:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
