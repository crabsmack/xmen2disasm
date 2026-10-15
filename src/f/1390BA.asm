; ---------------------------------------------------------------------------
; MaintRobot_StatePatrol - MaintRobot state (patrol mode, spawn word +$E set): walk back and forth reversing at walls until the cooldown ends, then stop to fire
; In:  8(a6) = this
; Out: d0 = flags & 8 or misc
; Evidence: +$6E < 1 -> save speed in +$9A, MaintRobot_StateStop; else flags bit $100 (blocked) -> clear it and negate +$16
; ---------------------------------------------------------------------------
MaintRobot_StatePatrol:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_1390E4
	move.w	$16(a4),$9A(a4)
	clr.w	$6C(a4)
	lea.l	MaintRobot_StateStop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_139100
loc_1390E4:
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_139100
	andi.w	#$FEFF,$4(a4)
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_139100:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
