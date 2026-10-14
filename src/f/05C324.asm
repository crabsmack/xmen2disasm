; ---------------------------------------------------------------------------
; sub_05C324	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C324:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),-(a7)
	jsr	$CBA(a5)	; -> sub_05AED2
	jsr	$CC2(a5)	; -> sub_05B0C8
	pea.l	-$1758(a5)
	move.l	a4,-(a7)
	jsr	sub_05C1B2(pc)
	tst.b	d0
	lea.l	$C(a7),a7
	beq.s	loc_05C37C
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05C370
	lea.l	sub_05C3EE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05C3BA
loc_05C370:
	lea.l	sub_05C41A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05C3BA
loc_05C37C:
	pea.l	-$1848(a5)
	move.l	a4,-(a7)
	jsr	sub_05C1B2(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_05C3BA
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05C3B0
	lea.l	sub_05C3C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05C3BA
loc_05C3B0:
	lea.l	sub_05C41A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05C3BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
