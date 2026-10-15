; ---------------------------------------------------------------------------
; sub_1FBE96	[jt 2575]
; ---------------------------------------------------------------------------
sub_1FBE96:
	link.w	a6,#$FDFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$16(a6),d4
	move.w	$12(a6),d5
	movea.l	a4,a3
	move.w	(a3),d6
	move.w	d6,d0
	subq.w	#$1,d0
	beq.s	loc_1FBEBC
	subq.w	#$3,d0
	beq.s	loc_1FBF0E
	bra.w	loc_1FBFC2
loc_1FBEBC:
	move.w	$6(a4),d6
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	#$3FFF,d1
	and.l	d0,d1
	swap	d1
	clr.w	d1
	add.l	#$40000000,d1
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	#$C000,d2
	and.l	d0,d2
	moveq	#$E,d0
	lsr.l	d0,d2
	add.l	d1,d2
	move.l	d2,($C00004).l
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,d0
	addq.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$519A(a5)	; -> VDP_WriteWords
	addq.w	#$8,a7
	bra.w	loc_1FBFC2
loc_1FBF0E:
	move.w	$2(a3),-$2(a6)
	pea.l	-$202(a6)
	move.l	a3,d0
	addq.l	#$4,d0
	move.l	d0,-(a7)
	jsr	$4112(a5)	; -> sub_15F5CA
	movea.l	d0,a3
	lea.l	-$202(a6),a4
	clr.w	d7
	move.w	#$100,d3
	addq.w	#$8,a7
loc_1FBF30:
	moveq	#$F,d6
	and.w	(a4),d6
	move.w	d6,d0
	beq.s	loc_1FBF44
	subi.w	#$E,d0
	beq.s	loc_1FBF5C
	subq.w	#$1,d0
	beq.s	loc_1FBF74
	bra.s	loc_1FBF8C
loc_1FBF44:
	move.w	(a4),d0
	ext.l	d0
	move.w	#$FFF0,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d5
	move.l	d5,d1
	or.l	d0,d1
	move.w	d1,(a4)
	bra.s	loc_1FBF8C
loc_1FBF5C:
	move.w	(a4),d0
	ext.l	d0
	move.w	#$FFF0,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d4
	move.l	d4,d1
	or.l	d0,d1
	move.w	d1,(a4)
	bra.s	loc_1FBF8C
loc_1FBF74:
	move.w	(a4),d0
	ext.l	d0
	move.w	#$FFF0,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	move.w	$1A(a6),d1
	ext.l	d1
	or.l	d0,d1
	move.w	d1,(a4)
loc_1FBF8C:
	addq.w	#$2,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1FBF30
	jsr	$4D9A(a5)	; -> Irq_Disable
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	pea.l	-$202(a6)
	move.l	a3,-(a7)
	jsr	$4102(a5)	; -> sub_15F37C
	jsr	$4DA2(a5)	; -> Irq_Enable
	lea.l	$14(a7),a7
loc_1FBFC2:
	movem.l	-$21E(a6),d3-d7/a3-a4
	unlk	a6
	rts
