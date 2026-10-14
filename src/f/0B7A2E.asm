; ---------------------------------------------------------------------------
; sub_0B7A2E	[jt 938]
; ---------------------------------------------------------------------------
sub_0B7A2E:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$4,a7
	bne.s	loc_0B7A5C
	subq.w	#$4,d7
	bra.s	loc_0B7A5E
loc_0B7A5C:
	addq.w	#$4,d7
loc_0B7A5E:
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0B7A76
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	bra.s	loc_0B7A80
loc_0B7A76:
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	neg.l	d0
loc_0B7A80:
	moveq	#$A,d1
	cmp.l	d0,d1
	ble.s	loc_0B7AD2
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$9A(a4)
	bne.s	loc_0B7AA4
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0B7B0A
loc_0B7AA4:
	addq.w	#$1,$98(a4)
	movea.l	$9A(a4),a0
	move.w	$98(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B7AB8
	clr.w	$98(a4)
loc_0B7AB8:
	movea.l	$9A(a4),a0
	addq.l	#$2,a0
	move.w	$98(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0B7B0A
loc_0B7AD2:
	cmp.w	d7,d6
	ble.s	loc_0B7AE4
	move.w	#$100,$16(a4)
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0B7AF0
loc_0B7AE4:
	move.w	#$FF00,$16(a4)
	ori.b	#$10,$2E(a4)
loc_0B7AF0:
	move.l	#$F000,$A6(a4)
	clr.w	$6C(a4)
	lea.l	sub_0B7A2E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B7B0A:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
