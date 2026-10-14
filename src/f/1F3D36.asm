; ---------------------------------------------------------------------------
; sub_1F3D36	[jt 2468]
; ---------------------------------------------------------------------------
sub_1F3D36:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$3,d7
	and.w	d0,d7
	tst.w	d7
	beq.s	loc_1F3D56
	movea.l	$BC(a4),a3
	bra.s	loc_1F3D5A
loc_1F3D56:
	movea.l	$76(a4),a3
loc_1F3D5A:
	move.l	a3,d0
	beq.s	loc_1F3DAA
	move.l	a3,$94(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$98(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$9A(a4)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$31,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$4,d1
	or.l	d0,d1
	move.w	d1,$C0(a4)
	lea.l	$2BA2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1F3DAA
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F3DAA
	addi.w	#$41,$9A(a4)
loc_1F3DAA:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
