; ---------------------------------------------------------------------------
; BroodClaw_Move - vtable +$4E: copy speed/mode to the linked claw (mirrored offset), reset the swing length, run the motion function +$92 n times
; Evidence: TAS 49293-52535
; ---------------------------------------------------------------------------
BroodClaw_Move:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
loc_09B1BC:
	tst.l	$96(a4)
	beq.s	loc_09B1F8
	movea.l	$96(a4),a3
	move.l	$92(a4),$92(a3)
	move.w	$16(a4),$16(a3)
	move.b	$90(a4),$90(a3)
	move.w	$9A(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.l	$9C(a4),d0
	move.l	d0,$9C(a3)
	tst.b	$8B(a4)
	beq.s	loc_09B1F2
	moveq	#$0,d0
	bra.s	loc_09B1F4
loc_09B1F2:
	moveq	#$1,d0
loc_09B1F4:
	move.b	d0,$8B(a3)
loc_09B1F8:
	move.w	#$32,$9A(a4)
	tst.l	$92(a4)
	beq.s	loc_09B212
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	$92(a4),a0
	jsr	(a0)
	addq.w	#$8,a7
loc_09B212:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d7
	bgt.s	loc_09B1BC
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
