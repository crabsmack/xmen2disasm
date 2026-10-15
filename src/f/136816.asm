; ---------------------------------------------------------------------------
; Hornet_MoveWaitThenFlyOff - Hornet motion: hover in place until timer +$6E is 0, then launch diagonally upward away from the arena
; In:  8(a6) = this
; Out: none
; Evidence: only Hornet_StepCirclePath while +$6E != 0; then vx = $500 (or -$500 when h-flipped), vy = -$500, +$94 = Hornet_MoveFlyOff
; ---------------------------------------------------------------------------
Hornet_MoveWaitThenFlyOff:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_13682C
	moveq	#$2,d0
	bra.s	loc_13682E
loc_13682C:
	moveq	#$1,d0
loc_13682E:
	move.w	d0,d7
loc_136830:
	tst.l	$98(a4)
	beq.s	loc_13683E
	move.l	a4,-(a7)
	jsr	Hornet_StepCirclePath(pc)
	addq.w	#$4,a7
loc_13683E:
	subq.w	#$1,d7
	bne.s	loc_136830
	tst.w	$6E(a4)
	bne.s	loc_136876
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	#$500,d7
	move.w	#$FB00,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_136866
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_136866:
	move.w	d7,$16(a4)
	move.w	d6,$18(a4)
	lea.l	Hornet_MoveFlyOff(pc),a0
	move.l	a0,$94(a4)
loc_136876:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
