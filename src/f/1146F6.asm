; ---------------------------------------------------------------------------
; sub_1146F6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1146F6:
	link.w	a6,#$FFFC
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$90(a4),d0
	tst.l	d0
	bls.s	loc_114760
	move.l	a4,-(a7)
	jsr	sub_11434A(pc)
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.b	#$1,d0
	shi.b	d3
	neg.b	d3
	beq.s	loc_114730
	tst.b	-$38DE(a5)
	beq.s	loc_11472C
	moveq	#$2,d0
	bra.s	loc_114746
loc_11472C:
	moveq	#$1,d0
	bra.s	loc_114746
loc_114730:
	moveq	#$0,d0
	move.b	$90(a4),d0
	cmpi.w	#$1,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_114744
	moveq	#$1,d0
	bra.s	loc_114746
loc_114744:
	moveq	#$0,d0
loc_114746:
	sub.b	d0,$90(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_1146F6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1147AC
loc_114760:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.b	$91(a4),d1
	ext.w	d1
	add.w	d0,d1
	move.w	d1,$92(a4)
	pea.l	-$4(a6)
	pea.l	-$2(a6)
	move.b	$91(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_11438A(pc)
	move.w	-$2(a6),$1A(a4)
	move.w	-$4(a6),$1C(a4)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1147B6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1147AC:
	movem.l	-$C(a6),d3/a4
	unlk	a6
	rts
