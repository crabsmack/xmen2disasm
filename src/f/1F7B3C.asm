; ---------------------------------------------------------------------------
; loc_1F7B3C
; ---------------------------------------------------------------------------
loc_1F7B3C:
	move.w	$C(a4),d0
	ext.l	d0
	move.w	$8(a4),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	move.w	$E(a4),d0
	ext.l	d0
	move.w	$A(a4),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7B68
	move.l	d7,d0
	bra.s	loc_1F7B6C
loc_1F7B68:
	move.l	d7,d0
	neg.l	d0
loc_1F7B6C:
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F7B78
	move.l	d6,d1
	bra.s	loc_1F7B7C
loc_1F7B78:
	move.l	d6,d1
	neg.l	d1
loc_1F7B7C:
	cmp.l	d0,d1
	bgt.s	loc_1F7B9A
	tst.l	d7
	beq.s	loc_1F7B94
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d7,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,$4(a4)
	bra.s	loc_1F7BAC
loc_1F7B94:
	clr.w	$4(a4)
	bra.s	loc_1F7BAC
loc_1F7B9A:
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,$4(a4)
	ori.b	#$8,(a4)
loc_1F7BAC:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
