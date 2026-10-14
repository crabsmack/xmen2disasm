; ---------------------------------------------------------------------------
; sub_0BC0C4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BC0C4:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	ext.l	d7
	move.w	$A8(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BC0F6
	ext.l	d7
	move.w	$A8(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	bra.s	loc_0BC104
loc_0BC0F6:
	ext.l	d7
	move.w	$A8(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	neg.l	d1
loc_0BC104:
	moveq	#$F,d0
	cmp.l	d1,d0
	ble.s	loc_0BC134
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BC116
	moveq	#-$18,d0
	bra.s	loc_0BC118
loc_0BC116:
	moveq	#$18,d0
loc_0BC118:
	neg.b	d0
	ext.w	d0
	move.w	d0,$1E(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BC1A8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BC19E
loc_0BC134:
	cmp.w	$9E(a4),d7
	beq.s	loc_0BC140
	cmp.w	$A0(a4),d7
	bne.s	loc_0BC18C
loc_0BC140:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_0BC15E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC19E
loc_0BC15E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC172
	clr.w	$96(a4)
loc_0BC172:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC19E
loc_0BC18C:
	clr.w	$6C(a4)
	lea.l	sub_0BC0C4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BC19E:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
