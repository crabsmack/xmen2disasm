; ---------------------------------------------------------------------------
; BroodBoss_ActClaw - BROODBOSS script action: roar and send the claw out (claw mode 1)
; In:  8(a6) = this
; Out: none
; Evidence: Obj_SetAnim(this, $0889AA); claw +$16 = -$200, +$90 = 1, +$92 = BroodClaw_Swing; next step; jt 633
; ---------------------------------------------------------------------------
BroodBoss_ActClaw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1472(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	movea.l	$96(a4),a0
	move.w	#$FE00,$16(a0)
	movea.l	$96(a4),a0
	move.b	#$1,$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	tst.l	$92(a4)
	addq.w	#$8,a7
	bne.s	loc_086E52
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_086E7E
loc_086E52:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_086E66
	clr.w	$90(a4)
loc_086E66:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_086E7E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
