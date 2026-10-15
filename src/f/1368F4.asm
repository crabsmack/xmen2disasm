; ---------------------------------------------------------------------------
; Hornet_MoveWaitThenRiseLeave - Hornet motion (dive-once pattern): hover at the bottom until +$6E is 0, then rise diagonally toward the centre
; In:  8(a6) = this
; Out: none
; Evidence: vx = $380 (-$380 when x px > $F0), vy = -$380, +$94 = Hornet_MoveRiseThenLeave; set by Hornet_MoveDiveOnce
; ---------------------------------------------------------------------------
Hornet_MoveWaitThenRiseLeave:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_13690A
	moveq	#$2,d0
	bra.s	loc_13690C
loc_13690A:
	moveq	#$1,d0
loc_13690C:
	move.w	d0,d7
loc_13690E:
	tst.l	$98(a4)
	beq.s	loc_13691C
	move.l	a4,-(a7)
	jsr	Hornet_StepCirclePath(pc)
	addq.w	#$4,a7
loc_13691C:
	subq.w	#$1,d7
	bne.s	loc_13690E
	tst.w	$6E(a4)
	bne.s	loc_136952
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.w	#$380,d7
	move.w	#$FC80,d6
	cmpi.w	#$F0,d5
	ble.s	loc_136942
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_136942:
	move.w	d7,$16(a4)
	move.w	d6,$18(a4)
	lea.l	Hornet_MoveRiseThenLeave(pc),a0
	move.l	a0,$94(a4)
loc_136952:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
