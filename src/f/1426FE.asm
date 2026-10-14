; ---------------------------------------------------------------------------
; sub_1426FE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1426FE:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	move.l	$C(a3),d0
	sub.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,d5
	sub.w	#$1E,d5
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_14273C
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_142742
loc_14273C:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_142742:
	move.w	d0,d6
	cmp.w	$9E(a4),d6
	addq.w	#$4,a7
	bge.s	loc_142764
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_14275C
	tst.w	d7
	sgt.b	d0
	neg.b	d0
	bra.s	loc_142762
loc_14275C:
	tst.w	d7
	slt.b	d0
	neg.b	d0
loc_142762:
	beq.s	loc_142768
loc_142764:
	moveq	#$0,d0
	bra.s	loc_142784
loc_142768:
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_1425DE(pc)
	ext.l	d0
	addq.l	#$2,d0
	asr.l	#$2,d0
	movea.l	$C(a6),a0
	move.w	d0,(a0)
	moveq	#$1,d0
	addq.w	#$8,a7
loc_142784:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
