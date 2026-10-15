; ---------------------------------------------------------------------------
; loc_138FBC	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_138FBC:
	move.w	$4E(a3),d0
	cmp.w	$52(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_138FD0
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_138FE8
loc_138FD0:
	move.w	$52(a3),d0
	cmp.w	$4E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_138FE6
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_138FE8
loc_138FE6:
	moveq	#$0,d0
loc_138FE8:
	move.w	d0,$16(a4)
	bra.w	loc_1390B0
loc_138FF0:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d6
	moveq	#-$30,d0
	add.l	d0,d6
	move.w	$50(a3),d1
	ext.l	d1
	moveq	#$10,d2
	sub.l	d2,d1
	cmp.l	d1,d6
	sgt.b	d3
	neg.b	d3
	beq.s	loc_139014
	ext.l	d7
	move.l	d7,d1
	bra.s	loc_139032
loc_139014:
	move.w	$4C(a3),d0
	ext.l	d0
	moveq	#$10,d1
	add.l	d1,d0
	cmp.l	d0,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_13902E
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_139030
loc_13902E:
	moveq	#$0,d0
loc_139030:
	move.l	d0,d1
loc_139032:
	move.w	d1,$16(a4)
	bra.s	loc_1390B0
