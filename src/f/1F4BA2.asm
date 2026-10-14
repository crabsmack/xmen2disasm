; ---------------------------------------------------------------------------
; sub_1F4BA2
; ---------------------------------------------------------------------------
sub_1F4BA2:
	movea.l	$4(a7),a0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	a0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$C(a3),d5
	asr.l	#$8,d5
	movea.l	$30(a3),a4
	lea.l	$24(a4),a4
	moveq	#$0,d0
	move.b	$2F(a3),d0
	cmpi.b	#$FF,d0
	beq.s	loc_1F4BD4
	asl.w	#$2,d0
	adda.w	d0,a4
	asl.w	#$2,d0
	adda.w	d0,a4
loc_1F4BD4:
	moveq	#$10,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F4BFA
	move.b	$6(a4),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$4E(a3)
	move.b	$4(a4),d0
	ext.w	d0
	move.w	d6,d1
	sub.w	d0,d1
	move.w	d1,$52(a3)
	bra.s	loc_1F4C12
loc_1F4BFA:
	move.b	$4(a4),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$4E(a3)
	move.b	$6(a4),d0
	ext.w	d0
	add.w	d6,d0
	move.w	d0,$52(a3)
loc_1F4C12:
	moveq	#$8,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F4C38
	move.b	$5(a4),d0
	ext.w	d0
	move.w	d5,d1
	sub.w	d0,d1
	move.w	d1,$50(a3)
	move.b	$7(a4),d0
	ext.w	d0
	move.w	d5,d1
	sub.w	d0,d1
	move.w	d1,$4C(a3)
	bra.s	loc_1F4C50
loc_1F4C38:
	move.b	$7(a4),d0
	ext.w	d0
	add.w	d5,d0
	move.w	d0,$50(a3)
	move.b	$5(a4),d0
	ext.w	d0
	add.w	d5,d0
	move.w	d0,$4C(a3)
loc_1F4C50:
	movem.l	(a7)+,d5-d7/a3-a4
	rts
