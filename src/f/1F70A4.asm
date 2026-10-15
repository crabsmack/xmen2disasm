; ---------------------------------------------------------------------------
; loc_1F70A4	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1F70A4:
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	$8(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F70C0
	move.w	$8(a4),d0
	ext.l	d0
	bra.s	loc_1F70E2
loc_1F70C0:
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	$C(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F70DC
	move.w	$C(a4),d0
	ext.l	d0
	bra.s	loc_1F70E2
loc_1F70DC:
	move.l	$8(a3),d0
	asr.l	#$8,d0
loc_1F70E2:
	move.w	$8(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a3)
	move.w	$16(a3),d0
	asr.w	#$1,d0
	move.w	d0,$16(a3)
	bra.w	loc_1F71E8
loc_1F70FE:
	move.w	$C(a4),d0
	ext.l	d0
	move.l	$8(a3),d1
	asr.l	#$8,d1
	move.w	$8(a4),d2
	ext.l	d2
	cmp.l	d1,d2
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F7120
	move.w	$8(a4),d1
	ext.l	d1
	bra.s	loc_1F7142
loc_1F7120:
	move.l	$8(a3),d1
	asr.l	#$8,d1
	move.w	$C(a4),d2
	ext.l	d2
	cmp.l	d1,d2
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F713C
	move.w	$C(a4),d1
	ext.l	d1
	bra.s	loc_1F7142
loc_1F713C:
	move.l	$8(a3),d1
	asr.l	#$8,d1
loc_1F7142:
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a3)
	bra.w	loc_1F71E8
loc_1F714E:
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	$A(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F716A
	move.w	$A(a4),d0
	ext.l	d0
	bra.s	loc_1F718C
loc_1F716A:
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	$E(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F7186
	move.w	$E(a4),d0
	ext.l	d0
	bra.s	loc_1F718C
loc_1F7186:
	move.l	$C(a3),d0
	asr.l	#$8,d0
loc_1F718C:
	move.w	$A(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a3)
	bra.s	loc_1F71E8
loc_1F719C:
	move.w	$E(a4),d0
	ext.l	d0
	move.l	$C(a3),d1
	asr.l	#$8,d1
	move.w	$A(a4),d2
	ext.l	d2
	cmp.l	d1,d2
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F71BE
	move.w	$A(a4),d1
	ext.l	d1
	bra.s	loc_1F71E0
loc_1F71BE:
	move.l	$C(a3),d1
	asr.l	#$8,d1
	move.w	$E(a4),d2
	ext.l	d2
	cmp.l	d1,d2
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F71DA
	move.w	$E(a4),d1
	ext.l	d1
	bra.s	loc_1F71E0
loc_1F71DA:
	move.l	$C(a3),d1
	asr.l	#$8,d1
loc_1F71E0:
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a3)
