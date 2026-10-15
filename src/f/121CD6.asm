; ---------------------------------------------------------------------------
; sub_121CD6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_121CD6:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	-$1A8C(a5),a4
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	moveq	#$10,d4
	and.b	$2E(a0),d4
	moveq	#$8,d0
	and.b	$2E(a0),d0
	seq.b	d3
	neg.b	d3
	move.b	d3,d5
	movea.l	$C(a6),a3
	moveq	#$60,d0
	move.l	d0,-(a7)
	pea.l	($FF).w
	move.l	a4,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	clr.w	d6
	moveq	#$10,d3
	lea.l	$C(a7),a7
loc_121D26:
	move.w	(a3),d7
	cmpi.w	#$FFF,d7
	beq.s	loc_121D8A
	clr.w	$4(a4)
	tst.b	d4
	beq.s	loc_121D3C
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_121D42
loc_121D3C:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_121D42:
	add.w	-$4(a6),d0
	move.w	d0,(a4)
	tst.b	d4
	bne.s	loc_121D50
	subi.w	#$10,(a4)
loc_121D50:
	tst.b	d5
	beq.s	loc_121D5C
	move.w	$2(a3),d0
	ext.l	d0
	bra.s	loc_121D64
loc_121D5C:
	move.w	$2(a3),d0
	ext.l	d0
	neg.l	d0
loc_121D64:
	add.w	-$2(a6),d0
	move.w	d0,$2(a4)
	tst.b	d5
	bne.s	loc_121D76
	subi.w	#$10,$2(a4)
loc_121D76:
	addq.w	#$8,a3
	addq.w	#$6,a4
	move.w	d6,d0
	addq.w	#$1,d6
	cmp.w	d6,d3
	bgt.s	loc_121D26
	movea.l	$8(a6),a0
	clr.b	$B7(a0)
loc_121D8A:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
