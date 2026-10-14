; ---------------------------------------------------------------------------
; sub_137382	[jt 1800]
; ---------------------------------------------------------------------------
sub_137382:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$387A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	-$1A80(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$1,$70(a4)
	ori.w	#$4082,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_137410
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_137408
	ori.b	#$4,$2E(a4)
	bra.s	loc_137456
loc_137408:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_137456
loc_137410:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_137440
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_137438
	ori.b	#$4,$2E(a4)
	bra.s	loc_137456
loc_137438:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_137456
loc_137440:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_137450
	ori.b	#$4,$2E(a4)
	bra.s	loc_137456
loc_137450:
	andi.b	#$FB,$2E(a4)
loc_137456:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
