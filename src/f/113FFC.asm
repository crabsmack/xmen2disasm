; ---------------------------------------------------------------------------
; loc_113FFC	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_113FFC:
	lea.l	sub_1143BC(pc),a0
	move.l	a0,$5C(a4)
	bra.w	loc_114100
loc_114008:
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	jsr	sub_113E80(pc)
	move.w	d0,d7
	move.l	$8(a4),d0
	asr.l	#$8,d0
	ext.l	d7
	move.l	d0,d4
	sub.l	d7,d4
	pea.l	-$1(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	move.w	d0,d6
	moveq	#$2,d0
	cmp.b	-$1(a6),d0
	lea.l	$14(a7),a7
	beq.s	loc_114046
	cmp.w	d6,d4
	blt.s	loc_11405A
loc_114046:
	lea.l	sub_11446C(pc),a0
	move.l	a0,$5C(a4)
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.b	d0,$91(a4)
	bra.s	loc_114080
loc_11405A:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.b	d6,d1
	sub.b	d0,d1
	move.b	d1,$91(a4)
	tst.b	-$1(a6)
	bne.s	loc_114078
	lea.l	sub_11446C(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_114080
loc_114078:
	lea.l	sub_1146C6(pc),a0
	move.l	a0,$5C(a4)
loc_114080:
	andi.b	#$EF,$2E(a4)
	bra.s	loc_114100
loc_114088:
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a4,-(a7)
	jsr	sub_113E80(pc)
	move.w	d0,d6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	ext.l	d6
	move.l	d0,d5
	add.l	d6,d5
	pea.l	-$1(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	move.w	d0,d7
	moveq	#$2,d0
	cmp.b	-$1(a6),d0
	lea.l	$14(a7),a7
	beq.s	loc_1140C6
	cmp.w	d7,d5
	bgt.s	loc_1140D4
loc_1140C6:
	lea.l	sub_11446C(pc),a0
	move.l	a0,$5C(a4)
	move.b	d6,$91(a4)
	bra.s	loc_1140FA
loc_1140D4:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.b	d7,d1
	sub.b	d0,d1
	move.b	d1,$91(a4)
	tst.b	-$1(a6)
	bne.s	loc_1140F2
	lea.l	sub_11446C(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1140FA
loc_1140F2:
	lea.l	sub_1146C6(pc),a0
	move.l	a0,$5C(a4)
loc_1140FA:
	ori.b	#$10,$2E(a4)
