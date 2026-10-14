; ---------------------------------------------------------------------------
; sub_160D06	[link-after-rts]
; ---------------------------------------------------------------------------
sub_160D06:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.w	$4A(a4),d0
	bne.w	loc_160DC4
	moveq	#$4,d0
	and.w	$4A(a4),d0
	bne.s	loc_160D46
	move.w	$5C(a4),d0
	ext.l	d0
	move.w	$5E(a4),d1
	ext.l	d1
	move.l	d1,d7
	add.l	d0,d7
	tst.w	d7
	ble.s	loc_160D40
	clr.w	d7
	moveq	#$0,d0
	move.l	d0,$18(a4)
loc_160D40:
	move.w	d7,$5C(a4)
	bra.s	loc_160DC4
loc_160D46:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_160DC4
	tst.w	$5C(a4)
	bgt.s	loc_160DC4
	move.l	#$FF676981,d7
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160D76
	move.l	-$174C(a5),d7
loc_160D76:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160DA2
	cmp.l	-$183C(a5),d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_160D9C
	move.l	d7,d0
	bra.s	loc_160DA0
loc_160D9C:
	move.l	-$183C(a5),d0
loc_160DA0:
	move.l	d0,d7
loc_160DA2:
	move.l	d7,d5
	asr.l	#$8,d5
	move.w	d5,d6
	sub.w	$32(a4),d6
	move.w	d6,d7
	sub.w	$64(a4),d7
	move.w	$60(a4),d0
	sub.w	d0,$5C(a4)
	cmp.w	$5C(a4),d7
	ble.s	loc_160DC4
	move.w	d7,$5C(a4)
loc_160DC4:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
