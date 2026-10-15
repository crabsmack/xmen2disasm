; ---------------------------------------------------------------------------
; sub_15F37C	[jt 2076]
; ---------------------------------------------------------------------------
sub_15F37C:
	link.w	a6,#$0
	movem.l	d3-d7/a2-a4,-(a7)
	lea.l	$15F572(pc),a3
	movea.l	$18(a6),a4
	move.b	$17(a6),d0
	beq.s	loc_15F3CC
	cmpi.b	#$1,d0
	beq.s	loc_15F3AA
	lea.l	loc_15F57E(pc),a3
	move.w	#$8,-$3B04(a5)
	move.w	#$0,-$3B06(a5)
	bra.s	loc_15F3AE
loc_15F3AA:
	lea.l	loc_15F566(pc),a3
loc_15F3AE:
	move.l	a4,d0
	lsl.l	#$2,d0
	lsr.w	#$2,d0
	swap	d0
	bset	#$1E,d0
	andi.l	#$7FFF0003,d0
	move.l	d0,($C00004).l
	lea.l	($C00000).l,a4
loc_15F3CC:
	move.l	$10(a6),d2
	movea.l	$C(a6),a1
	movea.l	$8(a6),a0
	moveq	#$8,d3
	moveq	#$0,d4
	move.b	(a0)+,d5
	asl.w	#$8,d5
	move.b	(a0)+,d5
	move.w	#$10,d6
	bsr.s	sub_15F3F0
	movem.l	(a7)+,d3-d7/a2-a4
	unlk	a6
	rts
