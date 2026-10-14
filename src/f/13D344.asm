; ---------------------------------------------------------------------------
; sub_13D344	[jt 1859]
; ---------------------------------------------------------------------------
sub_13D344:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	tst.w	$A2(a4)
	ble.s	loc_13D360
	subq.w	#$1,$A2(a4)
loc_13D360:
	ext.l	d7
	move.w	$9C(a4),d0
	ext.l	d0
	moveq	#$32,d1
	add.l	d1,d0
	cmp.l	d7,d0
	blt.s	loc_13D378
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_13D390
loc_13D378:
	ext.l	d7
	move.w	$9E(a4),d0
	ext.l	d0
	moveq	#$32,d1
	sub.l	d1,d0
	cmp.l	d7,d0
	bgt.s	loc_13D3D0
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_13D3D0
loc_13D390:
	tst.l	$98(a4)
	bne.s	loc_13D3A2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D41A
loc_13D3A2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D3B6
	clr.w	$96(a4)
loc_13D3B6:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D41A
loc_13D3D0:
	lea.l	$3A8A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_13D3EE
	move.l	#$FFFFFB2C,d0
	bra.s	loc_13D3F4
loc_13D3EE:
	move.l	#$4D4,d0
loc_13D3F4:
	move.w	d0,$16(a4)
	move.w	#$FAC0,$18(a4)
	move.w	#$56,$20(a4)
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_13D424(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13D41A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
