; ---------------------------------------------------------------------------
; sub_013BAE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_013BAE:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d6
	asr.l	#$8,d6
	move.l	$A0(a4),d4
	asr.l	#$8,d4
	tst.w	$6E(a4)
	bgt.s	loc_013C1C
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_013BEC
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_013D1C
loc_013BEC:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_013C00
	clr.w	$96(a4)
loc_013C00:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_013D1C
loc_013C1C:
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d5
	asr.l	#$8,d5
	cmp.w	d6,d5
	addq.w	#$4,a7
	ble.s	loc_013C56
	move.w	d5,d7
	sub.w	#$64,d7
	cmp.w	$A4(a4),d7
	bge.s	loc_013C7A
	ext.l	d5
	move.l	d5,d0
	moveq	#$64,d1
	add.l	d1,d0
	move.w	$A6(a4),d2
	ext.l	d2
	cmp.l	d0,d2
	blt.s	loc_013C7A
	move.w	d5,d7
	add.w	#$64,d7
	bra.s	loc_013C7A
loc_013C56:
	move.w	d5,d7
	add.w	#$64,d7
	cmp.w	$A6(a4),d7
	ble.s	loc_013C7A
	ext.l	d5
	move.l	d5,d0
	moveq	#$64,d1
	sub.l	d1,d0
	move.w	$A4(a4),d2
	ext.l	d2
	cmp.l	d0,d2
	bgt.s	loc_013C7A
	move.w	d5,d7
	sub.w	#$64,d7
loc_013C7A:
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,d5
	sub.w	#$3C,d5
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_013C9A
	move.w	d7,d0
	sub.w	d6,d0
	bra.s	loc_013CA4
loc_013C9A:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_013CA4:
	move.w	d0,-$4(a6)
	ext.l	d5
	ext.l	d4
	move.l	d5,d0
	sub.l	d4,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_013CBC
	move.w	d5,d0
	sub.w	d4,d0
	bra.s	loc_013CC6
loc_013CBC:
	ext.l	d5
	ext.l	d4
	move.l	d5,d0
	sub.l	d4,d0
	neg.l	d0
loc_013CC6:
	move.w	d0,-$2(a6)
	moveq	#$10,d0
	cmp.w	-$4(a6),d0
	bge.s	loc_013CEA
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_013CE4
	ori.b	#$10,$2E(a4)
	bra.s	loc_013CEA
loc_013CE4:
	andi.b	#$EF,$2E(a4)
loc_013CEA:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	lsl.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,$16(a4)
	ext.l	d5
	ext.l	d4
	move.l	d5,d0
	sub.l	d4,d0
	lsl.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,$18(a4)
	clr.w	$6C(a4)
	lea.l	sub_013BAE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_013D1C:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
