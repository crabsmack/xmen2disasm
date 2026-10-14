; ---------------------------------------------------------------------------
; sub_0107EA	[jt 37]
; ---------------------------------------------------------------------------
sub_0107EA:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.b	$17(a6),d5
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	move.w	$68(a4),d0
	ext.l	d0
	moveq	#$18,d4
	sub.l	d0,d4
	tst.w	$6A(a4)
	bne.w	loc_0108A4
	pea.l	($D8).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($D8).w
	jsr	$521A(a5)	; -> sub_1FE584
	moveq	#$1C,d0
	muls.w	d4,d0
	move.w	d0,d6
	add.w	#$280,d6
	move.w	d6,$24(a4)
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,$28(a4)
	ext.w	d5
	sub.w	d5,$68(a4)
	cmpi.b	#$D,d7
	addq.w	#$8,a7
	beq.s	loc_010852
	cmpi.b	#$E,d7
	beq.s	loc_010852
	cmpi.b	#$F,d7
	bne.s	loc_010898
loc_010852:
	tst.b	$A9(a4)
	bne.s	loc_010898
	tst.w	$68(a4)
	ble.s	loc_010898
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.s	loc_0108A4
loc_010898:
	move.w	#$28,$6A(a4)
	ori.w	#$40,$6(a4)
loc_0108A4:
	tst.w	$68(a4)
	bgt.s	loc_0108C4
	clr.w	$68(a4)
	move.w	#$7FFF,$6A(a4)
	clr.w	$6C(a4)
	lea.l	sub_010B00(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
loc_0108C4:
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
