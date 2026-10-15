; ---------------------------------------------------------------------------
; sub_02D3AE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02D3AE:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$2D5,$96(a4)
	move.w	#$C8,$16(a4)
	move.w	#$C8,$18(a4)
	move.w	$94(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d5
	sub.l	$8(a4),d5
	move.w	$96(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$C(a4),d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_02D3F4
	move.l	d7,d0
	bra.s	loc_02D3F8
loc_02D3F4:
	move.l	d7,d0
	neg.l	d0
loc_02D3F8:
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_02D40A
	move.w	$18(a4),d1
	ext.l	d1
	bra.s	loc_02D412
loc_02D40A:
	move.w	$18(a4),d1
	ext.l	d1
	neg.l	d1
loc_02D412:
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,d6
	move.l	d5,d0
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.w	d0,$16(a4)
	ext.l	d0
	add.w	d0,$16(a4)
	clr.b	$AC(a4)
	ori.b	#$2,$AC(a4)
	ori.b	#$1,$AC(a4)
	clr.w	$6C(a4)
	lea.l	sub_02D456(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
