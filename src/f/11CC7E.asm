; ---------------------------------------------------------------------------
; sub_11CC7E	[jt 1583]
; ---------------------------------------------------------------------------
sub_11CC7E:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$9C(a4),d0
	sub.l	$8(a3),d0
	move.l	d0,d7
	asr.l	#$8,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11CCBE
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11CCC4
loc_11CCBE:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11CCC4:
	move.w	d0,d7
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_11CCDA
	ori.b	#$10,$2E(a4)
	bra.s	loc_11CCE0
loc_11CCDA:
	andi.b	#$EF,$2E(a4)
loc_11CCE0:
	cmpi.w	#$80,d7
	bge.s	loc_11CD26
	tst.l	$98(a4)
	bne.s	loc_11CCF8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11CD38
loc_11CCF8:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11CD0C
	clr.w	$96(a4)
loc_11CD0C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11CD38
loc_11CD26:
	clr.w	$6C(a4)
	lea.l	sub_11CC7E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11CD38:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
