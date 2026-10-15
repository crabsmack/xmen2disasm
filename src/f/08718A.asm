; ---------------------------------------------------------------------------
; BroodBoss_ActStop - BROODBOSS script action: stop the claw and the little leg, next step
; In:  8(a6) = this
; Out: none
; Evidence: claw (+$96) speed/mode/handler cleared, LittleLeg_SetWalking(+$9E, 0); jt 637
; Found: jt 637
; ---------------------------------------------------------------------------
BroodBoss_ActStop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	tst.l	$9E(a4)
	beq.s	loc_0871C2
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$9E(a4),-(a7)
	jsr	LittleLeg_SetWalking(pc)
	addq.w	#$8,a7
loc_0871C2:
	tst.l	$92(a4)
	bne.s	loc_0871D4
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_087200
loc_0871D4:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0871E8
	clr.w	$90(a4)
loc_0871E8:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_087200:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
