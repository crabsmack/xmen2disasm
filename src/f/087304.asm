; ---------------------------------------------------------------------------
; BroodBoss_StateChargeStart - BROODBOSS state: start charging (frame 6, claw speed -$A00, legs walking)
; In:  8(a6) = this
; Out: d0
; Evidence: claw +$16 = -$A00, +$92 = BroodClaw_Swing; LittleLeg_SetWalking(1); next BroodBoss_StateCharge
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateChargeStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movea.l	$96(a4),a0
	move.w	#$F600,$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	tst.l	$9E(a4)
	addq.w	#$8,a7
	beq.s	loc_087356
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$9E(a4),-(a7)
	jsr	LittleLeg_SetWalking(pc)
	addq.w	#$8,a7
loc_087356:
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateCharge(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
