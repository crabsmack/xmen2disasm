; ---------------------------------------------------------------------------
; sub_12110E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_12110E:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	move.l	d0,d6
	asr.l	#$8,d6
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	sub.l	d2,d1
	move.l	d1,d7
	asr.l	#$8,d7
	moveq	#$14,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E62(a5)	; -> sub_1F638A
	tst.b	d0
	lea.l	$C(a7),a7
	beq.s	loc_12118E
	moveq	#$0,d0
	move.l	d0,$44(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6E(a4)
	clr.w	$6C(a4)
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_121234
loc_12118E:
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_12119C
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_1211A2
loc_12119C:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_1211A2:
	moveq	#$46,d1
	cmp.l	d0,d1
	ble.s	loc_121208
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1211B6
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1211BC
loc_1211B6:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1211BC:
	moveq	#$28,d1
	cmp.l	d0,d1
	ble.s	loc_121208
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_1211DC
	ori.b	#$10,$2E(a4)
	bra.s	loc_1211E2
loc_1211DC:
	andi.b	#$EF,$2E(a4)
loc_1211E2:
	lea.l	$342A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1210CE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_121234
loc_121208:
	tst.l	$44(a4)
	bne.s	loc_121222
	clr.w	$6C(a4)
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_121234
loc_121222:
	clr.w	$6C(a4)
	lea.l	sub_12110E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_121234:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
