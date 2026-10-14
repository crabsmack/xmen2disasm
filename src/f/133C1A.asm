; ---------------------------------------------------------------------------
; sub_133C1A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_133C1A:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d7,d2
	sub.l	d0,d2
	sge.b	d3
	neg.b	d3
	beq.s	loc_133C52
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	add.l	d1,d0
	move.l	d7,d2
	sub.l	d0,d2
	bra.s	loc_133C64
loc_133C52:
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d7,d2
	sub.l	d0,d2
	neg.l	d2
loc_133C64:
	moveq	#$5,d0
	cmp.l	d2,d0
	ble.s	loc_133CB4
	lea.l	$362A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	clr.w	$18(a4)
	clr.w	$20(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_133C94
	move.l	#$200,d0
	bra.s	loc_133C9A
loc_133C94:
	move.l	#$FFFFFE00,d0
loc_133C9A:
	move.w	d0,$16(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_133CD0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_133CC6
loc_133CB4:
	clr.w	$6C(a4)
	lea.l	sub_133C1A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_133CC6:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
