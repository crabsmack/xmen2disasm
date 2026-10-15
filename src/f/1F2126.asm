; ---------------------------------------------------------------------------
; sub_1F2126	[jt 2437]
; ---------------------------------------------------------------------------
sub_1F2126:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$20,d0
	cmp.w	$9E(a4),d0
	ble.s	loc_1F218E
	move.l	#$2000,d0
	and.l	$90(a4),d0
	bne.s	loc_1F218E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F215A
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F2162
loc_1F215A:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F2162:
	beq.s	loc_1F218E
	move.b	#$1,-$38B2(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_1F2174
	moveq	#$2,d0
	bra.s	loc_1F2176
loc_1F2174:
	moveq	#$1,d0
loc_1F2176:
	ext.w	d0
	add.w	d0,$9E(a4)
	moveq	#$20,d0
	cmp.w	$9E(a4),d0
	bgt.s	loc_1F21B6
	ori.l	#$800,$90(a4)
	bra.s	loc_1F21B6
loc_1F218E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F21A2
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Released(a5),d0
	bra.s	loc_1F21AA
loc_1F21A2:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Released(a5),d0
loc_1F21AA:
	beq.s	loc_1F21B6
	move.b	#$1,-$38B2(a5)
	clr.w	$9E(a4)
loc_1F21B6:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
