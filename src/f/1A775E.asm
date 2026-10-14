; ---------------------------------------------------------------------------
; sub_1A775E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A775E:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	move.l	d0,d7
	sub.l	d1,d7
	move.w	#$3C,$6A(a4)
	move.l	-$35B6(a5),-(a7)
	jsr	$3EA2(a5)	; -> sub_159ECC
	tst.b	-$38DE(a5)
	beq.s	loc_1A7792
	moveq	#$4,d0
	bra.s	loc_1A7794
loc_1A7792:
	moveq	#$2,d0
loc_1A7794:
	ext.w	d0
	sub.w	d0,$C4(a4)
	moveq	#$0,d0
	move.b	$7B(a4),d0
	cmpi.w	#$FF,d0
	addq.w	#$4,a7
	bne.s	loc_1A77CA
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1A77B6
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1A77BC
loc_1A77B6:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1A77BC:
	cmpi.l	#$AF,d0
	bgt.s	loc_1A77CA
	tst.w	$C4(a4)
	bgt.s	loc_1A77E6
loc_1A77CA:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	sub_1A78BC(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1A78BC(pc)
	addq.w	#$4,a7
loc_1A77E6:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
