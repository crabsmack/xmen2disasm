; ---------------------------------------------------------------------------
; sub_11F2F2	[jt 1646]
; ---------------------------------------------------------------------------
sub_11F2F2:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$C(a6),a4
	movea.l	$8(a6),a0
	move.l	$8(a0),d4
	asr.l	#$8,d4
	move.l	$C(a0),d5
	asr.l	#$8,d5
	tst.l	$92(a0)
	bne.s	loc_11F322
	tst.l	-$1A98(a5)
	beq.w	loc_11F3D8
	move.l	-$1A98(a5),$92(a0)
loc_11F322:
	movea.l	$8(a6),a0
	movea.l	$92(a0),a0
	move.w	(a0),d6
	movea.l	$8(a6),a0
	andi.w	#$FFFE,$98(a0)
	movea.l	$8(a6),a0
	movea.l	$92(a0),a3
	addq.w	#$2,a3
	clr.w	d7
	bra.s	loc_11F39C
loc_11F344:
	cmpi.w	#$3E8,(a4)
	bge.s	loc_11F3A6
	movea.l	$8(a6),a0
	moveq	#$10,d0
	and.b	$2E(a0),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_11F360
	move.w	(a4),d0
	ext.l	d0
	bra.s	loc_11F366
loc_11F360:
	move.w	(a4),d0
	ext.l	d0
	neg.l	d0
loc_11F366:
	add.w	d4,d0
	move.w	d0,(a3)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.b	$2E(a0),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_11F382
	move.w	$2(a4),d0
	ext.l	d0
	bra.s	loc_11F38A
loc_11F382:
	move.w	$2(a4),d0
	ext.l	d0
	neg.l	d0
loc_11F38A:
	add.w	d5,d0
	move.w	d0,$2(a3)
	clr.w	$4(a3)
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$8,a4
	addq.w	#$6,a3
loc_11F39C:
	moveq	#$0,d0
	move.w	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	bgt.s	loc_11F344
loc_11F3A6:
	moveq	#$0,d0
	move.w	d7,d0
	ext.l	d6
	cmp.l	d0,d6
	ble.s	loc_11F3BA
	move.w	#$FFFF,(a3)
	move.w	#$FFFF,$2(a3)
loc_11F3BA:
	move.l	$8(a6),-(a7)
	jsr	sub_11F22C(pc)
	lea.l	sub_11EF96(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	clr.w	$6C(a0)
	addq.w	#$4,a7
loc_11F3D8:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
