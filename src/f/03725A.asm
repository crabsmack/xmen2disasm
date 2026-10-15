; ---------------------------------------------------------------------------
; sub_03725A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03725A:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	a3,d0
	beq.w	loc_037382
	move.l	$8(a3),d7
	asr.l	#$8,d7
	move.b	$B2(a4),d6
	movea.l	-$3A72(a5),a0
	move.w	$10(a0),d0
	ext.l	d0
	moveq	#$26,d1
	add.l	d1,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$3800,d2
	and.w	(a0,d0.l),d2
	moveq	#$B,d0
	move.w	d2,d4
	lsr.w	d0,d4
	movea.l	-$3A72(a5),a0
	move.w	$12(a0),d0
	ext.l	d0
	add.l	d1,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$3800,d2
	and.w	(a0,d0.l),d2
	moveq	#$B,d0
	move.w	d2,d5
	lsr.w	d0,d5
	tst.w	d4
	beq.s	loc_0372C4
	tst.w	d5
	bne.s	loc_0372F6
loc_0372C4:
	moveq	#$2,d0
	move.l	d0,-(a7)
	jsr	$722(a5)	; -> sub_035872
	andi.b	#$F1,$9B(a4)
	move.w	#$FF9C,$A6(a4)
	move.w	#$1F40,$A8(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_03738C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_037382
loc_0372F6:
	tst.w	$AC(a4)
	bne.s	loc_03733A
	move.w	$AA(a4),$AC(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_037320
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_037924(pc)
	addq.w	#$4,a7
	bra.s	loc_037382
loc_037320:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_037382
loc_03733A:
	moveq	#$0,d0
	move.b	d6,d0
	cmpi.w	#$2,d0
	bne.s	loc_037364
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$C0,d0
	cmp.l	d7,d0
	bge.s	loc_037382
	andi.b	#$F3,$9B(a4)
	move.b	#$3,$B2(a4)
	bra.s	loc_037382
loc_037364:
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$80,d0
	cmp.l	d7,d0
	ble.s	loc_037382
	andi.b	#$F3,$9B(a4)
	move.b	#$2,$B2(a4)
loc_037382:
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
